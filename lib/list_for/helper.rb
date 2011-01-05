module ListFor
  module Helper
    # Creates a table for supplied array of ActiveModel objects.
    # Yields a builder, with which you can specify how to display the fields.
    #
    # Example:
    #
    #   list_for @users do |l|
    #     l.attribute :name
    #     l.attribute :email
    #   end
    #
    def list_for(object_array, options={}, &block)
      return options[:empty_message] || 'There are no items to display' if object_array.empty?
      content = '' # TODO
      content_tag(:table, content, options)
    end
  end
end

