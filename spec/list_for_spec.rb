require 'spec_helper'

class User
  extend ActiveModel::Naming
  attr_accessor :id, :name, :description, :active, :invalid, :scopes, :birthday, :created_at, :updated_at
  def initialize(attrs)
    attrs.each do |a, v|
      self.send("#{a}=", v)
    end
  end
end

describe 'list_for' do
  context 'with an empty array' do

    before :all do
      @no_users = []
    end

    it 'should print the default message' do
      list_for(@no_users).should == 'There are no items to display'
    end

    it 'should print the empty message' do
      list_for(@no_users, :empty_message => 'EMPTY_MESSAGE').should == 'EMPTY_MESSAGE'
    end

  end

  context 'with an array of 1 user' do

    before :all do
      @user1 = User.new(:id => 1, :name => 'ListFor', :description => '',
                        :active => true, :invalid => false,
                        :scopes => ["admin", "manager", "visitor"],
                        :birthday => nil, :created_at => Time.now, :updated_at => Date.today)
      @users = [@user1]
      @output = list_for(@users)
    end

    it 'should print a table' do
      @output.should have_tag('table')
    end

    it 'should add default class to the table' do
      @output.should have_tag('table.list_for')
    end

    it 'should add object class name as CSS class to the table' do
      @output.should have_tag('table.users')
    end

    it 'should add default id to the table' do
      @output.should have_tag('table#user_list')
    end

    context 'with :class option' do
      it 'should add the class to the table element' do
        output = list_for(@users, :class => :common)
        output.should have_tag('table.list_for.users.common')
      end
    end

    context 'with :class option set to an array' do
      it 'should add all the provided classes to the table element' do
        output = list_for(@users, :class => [:common, :items])
        output.should have_tag('table.list_for.users.common.items')
      end
    end

    context 'with :id option' do
      it 'should place the specified id on the table' do
        output = list_for(@users, :id => 'my_list')
        output.should have_tag('table#my_list')
      end
    end

  end
end
