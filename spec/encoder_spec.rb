describe Encoder do

  let(:encoder){ Encoder.new }

  describe '#noop' do
    it 'takes a word, and does nothing to it' do
      expect(encoder.noop('anyword')).to eq 'anyword'
      expect(encoder.noop('AnyString')).to eq 'AnyString'
    end
  end

  describe '#reverse' do
    it 'takes a word, and reverses it' do
      expect(encoder.reverse('anyword')).to eq 'drowyna'
      expect(encoder.reverse('AnyString')).to eq 'gnirtSynA'
    end
  end

end
