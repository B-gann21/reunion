class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total_activities_cost = 0

    @activities.each do |activity|
      total_activities_cost += activity.total_cost
    end
    total_activities_cost
  end

  def breakout
    reunion_breakout = Hash.new(0)

    @activities.each do |activity|
      owed = activity.owed
      activity.participants.each do |participant, cost|
        reunion_breakout[participant] += owed[participant]
      end
    end
    reunion_breakout
  end

  def summary

    
  end
end
