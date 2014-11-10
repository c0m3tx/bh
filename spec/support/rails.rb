require 'action_dispatch'
require 'active_support'
require 'action_view'
require 'bh/helpers/alert_box_helper'
require 'bh/helpers/button_helper'
require 'bh/helpers/cdn_helper'
require 'bh/helpers/dropdown_helper'
require 'bh/helpers/glyphicon_helper'
require 'bh/helpers/horizontal_helper'
require 'bh/helpers/icon_helper'
require 'bh/helpers/modal_helper'
require 'bh/helpers/nav_helper'
require 'bh/helpers/navbar_helper'
require 'bh/helpers/panel_helper'
require 'bh/helpers/panel_row_helper'
require 'bh/helpers/progress_bar_helper'
require 'bh/helpers/vertical_helper'

require 'bh/core_ext/rails/button_to_helper'
require 'bh/core_ext/rails/link_to_helper'

# A view that behaves like a Rails/ActionView view
class RailsView
  include ActionView::Context # for capture
  include ActionView::Helpers::RenderingHelper # for render
  include ActionView::Helpers::TagHelper # for content_tag
  include ActionView::Helpers::UrlHelper # for link_to

  include Bh::Helpers
  include Bh::Rails::Helpers

  def initialize
  end

  def request
    ActionDispatch::Request.new 'REQUEST_METHOD' => 'GET'
  end

  def protect_against_forgery?
    false
  end
end