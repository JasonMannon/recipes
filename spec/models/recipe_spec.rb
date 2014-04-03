require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should have_and_belong_to_many :tags }

  context '.search' do
    it 'searches through the recipes and returns recipes or ingrediants' do
      recipe2 = Recipe.create({:name => 'Coffee bean'})
      recipe3 = Recipe.create({:name => 'Beans to drink'})
      Recipe.basic_search('Coffee').first.should eq recipe2
    end
  end
end
