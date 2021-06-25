require 'user_agent'

shared_examples 'DeezerCrawler' do
  it "returns 'Deezer' as its browser" do
    expect(useragent.browser).to eq('Deezer')
  end

  it { expect(useragent.platform).to be_nil }
  it { expect(useragent.os).to be_nil }

  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: Deezer Podcasters/1.0" do
  let(:useragent) { UserAgent.parse("Deezer Podcasters/1.0") }

  it_behaves_like 'DeezerCrawler'
end
