require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before :each do
    @election = Election.new("2017")
  end
  
  describe '#initialize' do
    it 'initialize' do
      expect(@election).to be_instance_of(Election)
    end
    
    it 'includes year' do
      expect(@election.year).to eq("2017")
    end
    
    it 'initialize with empty race' do
      expect(@election.races).to eq([])
    end
  end
  
  describe '#add_race' do
    it 'adds races' do
      race = Race.new("Texas Governor")
      @election.add_race(race)
      expect(@election.instance_variable_get(:@races)).to all be_a Race
    end
  end
  
  describe '#candidates' do
    it 'shows list of candidates' do
      race = Race.new("Texas Governor")
      @election.add_race(race)
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat}) 
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      candidates_objects = @election.candidates      
      candidates_objects.each do |candidate|
        expect(candidate).to be_a(Candidate)
      end
    end
  end

  describe '#vote_counts' do
    it 'shows vote counts' do
      race = Race.new("Texas Governor")
      @election.add_race(race)
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat}) 
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      expect(@election.vote_counts).to eq({ "Diana D" => 3, "Roberto R" => 2 })
    end
  end

  describe '#winners' do
    it 'tells you the winners' do
      race = Race.new("Texas Governor")
      @election.add_race(race)
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat}) 
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      race.open = false
      expect(@election.winners.class).to eq(Array)
      expect(@election.winners.first.class).to eq(Candidate)
    end
  end
end
