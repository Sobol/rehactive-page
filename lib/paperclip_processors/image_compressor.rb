require "paperclip"

module Paperclip
  # Compresses the JPEG and PNG files
  class ImageCompressor < Processor

    attr_accessor :format

    def initialize(file, options = {}, attachment = nil)
      super
      @file = file
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      reg_jpegoptim = /(jpg|jpeg|jfif)/i
      reg_optipng = /(png|bmp|gif|pnm|tiff)/i

      begin
        if @current_format =~ reg_jpegoptim
          compress_with_jpegoptim(@file)
        elsif @current_format =~ reg_optipng
          compress_with_optpng(@file)
        else
          Rails.logger.error("File: #{file.path} is not compressed!")
        end
      rescue Exception => exc
        p "Error has ocured while processing image with jpoptim"
        p "Error: #{exc}"
      end

      f = File.open @file.path
      f
    end

    def compress_with_jpegoptim(file)
      current_size = File.size(file.path)
      Paperclip.run("jpegoptim", "-o --strip-all #{file.path}")
      compressed_size = File.size(file.path)
      compressed_ratio = (current_size - compressed_size) / current_size.to_f
      p "#{current_size} - #{compressed_size} - #{compressed_ratio}"
      p "JPEG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%"
    end

    def compress_with_optpng(file)
      current_size = File.size(file.path)
      Paperclip.run("optipng", "-o7 --strip=all #{file.path}")
      compressed_size = File.size(file.path)
      compressed_ratio = (current_size - compressed_size) / current_size.to_f
      p "#{current_size} - #{compressed_size} - #{compressed_ratio}"
      p "PNG family compressed, compressed: #{ '%.2f' % (compressed_ratio * 100) }%"
    end
  end
end

