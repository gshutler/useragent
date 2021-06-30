# frozen_string_literal: true

require 'user_agent'

shared_examples 'ThePodcastApp' do |version, platform, os|
  it "returns 'ThePodcastApp' as its browser" do
    expect(useragent.browser).to eq('ThePodcastApp')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: ThePodcastApp/5.6.1 (iPhone; iOS 14.6; ) player (build 4958; +https://podcast.app/)" do
  let(:useragent) { UserAgent.parse("ThePodcastApp/5.6.1 (iPhone; iOS 14.6; ) player (build 4958; +https://podcast.app/)") }

  it_behaves_like 'ThePodcastApp', '5.6.1', 'iPhone', 'iOS 14.6'
end

describe "UserAgent: ThePodcastApp/3.44.1 (iPad; iOS 13.2.2; ) stream (build 4007; +https://podcast.app/)" do
  let(:useragent) { UserAgent.parse("ThePodcastApp/3.44.1 (iPad; iOS 13.2.2; ) stream (build 4007; +https://podcast.app/)") }

  it_behaves_like 'ThePodcastApp', '3.44.1', 'iPad', 'iOS 13.2.2'
end

describe "UserAgent: ThePodcastApp/3.45.0 (iPod touch; iOS 13.3.1; ) listenLater (build 4102; +https://podcast.app/)" do
  let(:useragent) { UserAgent.parse("ThePodcastApp/3.45.0 (iPod touch; iOS 13.3.1; ) listenLater (build 4102; +https://podcast.app/)") }

  it_behaves_like 'ThePodcastApp', '3.45.0', 'iPod touch', 'iOS 13.3.1'
end
