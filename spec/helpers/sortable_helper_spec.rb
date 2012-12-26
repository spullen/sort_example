require 'spec_helper'

describe SortableHelper do

  class MockView < ActionView::Base
    include ApplicationHelper
    include SortableHelper
  end
  
  before(:each) do
    @mock_view = MockView.new
    @mock_view.stub!(:sort_column).and_return("column")
    @mock_view.stub!(:sort_direction).and_return("asc")
    @mock_view.stub!(:url_for).and_return("/controller/action")
  end
  
  describe '#sortable' do
    context 'given the column is the only specified parameter' do
      before(:each) do
        @node = Capybara::Node::Simple.new(@mock_view.sortable("test"))
      end
      
      it 'should set the title to be the capitalized version of the column name' do
        @node.should have_content("Test")
      end
    end
    
    context 'given the sort column is the current column being sorted' do
      before(:each) do
        @node = Capybara::Node::Simple.new(@mock_view.sortable("column"))
      end
      
      it 'should set the sortable-current class' do
        @node.should have_css('a.sortable-current')
      end
      
      it 'should set the sortable-<direction>' do
        @node.should have_css('a.sortable-asc')
      end
    end
  end

end
