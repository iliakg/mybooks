class BookUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "files/#{model.id}"
  end

  def cache_dir
    'files/tmp'
  end

  process :save_length

  def save_length
    if file.content_type == 'text/plain'
      model.length = Book.txt_size(file.file)
    elsif file.content_type == 'application/epub+zip'
      model.length = Book.epub_size(file.file)
    end
  end
end
