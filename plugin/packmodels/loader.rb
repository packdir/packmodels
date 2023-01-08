
require 'sketchup'

Sketchup.require 'packmodels/main'
Sketchup.require 'packmodels/layout/draw2d'

module Packdir
  module Packmodels

    unless file_loaded?(__FILE__)
      toolbar = UI::Toolbar.new "Packmodels"

      cmd = UI::Command.new("cxhk") { self.start }
      cmd.small_icon = "images/logo.png"
      cmd.large_icon = "images/logo.png"
      cmd.tooltip = "Packmodels"
      cmd.status_bar_text = "Packmodels"
      cmd.menu_text = "Packmodels"
      toolbar.add_item(cmd)

      # Clear console
      cmd = UI::Command.new("Clear") { self.clear_console }
      cmd.small_icon = "images/check.png"
      cmd.large_icon = "images/check.png"
      cmd.tooltip = "Clear console"
      cmd.status_bar_text = "Clear Ruby console"
      cmd.menu_text = "Clear Ruby console"
      toolbar.add_item(cmd)

      toolbar.show
    end

  end
end
