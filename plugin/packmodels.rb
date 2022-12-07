#
# packmodels - Model management and sharing
#

require	'sketchup'
require 'extensions'

module Packdir
  module Packmodels

    FOLDER = 'packmodels'
    LOADER = "loader"

    REL_PATH = File.join FOLDER, LOADER
    ABS_PATH = File.join File.dirname(__FILE__), REL_PATH

    VERSION = '0.0.1'
    AUTHOR = 'Henry Hu'
    YEAR = '2022'
    LEGAL = 'All Rights Reserved'

    if YEAR.empty?
      COPYRIGHT = "#{LEGAL}"
    elsif YEAR =~ /\A\D/
      COPYRIGHT = "#{YEAR}, #{LEGAL}"
    else
      COPYRIGHT = "©#{YEAR}, #{LEGAL}"
    end

    CAPTION = 'Packmodals'

    unless defined?(@@extension)
      @@extension = SketchupExtension.new( CAPTION, REL_PATH )
      @@extension.instance_eval %{
        description= 'Model management and sharing.'
        version= "#{VERSION}"
        creator= "#{AUTHOR}"
        copyright= "#{COPYRIGHT}"
      }
      Sketchup.register_extension( @@extension, true )
    end

    def extension
      @@extension
    end
    module_function :extension

  end
end
