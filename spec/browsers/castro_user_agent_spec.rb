require 'user_agent'

shared_examples_for 'Castro' do |version, platform, os|
  it "returns 'Castro' as its browser" do
    expect(useragent.browser).to eq('Castro')
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

describe "UserAgent: Castro 2021.4/1322" do
  let(:useragent) { UserAgent.parse("Castro 2021.4/1322") }

  it_should_behave_like 'Castro', '2021.4', 'iOS', nil
end

describe "UserAgent: Castro 3.1.2/1063 Dynamo/1.0" do
  let(:useragent) { UserAgent.parse("Castro 3.1.2/1063 Dynamo/1.0") }

  it_should_behave_like 'Castro', '3.1.2', 'iOS', nil
end

describe "UserAgent: Castro Downloader" do
  let(:useragent) { UserAgent.parse("Castro Downloader") }

  it_should_behave_like 'Castro', nil, 'iOS', nil
end

describe "UserAgent: Castro/516 CFNetwork/1237 Darwin/20.4.0" do
  let(:useragent) { UserAgent.parse("Castro/516 CFNetwork/1237 Darwin/20.4.0") }

  it_should_behave_like 'Castro', '516', 'iOS', 'iOS 14.5'
end

describe "UserAgent: Castro 2, Episode Duration Lookup (iPhone; U; CPU OS 9_2 like Mac OS X; en_us)" do
  let(:useragent) { UserAgent.parse("Castro 2, Episode Duration Lookup (iPhone; U; CPU OS 9_2 like Mac OS X; en_us)") }

  it_should_behave_like 'Castro', '2', 'iPhone', 'iOS 9.2'
end

describe "UserAgent: Castro 2, Episode Duration Lookup BMID/E6806A66A4" do
  let(:useragent) { UserAgent.parse("Castro 2, Episode Duration Lookup BMID/E6806A66A4") }

  it_should_behave_like 'Castro', '2', 'iOS', nil
end

describe "UserAgent: Castro 2 Episode Download" do
  let(:useragent) { UserAgent.parse("Castro 2 Episode Download") }

  it_should_behave_like 'Castro', '2', 'iOS', nil
end

describe "UserAgent: Castro Episode Download (http://supertop.co/castro)" do
  let(:useragent) { UserAgent.parse("Castro Episode Download (http://supertop.co/castro)") }

  it_should_behave_like 'Castro', nil, 'iOS', nil
end

describe "UserAgent: Castro 2 2.2/647 Like iTunes" do
  let(:useragent) { UserAgent.parse("Castro 2 2.2/647 Like iTunes") }

  it_should_behave_like 'Castro', '2', 'iOS', nil
end
