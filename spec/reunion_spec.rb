require './lib/reunion'
require 'rspec'

RSpec.describe Activity do
  before :each do
    @reunion = Reunion.new("1406 BE")
  end

  context 'Iteration 2' do
    it 'reunion exists' do
      expect(@reunion).to be_an_instance_of(Reunion)
    end

    it 'reunion has a name' do
      expect(@reunion.name).to eq("1406 BE")
    end

    it 'reunion has no activities by default' do
      expect(@reunion.activities).to eq([])
    end

    it 'reunion can add activities' do
      activity_1 = Activity.new("Brunch")

      @reunion.add_activity(activity_1)
      expect(@reunion.activities).to eq([activity_1])
    end
  end
end
