require 'bike'

describe Bike do
  it {is_expected.to respond_to(:broken?)}
  it {is_expected.to respond_to(:report_broken)}

  describe '#report_broken' do
    it 'marks bike as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

  describe '#broken?' do
    it 'states that bike is broken' do
      expect(subject.broken?).to be true
    end
  end

end
