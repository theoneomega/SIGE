class StatisticsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @users = Analyst.includes(:events).includes(:offices).includes(:colaborations).includes(:justice_nets)
    @r=[]
    if params[:start_date].present? and params[:end_date].present?

      if params[:buscar]
        norte = params[:norte].blank? ? "" : Area.find_by_description('NORTE').id
        sur = params[:sur].blank? ? "" : Area.find_by_description('SUR').id
        occidente = params[:occidente].blank? ? "" : Area.find_by_description('OCCIDENTE').id
        centro = params[:centro].blank? ? "" : Area.find_by_description('CENTRO').id
      end
      # zonas ="#{norte} #{sur} #{occidente} #{centro}"


      @users.where('area_id = ? or area_id = ? or area_id = ? or area_id = ?', norte,sur,centro,occidente).each do |users|
        total_eventos=users.events.where('event_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).count
        total_colaboraciones=users.colaborations.where('colaboration_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).count
        total_oficios=users.offices.where('office_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).count
        total_justicias=users.justice_nets.where('received_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).count
        total_personas_eventos=0
        total_personas_colaboraciones=0
        total_personas_oficios=0
        total_personas_justicias=0
        total = 0
        users.events.where('event_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).each do |event|

          total_personas_eventos+= event.person.count
          total += event.person.count
        end
        users.colaborations.where('colaboration_date between ? and  ?', params[:start_date].to_date, params[:end_date].to_date).each do |colaboration|
          # total_colaboraciones=colaboration.count
          total_personas_colaboraciones+= colaboration.person.count
          total+=colaboration.person.count
        end
        users.offices.where('office_date between ? and ?', params[:start_date].to_date, params[:end_date].to_date).each do |office|
          # total_oficios=office.count
          total_personas_oficios+=office.person.count
          total+=office.person.count
        end
        users.justice_nets.where('received_date between ? and ?', params[:start_date].to_date, params[:end_date].to_date).each do |justice|
          # total_justicias=justice.count
          total_personas_justicias+=justice.person.count
          total+=justice.person.count
        end
        @r << {analyst_number: users.analyst,
               analyst_name: users.fullname,
               analyst_zone: users.area.description,
               persons_total: total, #total de personas por todo
               total_events: total_eventos,
               total_event_persons: total_personas_eventos,
               total_colaborations: total_colaboraciones,
               total_colaboration_person: total_personas_colaboraciones,
               total_offices: total_oficios,
               total_office_persons: total_personas_oficios,
               total_justices: total_justicias,
               total_person_justices: total_personas_justicias
        }
        @a = []
      end
      @r.each do |s|
        @a << s[:persons_total]
      end

      @sum= 0

      if !@a.nil?
        @a.each { |e| @sum += e }
      end

    end
  end
end
