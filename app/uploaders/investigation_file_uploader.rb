# encoding: utf-8

class InvestigationFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes
  storage :file

  def store_dir
    "respaldos/casos/#{model.created_at.year}/#{model.created_at.month}/#{model.investigation_id}"
  end
  process :set_content_type
  process :save_content_type_and_size_in_model

  def save_content_type_and_size_in_model
    model.anb_content_type = file.content_type if file.content_type
    model.anb_file_size = file.size
  end

  def extension_white_list
    %w(anb)
  end


end
