# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Castbox' do |version, platform, os|
  it "returns 'Castbox' as its browser" do
    expect(useragent.browser).to eq('Castbox')
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

describe "UserAgent: CastBox/4.20 (fm.castbox.audiobook.radio.podcast; build:15; iOS 14.4.0)" do
  let!(:useragent) { UserAgent.parse("CastBox/4.20 (fm.castbox.audiobook.radio.podcast; build:15; iOS 14.4.0)") }

  it_should_behave_like 'Castbox', '4.20', 'iOS', 'iOS 14.4.0'
end

describe "UserAgent: CastBox/com.castbox.CastBox (3.0.3/4.1) ; iOS 12.1.3)" do
  let!(:useragent) { UserAgent.parse("CastBox/com.castbox.CastBox (3.0.3/4.1) ; iOS 12.1.3)") }

  it_should_behave_like 'Castbox', '3.0.3/4.1', 'iOS', 'iOS 12.1.3'
end

describe "UserAgent: Castbox/4.11.1 (fm.castbox.audiobook.radio.podcast; build:7; iOS 13.3.0) Alamofire/4.7.1" do
  let!(:useragent) { UserAgent.parse("Castbox/4.11.1 (fm.castbox.audiobook.radio.podcast; build:7; iOS 13.3.0) Alamofire/4.7.1") }

  it_should_behave_like 'Castbox', '4.11.1', 'iOS', 'iOS 13.3.0'
end

describe "UserAgent: CastBox/1.3.6-170605171 (Linux;Android 6.0.1) ExoPlayerLib/2.4.0" do
  let!(:useragent) { UserAgent.parse("CastBox/1.3.6-170605171 (Linux;Android 6.0.1) ExoPlayerLib/2.4.0") }

  it_should_behave_like 'Castbox', '1.3.6-170605171', 'Android', 'Android 6.0.1'
end

describe "UserAgent: CastBox/5.0.0-170114181.r651de0f BMID/E6804BD2F2" do
  let!(:useragent) { UserAgent.parse("CastBox/5.0.0-170114181.r651de0f BMID/E6804BD2F2") }

  it_should_behave_like 'Castbox', '5.0.0-170114181.r651de0f', nil, nil
end

describe "UserAgent: CastBox/5.10.4-200119035.r517c146 (Linux;Android 9.0)" do
  let!(:useragent) { UserAgent.parse("CastBox/5.10.4-200119035.r517c146 (Linux;Android 9.0)") }

  it_should_behave_like 'Castbox', '5.10.4-200119035.r517c146', 'Android', 'Android 9.0'
end

describe "UserAgent: CastBox/7.12.1-180306067 (Linux;Android 9) ExoPlayerLib/2.4.0" do
  let!(:useragent) { UserAgent.parse("CastBox/7.12.1-180306067 (Linux;Android 9) ExoPlayerLib/2.4.0") }

  it_should_behave_like 'Castbox', '7.12.1-180306067', 'Android', 'Android 9'
end
