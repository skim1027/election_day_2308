require './lib/candidate'
require './lib/race'
require 'pry'

RSpec.describe Race do
  before :each do
    @race = Race.new("Texas Governor")

  end
  
  describe '#initialize' do
    it 'initialize' do
      expect(@race).to be_instance_of(Race)
    end
    
    it 'initalize with office' do
      expect(@race.office).to eq('Texas Governor')
    end
    
    it 'initialize with empty candidates' do
      expect(@race.candidates).to eq([])
    end
  end
  
  describe 'register_candidates' do
    it 'adds candidates to the candidates array' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq('Diana D')
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to eq([candidate1])
    end
    
    it 'adds other candidates' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#open?' do
    it 'show open or not' do
      expect(@race.open?).to be true
    end
  end

  describe '#close!' do
    it 'shows when closed' do
      expect(@race.close!).to be false
      @race.open = false
      expect(@race.close!).to be true
    end
  end

  describe 'winner' do 
    it 'shows winner' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      @race.open = true
      expect(@race.winner).to be false
      @race.open = false
      expect(@race.winner).to be_instance_of(Candidate)
    end
  end

  describe 'tie' do
    it 'shows ties' do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      expect(@race.tie?).to be false
    end
  end
end