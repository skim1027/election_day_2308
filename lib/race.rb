class Race
  attr_reader :office, :candidates
  attr_accessor :open
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(info)
    candidate = Candidate.new(info)
    @candidates << candidate
    candidate
  end
  
  def open?
    @open
  end

  def close!
    if @open
      false
    else
      true
    end
  end

  def winner
    if @open
      false
    else
      sorted = @candidates.sort_by! { |candidate| candidate.votes }.reverse
      sorted.first
    end
  end

  def tie?
    sorted = @candidates.sort_by! { |candidate| candidate.votes }.reverse
    if sorted[0].votes == sorted[1].votes
      true
    else
      false
    end
  end
end