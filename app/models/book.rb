class Book < ApplicationRecord
  VIM = 2_978_247 # character count war and peace

  mount_uploader :attached_file, BookUploader

  def self.txt_size(file)
    file = File.open(file,'r')
    size = file.read.squish.size
    file.close
    size
  end

  def self.epub_size(file)
    arr = Array.new
    book = EPUB::Parser.parse(file)
    book.each_page_on_spine do |page|
      arr << page.read
    end
    arr.join(' ').gsub(/<\/[^>]*>/, ' ').gsub(/<[^>]*>/, '').squish.size
  end
end
