# frozen_string_literal: true

require 'user_agent'

shared_examples 'Overcast' do |version, platform, os, type|
  it "returns 'Overcast' as its browser" do
    expect(useragent.browser).to eq('Overcast')
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

  if type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_bot }
  elsif type == :bot
    it { expect(useragent).to be_bot }
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: Overcast/3.0 (+http://overcast.fm/; iOS podcast app) BMID/E6793162B9" do
  let!(:useragent) { UserAgent.parse("Overcast/3.0 (+http://overcast.fm/; iOS podcast app) BMID/E6793162B9") }

  it_behaves_like 'Overcast', '3.0', 'iOS', nil, :mobile
end

describe "UserAgent: Overcast (+http://overcast.fm/; Apple Watch podcast app)" do
  let!(:useragent) { UserAgent.parse("Overcast (+http://overcast.fm/; Apple Watch podcast app)") }

  it_behaves_like 'Overcast', '', 'Apple Watch', nil, :mobile
end

describe "UserAgent: Overcast/857 CFNetwork/1209 Darwin/20.3.0" do
  let!(:useragent) { UserAgent.parse("Overcast/857 CFNetwork/1209 Darwin/20.3.0") }

  it_behaves_like 'Overcast', '857', 'iOS', 'iOS 14.4.x', :mobile
end

describe "UserAgent: Overcast/1.0 Podcast Sync (+http://overcast.fm/)" do
  let!(:useragent) { UserAgent.parse("Overcast/1.0 Podcast Sync (+http://overcast.fm/)") }

  it_behaves_like 'Overcast', '1.0', nil, nil, :bot
end
