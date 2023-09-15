
class Candidate
  attr_reader :name, :party, :votes
  def initialize(info, party = :democrat)
    @name = info[:name]
    @party = info[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end
end