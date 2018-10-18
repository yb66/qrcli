require "qrcli/version"

require 'rqrcode'

# QR codes on the command line.
module Qrcli

  # ANSI Escapes
  # @see http://ascii-table.com/ansi-escape-sequences.php
  BLACK = "\e[40m"
  WHITE = "\e[107m"
  DEFAULT = "\e[0m"
  SPACER = "  "

  # A wrapper around RQRCode::QRCode.
  class QR

    class << self
      # Make a qr code of the smallest possible size
      # @see #initialize
      def minimal text, **opts
        _opts = opts.merge(size: 1)
        qr = new( text, _opts )
        begin
          qr.generate
        rescue RQRCode::QRCodeRunTimeError => e
          qr.options[:size] += 1
          fail e if qr.options[:size] > 10
          retry
        end
      end
    end


    # @param text [String] The text to convert into a QR code.
    # @param options [Hash] options to pass on to the generator.
    def initialize( text, **options )
      @text = text
      @options = options
    end

    attr_reader :text, :options


    # An instance of RQRCode::QRCode
    # @see RQRCode::QRCode
    def qr
      generate
      @qr
    end


    # Generate a QR code
    # @return [self]
    def generate
      @qr ||= RQRCode::QRCode.new(@text, @options)
      self
    end


    # Format for the command line.
    # @return [String]
    def format
      if @format.nil?
        generate
        width = @qr.module_count
        pad = WHITE + SPACER * (width + 2) + BLACK

        lines = @qr.to_s(
          :true   => BLACK + SPACER,
          :false  => WHITE + SPACER
        ).split("\n")
        lines.map! { |line| WHITE + SPACER + line + WHITE + SPACER + DEFAULT }

        @format = ([pad] + lines + [pad]).join("\n")
      end
      @format
    end
  end
end
