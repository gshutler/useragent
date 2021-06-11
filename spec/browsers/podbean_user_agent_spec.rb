require 'user_agent'

shared_examples 'Podbean' do |version, platform, os|
  it "returns 'Podbean' as its browser" do
    expect(useragent.browser).to eq('Podbean')
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

describe "UserAgent: Podbean/Android App 8.5.1 (http://podbean.com),a3d7ec202761774354efde899ad29a6a" do
  let(:useragent) { UserAgent.parse("Podbean/Android App 8.5.1 (http://podbean.com),a3d7ec202761774354efde899ad29a6a") }

  it_behaves_like 'Podbean', '8.5.1', 'Android', nil
end

describe "UserAgent: Podbean/Android App (http://podbean.com) ,099c49b02ed4a2d7da8a9bbb11a47" do
  let(:useragent) { UserAgent.parse("Podbean/Android App (http://podbean.com) ,099c49b02ed4a2d7da8a9bbb11a47") }

  it_behaves_like 'Podbean', nil, 'Android', nil
end

describe "UserAgent: Podbean/Android App 5.7.1 (http://podbean.com) ,8f16fbdcbb38da97ec2bea119b3890fe/5.7.1 (Linux;Android 7.0) ExoPlayerLib/2.6.0" do
  let(:useragent) { UserAgent.parse("Podbean/Android App 5.7.1 (http://podbean.com) ,8f16fbdcbb38da97ec2bea119b3890fe/5.7.1 (Linux;Android 7.0) ExoPlayerLib/2.6.0") }

  it_behaves_like 'Podbean', '5.7.1', 'Android', 'Android 7.0'
end

describe "UserAgent: Podbean/iOS (http://podbean.com) 5.3.9 - 4726c87b825e77fda656723a2d6eb484" do
  let(:useragent) { UserAgent.parse("Podbean/iOS (http://podbean.com) 5.3.9 - 4726c87b825e77fda656723a2d6eb484") }

  it_behaves_like 'Podbean', '5.3.9', 'iOS', nil
end

describe "UserAgent: Podbean/iOS (http://podbean.com) 5.0 - 8f16fbdc25e77fdd4a2d6723a2d6eb484" do
  let(:useragent) { UserAgent.parse("Podbean/iOS (http://podbean.com) 5.0 - 8f16fbdc25e77fdd4a2d6723a2d6eb484") }

  it_behaves_like 'Podbean', '5.0', 'iOS', nil
end

describe "UserAgent: Podbean/1374 CFNetwork/978.0.7 Darwin/18.7.0" do
  let(:useragent) { UserAgent.parse("Podbean/1374 CFNetwork/978.0.7 Darwin/18.7.0") }

  it_behaves_like 'Podbean', '1374', 'iOS', 'iOS 12.4.x'
end
