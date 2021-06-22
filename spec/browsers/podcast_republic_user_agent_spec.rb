require 'user_agent'

shared_examples_for 'Podcast Republic' do |version, os|
  it "returns 'Podcast Republic' as its browser" do
    expect(useragent.browser).to eq('Podcast Republic')
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

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: PodcastRepublic/18.0 (Linux; U; Android 11;blueline/RQ2A.210505.002)" do
  let!(:useragent) { UserAgent.parse("PodcastRepublic/18.0 (Linux; U; Android 11;blueline/RQ2A.210505.002)") }

  it_should_behave_like 'Podcast Republic', '18.0', 'Android 11'
end

describe "UserAgent: PodcastRepublic/18.0 (Linux; U; Android 9;J8210/55.0.A.11.25)" do
  let!(:useragent) { UserAgent.parse("PodcastRepublic/18.0 (Linux; U; Android 9;J8210/55.0.A.11.25)") }

  it_should_behave_like 'Podcast Republic', '18.0', 'Android 9'
end
