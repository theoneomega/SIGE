class SearchsController < ApplicationController
  def index
    # @events = Event.all
    # @offices = Office.all
    # @justice_net = JusticeNet.all
    @colaborations = Colaboration.all
    @pdf_investigation = PdfInvestigation.all


  end

  def colaboraciones
    @colaboration = Colaboration.where(received_for: 'OTRO')
    render json: @colaboration
  end
end
