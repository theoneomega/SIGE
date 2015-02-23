class PdfInvestigation < ActiveRecord::Base
  attr_accessible :analyst_id, :analyst_number, :investigation_id, :pdf, :pdf_content,
                  :pdf_content_type, :pdf_file_size, :pdf_updated_at, :visible

  belongs_to :analyst
  belongs_to :investigation

  mount_uploader :pdf, InvestigationPdfUploader
  audited

  before_save :update_asset_attributes, :extract_text_from_pdf

  def extract_text_from_pdf
    `pdftotext #{Rails.root}/public#{self.pdf_url}`
    self.pdf_content = File.read "#{Rails.root}/public#{self.pdf_url.gsub('.pdf','.txt')}"
  end

  def update_asset_attributes
    if pdf.present? && pdf_changed?
      self.pdf_content_type = pdf.file.content_type
      self.pdf_file_size = pdf.file.size
    end
  end


  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
        "name" => read_attribute(:pdf),
        "size" => read_attribute(:pdf_file_size),
        "investigation_id" => read_attribute(:investigation_id),
        "user" => read_attribute(:analyst_number),
        "url" => pdf_url,
        "delete_url" => pdf_investigation_path(self),
        "visible" => read_attribute(:visible),
        "contenido" => read_attribute(:pdf_content),
        "delete_type" => "DELETE"
    }
  end
end

