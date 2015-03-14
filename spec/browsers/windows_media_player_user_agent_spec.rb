require 'user_agent'

shared_examples "Windows Media Player" do
  it "should return 'Windows Media Player' as its browser" do
    expect(@useragent.browser).to eq("Windows Media Player")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should not identify as being classic" do
    expect(@useragent.classic?).to eq(false)
  end

  it "should be the desktop version" do
    expect(@useragent.mobile?).to eq(false)
  end
end

shared_examples "Windows Media Player Mobile" do
  it "should return 'Windows Media Player' as its browser" do
    expect(@useragent.browser).to eq("Windows Media Player")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should not identify as being classic" do
    expect(@useragent.classic?).to eq(false)
  end

  it "should be the desktop version" do
    expect(@useragent.mobile?).to eq(true)
  end
end

shared_examples "Windows Media Player Classic" do
  it "should return 'Windows Media Player' as its browser" do
    expect(@useragent.browser).to eq("Windows Media Player")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should identify as being classic" do
    expect(@useragent.classic?).to eq(true)
  end
end

shared_examples "Windows Media Player isn't using WMFSDK" do
  it "should return nil as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to be_nil
  end

  it "should not have WMFSDK9" do
    expect(@useragent.has_wmfsdk?("9")).to eq(false)
  end

  it "should not have WMFSDK10" do
    expect(@useragent.has_wmfsdk?("10")).to eq(false)
  end

  it "should not have WMFSDK11" do
    expect(@useragent.has_wmfsdk?("11")).to eq(false)
  end

  it "should not have WMFSDK12" do
    expect(@useragent.has_wmfsdk?("12")).to eq(false)
  end
end

shared_examples "Windows Media Player runs on" do |os|
  it "should return '#{os}' as its OS" do
    expect(@useragent.os).to eq(os)
  end
end

shared_examples "Windows Media Player has version number" do |version|
  it "should return '#{version}' as its version" do
    expect(@useragent.version).to eq(version)
  end
end

%w{4.1.0.3856 7.10.0.3059 7.0.0.1956}.each do |not_wmp|
  describe "UserAgent: NSPlayer/#{not_wmp}" do
    before do
      @useragent = UserAgent.parse("NSPlayer/#{not_wmp}")
    end

    it "should not return 'Windows Media Player' as its browser" do
      expect(@useragent.browser).not_to eq("Windows Media Player")
    end

    it "should not return 'Windows' as its platform" do
      expect(@useragent.platform).not_to eq("Windows")
    end
  end
end

%w{4.1.0.3857}.each do |win9x_wmp6|
  describe "UserAgent: NSPlayer/#{win9x_wmp6}" do
    before do
      @useragent = UserAgent.parse("NSPlayer/#{win9x_wmp6}")
    end

    it_behaves_like "Windows Media Player Classic"
    it_behaves_like "Windows Media Player isn't using WMFSDK"
    it_behaves_like "Windows Media Player runs on", "Windows 9x"
    it_behaves_like "Windows Media Player has version number", win9x_wmp6
  end
end

%w{3.2.0.3564 4.1.0.3925}.each do |win98_wmp6|
  describe "UserAgent: NSPlayer/#{win98_wmp6}" do
    before do
      @useragent = UserAgent.parse("NSPlayer/#{win98_wmp6}")
    end

    it_behaves_like "Windows Media Player Classic"
    it_behaves_like "Windows Media Player isn't using WMFSDK"
    it_behaves_like "Windows Media Player runs on", "Windows 98"
    it_behaves_like "Windows Media Player has version number", win98_wmp6
  end
end

%w{7.1.0.3055}.each do |win98_wmp71|
  describe "UserAgent: NSPlayer/#{win98_wmp71}" do
    before do
      @useragent = UserAgent.parse("NSPlayer/#{win98_wmp71}")
    end

    it_behaves_like "Windows Media Player"
    it_behaves_like "Windows Media Player isn't using WMFSDK"
    it_behaves_like "Windows Media Player runs on", "Windows 98"
    it_behaves_like "Windows Media Player has version number", win98_wmp71
  end
