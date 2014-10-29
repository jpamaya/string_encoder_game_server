describe Encoder do

  let(:encoder){ Encoder.new }

  describe '#noop' do
    it 'takes a word, and does nothing to it' do
      expect(encoder.noop('anyword')).to eq 'anyword'
      expect(encoder.noop('AnyString')).to eq 'AnyString'
      expect(encoder.noop('01AnyString89')).to eq '01AnyString89'
    end
  end

end
