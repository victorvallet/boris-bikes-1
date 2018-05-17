require 'bike'

describe Bike do

	it 'if bike is broken' do
		is_expected.to respond_to :working? 
  	end

  	it 'the bike can be reported as broken, so do that maybe??' do
  		subject.report_broken(true)
  		expect(subject).to be_broken
  	end

end
