require 'user_agent'

shared_examples_for 'BeyondPod' do
  it "returns 'BeyondPod' as its browser" do
    expect(useragent.browser).to eq('BeyondPod')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Mozilla/5.0 (Linux; U; en-us; BeyondPod 4)" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; U; en-us; BeyondPod 4)") }

  it_should_behave_like 'BeyondPod'
end

describe "UserAgent: Mozilla/5.0 (Linux; U; en-us; BeyondPod 4) Dynamo/1.0" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; U; en-us; BeyondPod 4) Dynamo/1.0") }

  it_should_behave_like 'BeyondPod'
end

describe "UserAgent: BeyondPod for Android" do
  let(:useragent) { UserAgent.parse("BeyondPod for Android") }

  it_should_behave_like 'BeyondPod'
end
