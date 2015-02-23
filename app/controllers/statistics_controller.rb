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
      end
      @a = []
      @r.each do |s|
        @a << s[:persons_total]
      end
      @sum= 0
      if !@a.nil?
        @a.each { |e| @sum += e }
      end
    end
    contador_personas_null=0
    @r.each do |acu|
      if acu[:persons_total]!=0
        contador_personas_null +=1
      end
    end
    if contador_personas_null==0
      contador_personas_null = 1
    end


    @acumulador_eventos = []
    @r.each do |a|
      @acumulador_eventos << a[:total_events]
    end
    suma_eventos=0
    if !@acumulador_eventos.nil?
      @acumulador_eventos.each { |d| suma_eventos += d}
    end
    contador_events_null=0
    @r.each do |acu|
      if acu[:persons_total]!=0
        contador_events_null +=1
      end
    end
    if contador_events_null==0
      contador_events_null = 1
    end


    @acumulador_oficios = []
    @r.each do |a|
      @acumulador_oficios << a[:total_offices]
    end
    suma_oficios=0
    if !@acumulador_oficios.nil?
      @acumulador_oficios.each { |d| suma_oficios += d}
    end
    contador_oficios_null=0
    @r.each do |acu|
      if acu[:persons_total]!=0
        contador_oficios_null +=1
      end
    end
    if contador_oficios_null==0
      contador_oficios_null = 1
    end


    @acumulador_colaboraciones = []
    @r.each do |a|
      @acumulador_colaboraciones << a[:total_colaborations]
    end
    suma_colaboraciones=0
    if !@acumulador_colaboraciones.nil?
      @acumulador_colaboraciones.each { |d| suma_colaboraciones += d}
    end
    contador_colaboraciones_null=0
    @r.each do |acu|
      if acu[:persons_total]!=0
        contador_colaboraciones_null +=1
      end
    end
    if contador_colaboraciones_null==0
      contador_colaboraciones_null = 1
    end


    @acumulador_justicias = []
    @r.each do |a|
      @acumulador_justicias << a[:total_justices]
    end
    suma_justicias=0
    if !@acumulador_justicias.nil?
      @acumulador_justicias.each { |d| suma_justicias += d}
    end
    contador_justicias_null=0
    @r.each do |acu|
      if acu[:persons_total]!=0
        contador_justicias_null +=1
      end
    end
    if contador_justicias_null==0
      contador_justicias_null = 1
    end




# flash[:error]= "#{suma_eventos} entre #{contador_events_null} --> #{@acumulador_eventos}"
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(:height => 500 )
      f.title({ :text=>"Estadisticas"})
      f.options[:xAxis][:categories] = ['Eventos', 'Colaboraciones', 'Oficios', 'Justicias', 'Personas']
      # f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:color=>"black"} ])
      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)

      @r.each do |record|
        if record[:persons_total]>0
          f.series(:type => 'column', :name => record[:analyst_number], :data =>
              [ record[:total_events], record[:total_colaborations],
                record[:total_offices], record[:total_justices],
                record[:persons_total]])
        end
        # f.series(:type => 'spline', :name => record[:analyst_number], :data =>  [ record[:total_events], record[:total_colaborations],
        #                                                                           record[:total_offices], record[:total_justices],
        #                                                                           record[:persons_total]])
      end

      # f.series(:type=> 'spline',:name=> 'Average', :data=> [suma_eventos/contador_events_null,
      #                                                       suma_colaboraciones/contador_colaboraciones_null,
      #                                                       suma_oficios/contador_oficios_null,
      #                                                       suma_justicias/contador_justicias_null,
      # @sum/contador_personas_null])
      # f.series(:type=> 'pie',:name=> 'Total consumption',
      #          :data=> [
      #              {:name=> 'Jane', :y=> 13, :color=> 'red'},
      #              {:name=> 'John', :y=> 23,:color=> 'green'},
      #              {:name=> 'Joe', :y=> 19,:color=> 'blue'}
      #          ],
      #          :center=> [100, 80], :size=> 100, :showInLegend=> false)
    end
  end
end
