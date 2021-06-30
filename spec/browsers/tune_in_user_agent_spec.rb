# frozen_string_literal: true

require 'user_agent'

shared_examples 'TuneIn' do |version, platform, os, type|
  it "returns 'TuneIn' as its browser" do
    expect(useragent.browser).to eq('TuneIn')
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
    it { expect(useragent).not_to be_desktop }
  else
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: TuneIn Radio/26.8.1 (Linux;Android 8.0.0) ExoPlayerLib/2.12.2" do
  let(:useragent) { UserAgent.parse("TuneIn Radio/26.8.1 (Linux;Android 8.0.0) ExoPlayerLib/2.12.2") }

  it_behaves_like 'TuneIn', '26.8.1', 'Android', 'Android 8.0.0', :mobile
end

describe "UserAgent: TuneIn Radio Pro/26.2.1 (Linux;Android 9) ExoPlayerLib/2.12.2" do
  let(:useragent) { UserAgent.parse("TuneIn Radio Pro/26.2.1 (Linux;Android 9) ExoPlayerLib/2.12.2") }

  it_behaves_like 'TuneIn', '26.2.1', 'Android', 'Android 9', :mobile
end

describe "UserAgent: TuneIn Radio Pro/17.8.1 (Android 24; SM-T813; Java)" do
  let(:useragent) { UserAgent.parse("TuneIn Radio Pro/17.8.1 (Android 24; SM-T813; Java)") }

  it_behaves_like 'TuneIn', '17.8.1', 'Android', 'Android 7.0', :mobile
end

describe "UserAgent: TuneIn Radio/20.4.0; iPhone13,1; iOS/14.4.2" do
  let(:useragent) { UserAgent.parse("TuneIn Radio/20.4.0; iPhone13,1; iOS/14.4.2") }

  it_behaves_like 'TuneIn', '20.4.0', 'iPhone', 'iOS 14.4.2', :mobile
end

describe "UserAgent: TuneIn Radio Pro/20.5.0; iPhone13,1; iOS/14.6" do
  let(:useragent) { UserAgent.parse("TuneIn Radio Pro/20.5.0; iPhone13,1; iOS/14.6") }

  it_behaves_like 'TuneIn', '20.5.0', 'iPhone', 'iOS 14.6', :mobile
end

describe "UserAgent: TuneIn Radio Pro/20.4.0; iPad8,7; iOS/14.4.2" do
  let(:useragent) { UserAgent.parse("TuneIn Radio Pro/20.4.0; iPad8,7; iOS/14.4.2") }

  it_behaves_like 'TuneIn', '20.4.0', 'iPad', 'iOS 14.4.2', :mobile
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.6.0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.6.0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36") }

  it_behaves_like 'TuneIn', '1.6.0', 'Macintosh', 'OS X 10.10.3', :desktop
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.16.0 Chrome/69.0.3497.128 Electron/4.2.8 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.16.0 Chrome/69.0.3497.128 Electron/4.2.8 Safari/537.36") }

  it_behaves_like 'TuneIn', '1.16.0', 'Windows', 'Windows 10', :desktop
end

describe "UserAgent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) tunein/1.0.0 Chrome/69.0.3497.128 Electron/4.1.3 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) tunein/1.0.0 Chrome/69.0.3497.128 Electron/4.1.3 Safari/537.36") }

  it_behaves_like 'TuneIn', '1.0.0', 'X11', 'Linux x86_64', :desktop
end

describe "UserAgent: TuneIn%20Radio%20Enterprise/1 CFNetwork/808.2.16 Darwin/16.3.0" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio%20Enterprise/1 CFNetwork/808.2.16 Darwin/16.3.0") }

  it_behaves_like 'TuneIn', '1', 'iOS', 'iOS 10.2.x', :mobile
end

describe "UserAgent: TuneIn%20Radio%20Pro/055708c CFNetwork/894 Darwin/17.4.0" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio%20Pro/055708c CFNetwork/894 Darwin/17.4.0") }

  it_behaves_like 'TuneIn', '055708c', 'iOS', 'iOS 11.2.5', :mobile
end

describe "UserAgent: TuneIn%20Radio%20Pro/11.4; iPhone11,8; iOS/13.3.1" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio%20Pro/11.4; iPhone11,8; iOS/13.3.1") }

  it_behaves_like 'TuneIn', '11.4', 'iPhone', 'iOS 13.3.1', :mobile
end

describe "UserAgent: TuneIn%20Radio%20Pro/12.5; iPod7,1; iOS/10.2" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio%20Pro/12.5; iPod7,1; iOS/10.2") }

  it_behaves_like 'TuneIn', '12.5', 'iPod touch', 'iOS 10.2', :mobile
end

describe "UserAgent: TuneIn%20Radio/1002 CFNetwork/887 Darwin/17.0.0" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio/1002 CFNetwork/887 Darwin/17.0.0") }

  it_behaves_like 'TuneIn', '1002', 'iOS', 'iOS 11.0.x', :mobile
end

describe "UserAgent: TuneIn%20Radio/11.4; iPad5,3; iOS/11.4" do
  let(:useragent) { UserAgent.parse("TuneIn%20Radio/11.4; iPad5,3; iOS/11.4") }

  it_behaves_like 'TuneIn', '11.4', 'iPad', 'iOS 11.4', :mobile
end
