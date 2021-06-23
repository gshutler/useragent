require 'user_agent'

shared_examples 'DowncastCrawler' do
  it "returns 'Downcast' as its browser" do
    expect(useragent.browser).to eq('Downcast')
  end

  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: downcast feed consumer/0.0.177; (mode=dev; id=jQPkOYXFJT; downcast.fm)" do
  let(:useragent) { UserAgent.parse("downcast feed consumer/0.0.177; (mode=dev; id=jQPkOYXFJT; downcast.fm)") }

  it_behaves_like 'DowncastCrawler'
end
