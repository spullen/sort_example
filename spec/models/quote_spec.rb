require 'spec_helper'

describe Quote do

  it { should belong_to(:product) }
  it { should belong_to(:vendor) }
  
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
  
  describe '#sort' do
    let!(:product1) { create(:product, :name => 'D Name') }
    let!(:product2) { create(:product, :name => 'B Name') }
    let!(:product3) { create(:product, :name => 'A Name') }
    let!(:product4) { create(:product, :name => 'C Name') }
    
    let!(:vendor1) { create(:vendor, :name => 'D Name') }
    let!(:vendor2) { create(:vendor, :name => 'B Name') }
    let!(:vendor3) { create(:vendor, :name => 'A Name') }
    let!(:vendor4) { create(:vendor, :name => 'C Name') }
    
    let!(:quote1) { create(:quote, :product => product1, :vendor => vendor4, :price => 10.55, :quantity => 4) }
    let!(:quote2) { create(:quote, :product => product3, :vendor => vendor2, :price => 9.31, :quantity => 2) }
    let!(:quote3) { create(:quote, :product => product2, :vendor => vendor1, :price => 8.25, :quantity => 10) }
    let!(:quote4) { create(:quote, :product => product4, :vendor => vendor3, :price => 15.12, :quantity => 8) } 
  
    context 'default parameters' do
      it 'should sort by quote price ascending' do
        Quote.sort.should == [quote3, quote2, quote1, quote4]
      end
    end
    
    context 'given a sort column' do
      context 'without specifying an order' do
        it 'should sort by the specified column in ascending order' do
          Quote.sort(:quantity).should == [quote2, quote1, quote4, quote3]
        end
      end
      
      context 'specifying an order' do
        it 'should sort by the specified column in descending order' do
          Quote.sort(:quantity, 'DESC').should == [quote3, quote4, quote1, quote2]
        end
      end
    end
  end

end
