class Election
  attr_reader :year, :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.map do |race|
      race.candidates
    end.flatten
  end
  
  def vote_counts
    votes = {}
    @races.map do |race|
      race.candidates.map do |candidate|
        votes[candidate.name] = candidate.votes
      end
    end
    votes
  end

  def winners
    winners = []
    @races.each do |race|
      winners << race.winner
    end
    winners
  end
end