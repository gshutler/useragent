require 'user_agent'

shared_examples_for 'PandoraRSSCrawler' do |version|
  it "should return 'Pandora' as its browser" do
    expect(useragent.browser).to eq('Pandora')
  end

  it "should return '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it { expect(useragent.platform).to be nil }
  it { expect(useragent.os).to be nil }
  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_speaker }
end

describe "PandoraRSSCrawler/1.0 (podcastpartnerships@pandora.com)" do
  let!(:useragent) { UserAgent.parse("PandoraRSSCrawler/1.0 (podcastpartnerships@pandora.com)") }

  it_should_behave_like 'PandoraRSSCrawler', '1.0'
end
