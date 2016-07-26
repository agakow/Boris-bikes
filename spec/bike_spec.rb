require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#report' do
    it 'changes bike to broken' do
      bike = Bike.new
      bike.report
      expect(bike).not_to be_working
    end
  end
end
