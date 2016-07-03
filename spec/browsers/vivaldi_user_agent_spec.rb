require 'user_agent'

shared_examples_for "Vivaldi browser" do
  it "should return 'Vivaldi' as its browser" do
    expect(@useragent.browser).to eq("Vivaldi")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43")
  end

  it_should_behave_like "Vivaldi browser"

  it "should return '1.2.490.43' as its version" do
    expect(@useragent.version).to eq("1.2.490.43")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 7' as its os" do
    expect(@useragent.os).to eq("Windows 7")
  end
end

describe "UserAgent: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43")
  end

  it_should_behave_like "Vivaldi browser"

  it "should return '1.2.490.43' as its version" do
    expect(@useragent.version).to eq("1.2.490.43")
  end

  it "should return 'X11' as its platform" do
    expect(@useragent.platform).to eq("X11")
  end

  it "should return 'Linux x86_64' as its os" do
    expect(@useragent.os).to eq("Linux x86_64")
  end
end
