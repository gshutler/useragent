require 'user_agent'

shared_examples_for 'Stitcherbot' do
  it "returns 'Stitcher' as its browser" do
    expect(useragent.browser).to eq('Stitcher')
  end

  it { expect(useragent.platform).to be nil }
  it { expect(useragent.os).to be nil }
  it { expect(useragent).to be_bot }
end

describe "UserAgent: stitcherbot (http://www.stitcher.com)" do
  let!(:useragent) { UserAgent.parse("stitcherbot (http://www.stitcher.com)") }

  it_should_behave_like 'Stitcherbot'
end

describe "UserAgent: StitcherBot (MP3 Search Bot for Stitcher Personalized Radio Service)" do
  let!(:useragent) { UserAgent.parse("StitcherBot (MP3 Search Bot for Stitcher Personalized Radio Service)") }

  it_should_behave_like 'Stitcherbot'
end
