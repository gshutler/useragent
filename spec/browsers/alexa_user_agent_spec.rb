require 'user_agent'

shared_examples 'Alexa' do |version, os|
  it "returns 'Alexa' as its browser" do
    expect(useragent.browser).to eq('Alexa')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end
end

shared_examples 'Alexa Speaker' do
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).to be_speaker }
end

describe "UserAgent: AlexaMediaPlayer/1.0.1560.0 (Linux;Android 10) ExoPlayerLib/1.5.9" do
  let!(:useragent) { UserAgent.parse("AlexaMediaPlayer/1.0.1560.0 (Linux;Android 10) ExoPlayerLib/1.5.9") }

  it_behaves_like 'Alexa', '1.0.1560.0', 'Android 10'
  it_behaves_like 'Alexa Speaker'
end

describe "UserAgent: AlexaMediaPlayer/1.0.2098.2 (Linux;Android 5.1.1) ExoPlayerLib/1.5.9" do
  let!(:useragent) { UserAgent.parse("AlexaMediaPlayer/1.0.2098.2 (Linux;Android 5.1.1) ExoPlayerLib/1.5.9") }

  it_behaves_like 'Alexa', '1.0.2098.2', 'Android 5.1.1'
  it_behaves_like 'Alexa Speaker'
end

describe "UserAgent: Alexa Mobile Voice/17.8.5 (Linux;Android 11) ExoPlayerLib/2.5.4" do
  let!(:useragent) { UserAgent.parse("Alexa Mobile Voice/17.8.5 (Linux;Android 11) ExoPlayerLib/2.5.4") }

  it_behaves_like 'Alexa', '17.8.5', 'Android 11'

  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: Alexa Mobile Voice/1.0.0 (Linux;Android 8.1.0) ExoPlayerLib/2.2.0" do
  let!(:useragent) { UserAgent.parse("Alexa Mobile Voice/1.0.0 (Linux;Android 8.1.0) ExoPlayerLib/2.2.0") }

  it_behaves_like 'Alexa', '1.0.0', 'Android 8.1.0'

  it { expect(useragent).not_to be_speaker }
end
