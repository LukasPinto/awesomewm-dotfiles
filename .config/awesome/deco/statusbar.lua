-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

-- Custom widgets from awesome-wm-widgets
-- https://github.com/streetturtle/awesome-wm-widgets.git

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()


local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock(' %d/%m/%y %H:%M ')

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))
 -- aca se crea la caja y se puede moficar la forma
  -- Create a taglist widget

-- este se le pasa originalmente al layout
--   s.mytaglist = awful.widget.taglist {
--     screen  = s,
--     filter  = awful.widget.taglist.filter.all,
--     layout   = {
--       spacing = 20,
--       spacing_widget = {
--           color  = '#dddddd',
--           shape  = gears.shape.powerline,
--           widget = wibox.widget.separator,
          
--       },
--       layout  = wibox.layout.fixed.horizontal
--   },

--   widget_template = {
--         {
--             {
--                 {
--                     {
--                         {
--                             id     = 'index_role',
--                             widget = wibox.widget.textbox,
--                         },
--                         margins = 4,
--                         widget  = wibox.container.margin,
--                     },
--                     bg     = '#dddddd',
--                     shape  = gears.shape.circle,
--                     widget = wibox.container.background,
--                 },
--                 {
--                     {
--                         id     = 'icon_role',
--                         widget = wibox.widget.imagebox,
--                     },
--                     margins = 2,
--                     widget  = wibox.container.margin,
--                 },
--                 {
--                     id     = 'text_role',
--                     widget = wibox.widget.textbox,
--                 },
--                 layout = wibox.layout.fixed.horizontal,
--             },
--             left  = 0,
--             right = 0,
--             widget = wibox.container.margin,
            
--         },
--         id     = 'background_role',
--         widget = wibox.container.background,
--         -- Add support for hover colors and an index label
--         create_callback = function(self, c3, index, objects) --luacheck: no unused args
--             self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--             self:connect_signal('mouse::enter', function()
--                 if self.bg ~= '#ff0000' then
--                     self.backup     = self.bg
--                     self.has_backup = true
--                 end
--                 self.bg = '#ff0000'
--             end)
--             self:connect_signal('mouse::leave', function()
--                 if self.has_backup then self.bg = self.backup end
--             end)
--         end,
--         update_callback = function(self, c3, index, objects) --luacheck: no unused args
--             self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
--         end,
    
--   },
 
-- }


s.mytaglist = awful.widget.taglist {
  screen  = s,
  filter  = awful.widget.taglist.filter.all,
--   style   = {
--     shape = function(cr, width, height)
--       gears.shape.powerline (cr, width, height, 10)
--    end,
--    spacing = -5,
   
-- },
  layout   = {
      spacing = 0,
      spacing_widget = {
          color  = '#8be9fd',
          shape  = gears.shape.powerline,
          widget = wibox.widget.separator,
          
      },
      layout  = wibox.layout.fixed.horizontal
  },
  widget_template = {
      {
          {
              {
                  {
                      {
                          id     = 'index_role',
                          widget = wibox.widget.textbox,
                      },
                      margins = -4,
                      widget  = wibox.container.margin,
                  },
                  bg     = '#44475a',
                  shape  = gears.shape.circle,
                  widget = wibox.container.background,
              },
              {
                  {
                      id     = 'icon_role',
                      widget = wibox.widget.imagebox,
                  },
                  margins = 1,
                  widget  = wibox.container.margin,
              },
              {
                  id     = 'text_role',
                  widget = wibox.widget.textbox,
              },
              layout = wibox.layout.fixed.horizontal,
          },
          left  = 5,
          right = 5,
          widget = wibox.container.margin
      },
      id     = 'background_role',
      widget = wibox.container.background,
      
    
      -- Add support for hover colors and an index label
      create_callback = function(self, c3, index, objects) --luacheck: no unused args
          self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
          self:connect_signal('mouse::enter', function()
              if self.bg ~= '#44475a' then
                  self.backup     = self.bg
                  self.has_backup = true
              end
              self.bg = '#44475a'
          end)
          self:connect_signal('mouse::press', function()
            if self.bg ~= '#44475a' then
                self.backup     = self.bg
                self.has_backup = true
            end
            self.bg = '#44475a'
        end)
          self:connect_signal('mouse::leave', function()
              if self.has_backup then self.bg = self.backup end
          end)
      end,
      update_callback = function(self, c3, index, objects) --luacheck: no unused args
          self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
      end,
  },
  buttons = taglist_buttons
}

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s ,height = 25, })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      RC.launcher,
      s.mytaglist,
      s.mypromptbox,
    --   {s.mytaglist,
    --   widget = wibox.container.background,
    --   bg = "#282A36",
    --   --opacity = 1,
    --   --shape_clip = true,
    -- },

    },
    s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        spacing = 2,
        spacing_widget = {
          color  = '#dddddd',

        },
      ykeyboardlayout,
      wibox.widget.systray(),
      volume_widget(),
      brightness_widget({
	program = "brightnessctl",
	      --type = "icon_and_text"
      }),
      batteryarc_widget({
        show_current_level = true,
        arc_thickness = 1,
      }),
      mytextclock,
      s.mylayoutbox,
    },
  }
end)
-- }}}
