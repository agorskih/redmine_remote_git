require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter do |source_file|
    source_file.filename.start_with?('plugins')
  end
end