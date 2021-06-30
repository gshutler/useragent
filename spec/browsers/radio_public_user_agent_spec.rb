# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'RadioPublic' do |version, platform, os|
  it "returns 'RadioPublic' as its browser" do
    expect(useragent.browser).to eq('RadioPublic')
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

describe "UserAgent: RadioPublic/android-2.2" do
  let(:useragent) { UserAgent.parse("RadioPublic/android-2.2") }

  it_should_behave_like 'RadioPublic', '2.2', 'Android', 'Android'
end

describe "UserAgent: RadioPublic/android-2.2 ,Mozilla/5.0 (Linux; Android 7.0; 5086D Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/56.0.2924.87 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("RadioPublic/android-2.2 ,Mozilla/5.0 (Linux; Android 7.0; 5086D Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/56.0.2924.87 Mobile Safari/537.36") }

  it_should_behave_like 'RadioPublic', '2.2', 'Android', 'Android 7.0'
end

describe "UserAgent: RadioPublic Android 1.0.26" do
  let(:useragent) { UserAgent.parse("RadioPublic Android 1.0.26") }

  it_should_behave_like 'RadioPublic', '1.0.26', 'Android', 'Android'
end

describe "UserAgent: RadioPublic/iOS-2.0" do
  let(:useragent) { UserAgent.parse("RadioPublic/iOS-2.0") }

  it_should_behave_like 'RadioPublic', '2.0', 'iOS', 'iOS'
end

describe "UserAgent: RadioPublic iOS 2.0.0" do
  let(:useragent) { UserAgent.parse("RadioPublic iOS 2.0.0") }

  it_should_behave_like 'RadioPublic', '2.0.0', 'iOS', 'iOS'
end

describe "UserAgent: RadioPublic/1 CFNetwork/808.2.16 Darwin/16.3.0" do
  let(:useragent) { UserAgent.parse("RadioPublic/1 CFNetwork/808.2.16 Darwin/16.3.0") }

  it_should_behave_like 'RadioPublic', '1', 'iOS', 'iOS 10.2.x'
end

describe "UserAgent: RadioPublic/1.0 (com.radiopublic.app; build:50; iOS 10.0.0) Alamofire/4.0.0" do
  let(:useragent) { UserAgent.parse("RadioPublic/1.0 (com.radiopublic.app; build:50; iOS 10.0.0) Alamofire/4.0.0") }

  it_should_behave_like 'RadioPublic', '1.0', 'iOS', 'iOS 10.0.0'
end
