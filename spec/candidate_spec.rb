require './lib/candidate'
require 'pry'

RSpec.describe Candidate do
  before :each do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe '#initialize' do
    it 'initialize' do
      expect(@diana).to be_instance_of(Candidate)
    end
    
    it 'initialize with name' do
      expect(@diana.name).to eq('Diana D')
    end

    it 'initialize with party' do
      expect(@diana.party).to eq(:democrat)
    end
  end

  describe '#votes' do
    it 'counts votes' do
      expect(@diana.votes).to eq(0)
    end

    it 'increase when someone vote_for!' do
      @diana.vote_for!
      @diana.vote_for!
      @diana.vote_for!
      expect(@diana.votes).to eq(3)
      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
end