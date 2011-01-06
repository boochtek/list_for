# Use Nokogiri to find HTML elements by CSS selector.
require 'nokogiri'

RSpec::Matchers.define :have_tag do |tag_selector|
  match do |string|
    html = Nokogiri::HTML(string)
    html.css(tag_selector).size.should >= 1
  end

  failure_message_for_should do |string|
    "expected to find HTML element matching CSS selector '#{tag_selector}' in:\n#{string}"
  end

  failure_message_for_should_not do |string|
    "expected not to find HTML element matching CSS selector '#{tag_selector}' in:\n#{string}"
  end

  description do
    "have a CSS tag of #{expected}"
  end
end
