require 'bh/core_ext/rails/base_helper'
require 'bh/core_ext/rails/form_builder'

module Bh
  module Rails
    module Helpers
      include BaseHelper
      include ActionView::Helpers::FormTagHelper # for form_tag

      def form_tag(url_for_options = {}, options = {}, &block)
        options[:layout] ||= 'navbar' if Bh::Stack.find(Bh::Navbar)
        add_form_options!(options) if options[:layout]
        html = super url_for_options, options, &block

        if Bh::Stack.find(Bh::Nav)
          container = Bh::Base.new(self) { html }
          container.render_tag :li
        else
          html
        end
      end

    private

      def add_form_options!(options)
        options ||= {}
        options[:role] =  'form'
        append_class! options, class_for(options[:layout])
        options.merge! builder: FormBuilder
      end

      def class_for(layout)
        case layout.to_s
          when 'navbar' then 'navbar-form'
          when 'inline' then 'form-inline'
          when 'horizontal' then 'form-horizontal'
        end
      end
    end
  end
end
