require 'user_agent'

shared_examples "libavformat" do
  it "should return 'libavformat' as its browser" do
    expect(@useragent.browser).to eq("libavformat")
  end

  it "should return nil as its OS" do
    expect(@useragent.os).to be_nil
  end

  it "should return nil as its platform" do
    expect(@useragent.platform).to be_nil
  end
end

shared_examples "libavformat has version number" do |version|
  it "should return '#{version}' as its version" do
    expect(@useragent.version).to eq(version)
  end
end

describe "UserAgent: Lavf/56.4.101" do
  before do
    @useragent = UserAgent.parse("Lavf/56.4.101")
  end

  it_behaves_like "libavformat"
  it_behaves_like "libavformat has version number", "56.4.101"
end

describe "UserAgent: NSPlayer/4.1.0.3856" do
  before do
    @useragent = UserAgent.parse("NSPlayer/4.1.0.3856")
  end

  it_behaves_like "libavformat"
  it_behaves_like "libavformat has version number", nil
end
