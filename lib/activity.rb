class Activity
  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
    @total_cost += cost
  end

  def split
    @total_cost / @participants.count
  end

  def owed
    new_cost = Hash.new(0)

    @participants.each do |participant, cost|
      new_cost[participant] = split - cost
    end
    new_cost
  end
end
