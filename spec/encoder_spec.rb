describe Encoder do

  let(:encoder){ Encoder.new }

  describe '#noop' do
    it 'takes a word, and does nothing to it' do
      expect(encoder.noop('anyword')).to eq 'anyword'
    end
  end

  describe '#reverse' do
    it 'takes a word, and reverses it' do
      expect(encoder.reverse('anyword')).to eq 'drowyna'
    end
  end

end
