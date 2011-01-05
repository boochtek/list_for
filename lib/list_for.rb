require 'action_view'
require 'list_for/version'
require 'list_for/helper'

ActionView::Base.send :include, ListFor::Helper