end

describe "UserAgent: Windows-Media-Player/9.00.00.2980" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/9.00.00.2980")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows 98/2000"
  it_behaves_like "Windows Media Player has version number", "9.00.00.2980"
end

describe "UserAgent: NSPlayer/9.0.0.2980 WMFSDK/9.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.2980 WMFSDK/9.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 98/2000"
  it_behaves_like "Windows Media Player has version number", "9.0.0.2980"

  it "should return '9.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("9.0")
  end

  it "should have WMFSDK9" do
    expect(@useragent.has_wmfsdk?("9.0")).to eq(true)
  end
end

describe "UserAgent: NSPlayer/4.1.0.3938" do
  before do
    @useragent = UserAgent.parse("NSPlayer/4.1.0.3938")
  end

  it_behaves_like "Windows Media Player Classic"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows 2000"
  it_behaves_like "Windows Media Player has version number", "4.1.0.3938"
end

describe "UserAgent: NSPlayer/9.0.0.3268" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.3268")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows 2000"
  it_behaves_like "Windows Media Player has version number", "9.0.0.3268"
end

describe "UserAgent: NSPlayer/9.0.0.3268 WMFSDK/9.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.3268 WMFSDK/9.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 2000"
  it_behaves_like "Windows Media Player has version number", "9.0.0.3268"

  it "should return '9.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("9.0")
  end

  it "should have WMFSDK9" do
    expect(@useragent.has_wmfsdk?("9.0")).to eq(true)
  end
end

