module MazeCrosser
  # Module containing a file validator.
  module FileChecker
    ALLOWED_EXTENSIONS = %w[txt].freeze

    def check(file)
      raise ArgumentError, 'Invalid file' unless valid_file? file

      file
    end

    private

    def valid_file?(file)
      file_exists?(file) && allowed_extension?(file)
    end

    def file_exists?(file)
      File.file? file
    end

    def allowed_extension?(file)
      file =~ /^.+\.(#{ALLOWED_EXTENSIONS.join('|')})$/
    end
  end
end
