require './lib/reunion'
require './lib/activity'
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

  context 'Iteration 3' do
    before :each do
      activity_1 = Activity.new("Brunch")
      activity_2 = Activity.new("Drinks")
    end

    it 'reunion has a total cost' do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)

      @reunion.add_activity(activity_1)
      @reunion.add_activity(activity_2)

      expect(@reunion.total_cost).to eq(180)
    end

    it 'reunion can return how much participants are owed' do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)

      @reunion.add_activity(activity_1)
      @reunion.add_activity(activity_2)

      expect(@reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end

    it 'reunion can return a summary' do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)

      @reunion.add_activity(activity_1)
      @reunion.add_activity(activity_2)

      expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
    end
  end
end