describe "UserAgent: NSPlayer/9.0.0.3270 WMFSDK/9.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.3270 WMFSDK/9.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 2000"
  it_behaves_like "Windows Media Player has version number", "9.0.0.3270"

  it "should return '9.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("9.0")
  end

  it "should have WMFSDK9" do
    expect(@useragent.has_wmfsdk?("9.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/9.00.00.3367" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/9.00.00.3367")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows 2000"
  it_behaves_like "Windows Media Player has version number", "9.00.00.3367"
end

describe "UserAgent: NSPlayer/4.1.0.3936" do
  before do
    @useragent = UserAgent.parse("NSPlayer/4.1.0.3936")
  end

  it_behaves_like "Windows Media Player Classic"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "4.1.0.3936"
end

describe "UserAgent: NSPlayer/9.0.0.4503" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.4503")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "9.0.0.4503"
end

describe "UserAgent: NSPlayer/9.0.0.4503 WMFSDK/9.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/9.0.0.4503 WMFSDK/9.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "9.0.0.4503"

  it "should return '9.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("9.0")
  end

  it "should have WMFSDK9" do
    expect(@useragent.has_wmfsdk?("9.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/9.00.00.4503" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/9.00.00.4503")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player has version number", "9.00.00.4503"
end

describe "UserAgent: NSPlayer/10.0.0.3802" do
  before do
    @useragent = UserAgent.parse("NSPlayer/10.0.0.3802")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player has version number", "10.0.0.3802"
end

describe "UserAgent: NSPlayer/10.0.0.3802 WMFSDK/10.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/10.0.0.3802 WMFSDK/10.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "10.0.0.3802"

  it "should return '10.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("10.0")
  end

  it "should have WMFSDK10" do
    expect(@useragent.has_wmfsdk?("10.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/10.00.00.3802" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/10.00.00.3802")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player has version number", "10.00.00.3802"
end

describe "UserAgent: NSPlayer/11.0.5721.5262" do
  before do
    @useragent = UserAgent.parse("NSPlayer/11.0.5721.5262")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "11.0.5721.5262"
end

describe "UserAgent: NSPlayer/11.0.5721.5262 WMFSDK/11.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/11.0.5721.5262 WMFSDK/11.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "11.0.5721.5262"

  it "should return '11.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("11.0")
  end

  it "should have WMFSDK11" do
    expect(@useragent.has_wmfsdk?("11.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/11.0.5721.5262" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/11.0.5721.5262")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows XP"
  it_behaves_like "Windows Media Player has version number", "11.0.5721.5262"
end

describe "UserAgent: NSPlayer/11.00.6002.18392 WMFSDK/11.00.6002.18392" do
  before do
    @useragent = UserAgent.parse("NSPlayer/11.00.6002.18392 WMFSDK/11.00.6002.18392")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows Vista"
  it_behaves_like "Windows Media Player has version number", "11.00.6002.18392"

  it "should return '11.00.6002.18392' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("11.00.6002.18392")
  end

  it "should have WMFSDK11" do
    expect(@useragent.has_wmfsdk?("11.0")).to eq(true)
  end
end

describe "UserAgent: NSPlayer/11.0.6002.18005" do
  before do
    @useragent = UserAgent.parse("NSPlayer/11.0.6002.18005")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows Vista"
  it_behaves_like "Windows Media Player has version number", "11.0.6002.18005"
end

describe "UserAgent: NSPlayer/11.0.6002.18049 WMFSDK/11.0" do
  before do
    @useragent = UserAgent.parse("NSPlayer/11.0.6002.18049 WMFSDK/11.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows Vista"
  it_behaves_like "Windows Media Player has version number", "11.0.6002.18049"

  it "should return '11.0' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("11.0")
  end

  it "should have WMFSDK11" do
    expect(@useragent.has_wmfsdk?("11.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/11.0.6002.18311" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/11.0.6002.18311")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player isn't using WMFSDK"
  it_behaves_like "Windows Media Player runs on", "Windows Vista"
  it_behaves_like "Windows Media Player has version number", "11.0.6002.18311"
end

# FIXME: User agents for Windows 7 and Windows 8

describe "UserAgent: NSPlayer/12.00.9600.17031 WMFSDK/12.00.9600.17031" do
  before do
    @useragent = UserAgent.parse("NSPlayer/12.00.9600.17031 WMFSDK/12.00.9600.17031")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 8.1"
  it_behaves_like "Windows Media Player has version number", "12.00.9600.17031"

  it "should return '12.00.9600.17031' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("12.00.9600.17031")
  end

  it "should have WMFSDK12" do
    expect(@useragent.has_wmfsdk?("12.0")).to eq(true)
  end
end

describe "UserAgent: Windows-Media-Player/12.0.9841.0" do
  before do
    @useragent = UserAgent.parse("Windows-Media-Player/12.0.9841.0")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 10"
  it_behaves_like "Windows Media Player has version number", "12.0.9841.0"
end

describe "UserAgent: NSPlayer/12.00.9841.0000 WMFSDK/12.00.9841.0000" do
  before do
    @useragent = UserAgent.parse("NSPlayer/12.00.9841.0000 WMFSDK/12.00.9841.0000")
  end

  it_behaves_like "Windows Media Player"
  it_behaves_like "Windows Media Player runs on", "Windows 10"
  it_behaves_like "Windows Media Player has version number", "12.00.9841.0000"

  it "should return '12.00.9841.0000' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("12.00.9841.0000")
  end

  it "should have WMFSDK12" do
    expect(@useragent.has_wmfsdk?("12.0")).to eq(true)
  end
end

describe "UserAgent: NSPlayer/12.00.9651.0000 WMFSDK/12.00.9651.0000" do
  before do
    @useragent = UserAgent.parse("NSPlayer/12.00.9651.0000 WMFSDK/12.00.9651.0000")
  end

  it_behaves_like "Windows Media Player Mobile"
  it_behaves_like "Windows Media Player runs on", "Windows Phone 8.1"
  it_behaves_like "Windows Media Player has version number", "12.00.9651.0000"

  it "should return '12.00.9651.0000' as its WMFSDK version" do
    expect(@useragent.wmfsdk_version).to eq("12.00.9651.0000")
  end

  it "should have WMFSDK12" do
    expect(@useragent.has_wmfsdk?("12.0")).to eq(true)
  end
end
