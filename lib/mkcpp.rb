require 'fileutils'

module Mkcpp
  module Application
    H_PATH_KEY='h='
    CPP_PATH_KEY='cpp='
    CONFIG_FILENAME='.mkcpp'

    def self.run!
      arg = ARGV.shift
      # split path/to/filename into path/to and filename
      path = File.dirname(arg)
      filename = File.basename(arg)
      # create .h and .cpp files
      make_header_file(path, filename)
      make_cpp_file(path, filename)
    end

    private

    def self.make_header_file(path, filename)
      path = "#{path_from_config_with_key(H_PATH_KEY)}/#{path}"
      FileUtils.mkdir_p(path)
      make_file path, filename, 'h'
    end

    def self.make_cpp_file(path, filename)
      path = "#{path_from_config_with_key(CPP_PATH_KEY)}/#{path}"
      FileUtils.mkdir_p(path)
      make_file path, filename, 'cpp'
    end

    def self.make_file(path, filename, extension)
      file_path = "#{path}/#{filename}.#{extension}"
      unless File.exists?(file_path)
         File.new(file_path, 'w')
      end
    end

    def self.path_from_config_with_key(key)
      path = ''
      File.open(CONFIG_FILENAME, 'r') do |file|
        file.each_line do |line|
          if line.start_with?(key)
            path = line.sub(key, '').gsub('\n', '').gsub('\t', '').gsub('\r', '').gsub(/\s+/, '')
          end
        end
      end
      path
    end
  end
end
