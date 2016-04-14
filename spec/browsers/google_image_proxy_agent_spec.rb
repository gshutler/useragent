require 'user_agent'

shared_examples_for "Google Image Proxy browser" do
  it "should return 'Google Image Proxy' as its browser" do
    expect(@useragent.browser).to eq("Google Image Proxy")
  end

  it "should return nil as its platform" do
    expect(@useragent.platform).to be_nil
  end
end

describe "mozilla/5.0 (windows nt 5.1; rv:11.0) gecko firefox/11.0 (via ggpht.com googleimageproxy)" do
  before do
    @useragent = UserAgent.parse("mozilla/5.0 (windows nt 5.1; rv:11.0) gecko firefox/11.0 (via ggpht.com googleimageproxy)")
  end

  it_should_behave_like "Google Image Proxy browser"

  it "should return nil as its os" do
    expect(@useragent.os).to be_nil
  end
end

describe "mozilla/5.0 (windows nt 5.1; rv:11.0) gecko firefox/11.0 (via ggpht.com GoogleImageProxy)" do
  before do
    @useragent = UserAgent.parse("mozilla/5.0 (windows nt 5.1; rv:11.0) gecko firefox/11.0 (via ggpht.com GoogleImageProxy)")
  end

  it_should_behave_like "Google Image Proxy browser"

  it "should return nil as its os" do
    expect(@useragent.os).to be_nil
  end
end
