require 'webmock/rspec'
require 'careerjet'

describe Careerjet do
  it "should request Careejet's search API with correct domain and given params" do
    resp = {'hits' => 1, 'response_time' =>  0.001, 'type' => 'JOBS', 'pages' => 1}
    stub_http_request(:get, 'www.careerjet.com/devel/search.api').to_return(
        :body => MultiJson.encode(resp))
    Careerjet.search(:en_US, :keywords => 'rails', :page => 1).should == resp
  end

  it 'should raise appropriate error on unknown locale' do
    lambda do
      Careerjet.search :foo_Bar, {}
    end.should raise_error(Careerjet::UnknownLocale)
  end

  it 'should validate given params' do
    lambda do
      Careerjet.search :en_US, :keywords => 'rails', :foo => 'bar'
    end.should raise_error(Careerjet::InvalidParam)
  end
end
