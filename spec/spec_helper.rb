# Make sure Ruby can find the gems we've specified in our Gemfile and gemspec.
require 'bundler'
Bundler.setup(:test)

# Pull in project-specific RSpec support files.
SPEC_DIR = File.dirname(__FILE__)
Dir["#{SPEC_DIR}/support/*.rb"].each{ |f| require f }

# Make sure Ruby can find our gem.
lib_path = File.expand_path("#{SPEC_DIR}/../lib")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

# These tests require ActiveModel and ActionView.
require 'active_model'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'
require 'active_support/core_ext/string/inflections'

# Pull in the list_for method that we're testing.
require 'list_for'

# Make sure the test are run in a context that includes list_for and everything it needs.
include ListFor::Helper
include ActionController::RecordIdentifier
include ActionView::Helpers::FormTagHelper
