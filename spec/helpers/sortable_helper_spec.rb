require 'spec_helper'

describe SortableHelper do
  
  before(:each) do
    @helper = Object.new.extend(SortableHelper)
    @helper.stub!(:sort_column).and_return("column")
    @helper.stub!(:sort_direction).and_return("asc")
  end
  
  describe '#sortable' do
    context 'given the column is the only specified parameter' do
      before(:each) do
        @node = Capybara::Node::Simple.new(@helper.sortable("test"))
      end
      
      it 'should set the title to be the capitalized version of the column name' do
        @node.should have_content("Test")
      end
    end
  end

end
