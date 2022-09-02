# frozen_string_literal: true

require 'user_agent'

shared_examples 'Wondery Crawler' do |version, platform, os|
  it "returns 'Wondery' as its browser" do
    expect(useragent.browser).to eq('Wondery Crawler')
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

  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
end

describe 'UserAgent: wondery/develop' do
  let(:useragent) { UserAgent.parse('wondery/develop') }

  it_behaves_like 'Wondery Crawler', 'develop', nil, nil
end

describe 'UserAgent: wondery/development' do
  let(:useragent) { UserAgent.parse('wondery/development') }

  it_behaves_like 'Wondery Crawler', 'development', nil, nil
end

describe 'UserAgent: wondery/prod' do
  let(:useragent) { UserAgent.parse('wondery/prod') }

  it_behaves_like 'Wondery Crawler', 'prod', nil, nil
end

describe 'UserAgent: wondery/production' do
  let(:useragent) { UserAgent.parse('wondery/production') }

  it_behaves_like 'Wondery Crawler', 'production', nil, nil
end

describe 'UserAgent: wondery/staging' do
  let(:useragent) { UserAgent.parse('wondery/staging') }

  it_behaves_like 'Wondery Crawler', 'staging', nil, nil
end

describe 'UserAgent: wondery/stage' do
  let(:useragent) { UserAgent.parse('wondery/stage') }

  it_behaves_like 'Wondery Crawler', 'stage', nil, nil
end

describe 'UserAgent: wondery/a23xcax' do
  let(:useragent) { UserAgent.parse('wondery/a23xcax') }

  it { expect(useragent.browser).not_to eq('Wondery Crawler') }
  it { expect(useragent).not_to be_bot }
end
