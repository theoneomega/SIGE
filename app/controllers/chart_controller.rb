class ChartController < ApplicationController
  def index
    if params[:commit].present?
      # @eventos = Event.where('event_date between ?  and ?', params[:inicio].to_date, params[:fin].to_date)
      # @eventos = Event.all

      # @data = Event.select(:crime_id).where("event_date between ? and ?",params[:inicio].to_date, params[:fin].to_date).pluck(:crime_id).uniq
      # @data = Crime.where('id in (?)', Event.select(:crime_id).where("event_date between ? and ?",params[:inicio].to_date, params[:fin].to_date).uniq ).map(&:crime).to_json
      # @a = Event.where("event_date between ? and ?",params[:inicio].to_date, params[:fin].to_date).group(:crime_id).count
      # @a = Event.where("event_date between ? and ?",params[:inicio].to_date, params[:fin].to_date).includes(:crime).group(:crime).count

      @a = Event.joins(:crime).where("event_date between ? and ?",params[:inicio].to_date, params[:fin].to_date).group("crimes.crime").count
      @b = Event.select("trunc(event_date,'dd') as day").group("trunc(event_date, 'dd')").where("event_date between ? and ? and crime_id = 1",params[:inicio].to_date, params[:fin].to_date+1.day).count

    end
  end
end
