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
      activity.participants.each do |participant, cost|
        reunion_breakout[participant] += activity.owed[participant]
      end
    end
    reunion_breakout
  end

  def summary
    participants_as_strings = [] # accumulator to hold formatted strings

    breakout.each do |participant, amount_owed| # iterates through the hash that is returned by the breakout method
      participants_as_strings << "#{participant}: #{amount_owed}\n" # adds a formatted string to the accumulator
    end
    # here we are returning the participants_as_strings array, but we use '.join' to convert the array into a string
    # and then we use .delete_suffix to remove the last \n from the string, passing the test
    participants_as_strings.join('').delete_suffix("\n")
  end
end
