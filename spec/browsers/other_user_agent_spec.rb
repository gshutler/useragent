require "spec_helper"
require "user_agent"

describe "UserAgent: nil" do
  before do
    @useragent = UserAgent.parse(nil)
  end

  it "returns 'Mozilla' as its browser" do
    expect(@useragent.browser).to eq("Mozilla")
  end

  it "returns '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "returns nil as its platform" do
    expect(@useragent.platform).to eq(nil)
  end

  it "returns nil as its os" do
    expect(@useragent.os).to eq(nil)
  end

  it { expect(@useragent).not_to be_mobile }
  it { expect(@useragent).not_to be_bot }
end

describe "UserAgent: ''" do
  before do
    @useragent = UserAgent.parse("")
  end

  it "returns 'Mozilla' as its browser" do
    expect(@useragent.browser).to eq("Mozilla")
  end

  it "returns '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "returns nil as its platform" do
    expect(@useragent.platform).to eq(nil)
  end

  it "returns nil as its os" do
    expect(@useragent.os).to eq(nil)
  end

  it { expect(@useragent).not_to be_mobile }
  it { expect(@useragent).not_to be_bot }
end

describe "UserAgent: 'Mozilla/4.0 (compatible)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible)")
  end

  it "returns 'Mozilla' as its browser" do
    expect(@useragent.browser).to eq("Mozilla")
  end

  it "returns '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "returns nil as its platform" do
    expect(@useragent.platform).to eq(nil)
  end

  it "returns nil as its os" do
    expect(@useragent.os).to eq(nil)
  end

  it { expect(@useragent).not_to be_mobile }
  it { expect(@useragent).not_to be_bot }
end

describe "UserAgent: 'Mozilla/5.0'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0")
  end

  it "returns 'Mozilla' as its browser" do
    expect(@useragent.browser).to eq("Mozilla")
  end

  it "returns '5.0' as its version" do
    expect(@useragent.version).to eq("5.0")
  end

  it "returns nil as its platform" do
    expect(@useragent.platform).to eq(nil)
  end

  it "returns nil as its os" do
    expect(@useragent.os).to eq(nil)
  end

  it { expect(@useragent).not_to be_mobile }
  it { expect(@useragent).not_to be_bot }
end

describe "UserAgent: 'amaya/9.51 libwww/5.4.0'" do
  before do
    @useragent = UserAgent.parse("amaya/9.51 libwww/5.4.0")
  end

  it "returns 'amaya' as its browser" do
    expect(@useragent.browser).to eq("amaya")
  end

  it "returns '9.51' as its version" do
    expect(@useragent.version).to eq("9.51")
  end

  it "returns '5.4.0' as its libwww version" do
    expect(@useragent.libwww.version).to eq("5.4.0")
  end
end

describe "UserAgent: 'Rails Testing'" do
  before do
    @useragent = UserAgent.parse("Rails Testing")
  end

  it "returns 'Rails' as its browser" do
    expect(@useragent.browser).to eq("Rails")
  end

  it { expect(@useragent.version).to be_nil }
  it { expect(@useragent.platform).to be_nil }
  it { expect(@useragent.os).to be_nil }
  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Python-urllib/2.7'" do
  before do
    @useragent = UserAgent.parse("Python-urllib/2.7")
  end

  it "returns 'Python-urllib' as its browser" do
    expect(@useragent.browser).to eq("Python-urllib")
  end

  it "returns '2.7' as its version" do
    expect(@useragent.version).to eq("2.7")
  end

  it { expect(@useragent.platform).to be_nil }
  it { expect(@useragent.os).to be_nil }
  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'check_http/v1.4.15 (nagios-plugins 1.4.15)'" do
  before do
    @useragent = UserAgent.parse("check_http/v1.4.15 (nagios-plugins 1.4.15)")
  end

  it "returns 'check_http' as its browser" do
    expect(@useragent.browser).to eq("check_http")
  end

  it "returns 'v1.4.15' as its version" do
    expect(@useragent.version).to eq("v1.4.15")
  end

  it { expect(@useragent.platform).to be_nil }
  it { expect(@useragent.os).to be_nil }
  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: '/WebTest.pm'" do
  before do
    @useragent = UserAgent.parse("/WebTest.pm")
  end

  it "returns nil as its browser" do
    expect(@useragent.browser).to eq(nil)
  end
end
