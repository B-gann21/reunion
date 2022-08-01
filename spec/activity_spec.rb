require './lib/activity'
require 'rspec'

RSpec.describe Activity do
    before :each do
      @activity = Activity.new("Brunch")
    end

  context 'Iteration 1' do
    it 'activity exists' do
      expect(@activity).to be_an_instance_of(Activity)
    end

    it 'activity has a name' do
      expect(@activity.name).to eq("Brunch")
    end

    it 'activity has no participants be default' do
      expect(@activity.participants).to eq({})
    end

    it 'activity can add a participant' do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
    end

    it 'activity has a total cost for participants' do
      @activity.add_participant("Maria", 20)
      expect(@activity.total_cost).to eq(20)
    end

    it 'activity can add more participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end

    it 'activity increases the total cost for new participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
    end
  end

  context 'Iteration 2' do
    it 'activity can split the cost between participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.split).to eq(30)
    end

    it 'activity can return the amount owed to each participant' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end
