require 'spec_helper'

describe SortableHelper do
  
  before(:each) do
    helper.stub!(:controller_name).and_return("quotes")
    helper.stub!(:action_name).and_return("index")
    helper.stub!(:sort_column).and_return("column")
    helper.stub!(:sort_direction).and_return("asc")
  end
  
  describe '#sortable' do
    context 'given the column is the only specified parameter' do
      before(:each) do
        @node = Capybara::Node::Simple.new(helper.sortable("test"))
      end
      
      it 'should set the title to be the capitalized version of the column name' do
        @node.should have_content("Test")
      end
    end
    
    context 'given the sort column is the current column being sorted' do
      before(:each) do
        @node = Capybara::Node::Simple.new(helper.sortable("column"))
      end
      
      it 'should set the sortable-current class' do
        @node.should have_css('a.sortable-current')
      end
      
      it 'should set the sortable-<direction>' do
        @node.should have_css('a.sortable-asc')
      end
    end
    
    context 'given the sort column is not the current column being sorted' do
      before(:each) do
        @node = Capybara::Node::Simple.new(helper.sortable("other_column"))
      end
      
      it 'should set the sortable-current class' do
        @node.should_not have_css('a.sortable-current')
      end
      
      it 'should set the sortable-<direction>' do
        @node.should_not have_css('a.sortable-asc')
      end
    end
    
    context 'given the title is specified' do
      before(:each) do
        @node = Capybara::Node::Simple.new(helper.sortable("column", "Custom Title"))
      end
      
      it 'should set the sortable-current class' do
        @node.should have_content("Custom Title")
      end
    end
  end

end
