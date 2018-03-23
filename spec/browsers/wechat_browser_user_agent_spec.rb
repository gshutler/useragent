require "spec_helper"
require "user_agent"

describe "UserAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238 MicroMessenger/6.3.16 NetType/WIFI Language/zh_CN'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238 MicroMessenger/6.3.16 NetType/WIFI Language/zh_CN")
  end

  it "returns WechatBrowser" do
    expect(@useragent.browser).to eq("Wechat Browser")
  end

  it "returns '6.3.16' as its version" do
    expect(@useragent.version).to eq("6.3.16")
  end

  it "returns 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "returns 'iOS 9.3.1' as its os" do
    expect(@useragent.os).to eq("iOS 9.3.1")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Linux; Android 4.4.4; MI 4LTE Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile MQQBrowser/6.2 TBS/036215 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 4.4.4; MI 4LTE Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile MQQBrowser/6.2 TBS/036215 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN")
  end

  it "returns WechatBrowser" do
    expect(@useragent.browser).to eq("Wechat Browser")
  end

  it "returns '6.3.16.49_r03ae324.780' as its version" do
    expect(@useragent.version).to eq("6.3.16.49_r03ae324.780")
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "returns 'Android 4.4.4' as its os" do
    expect(@useragent.os).to eq("Android 4.4.4")
  end
end

describe "Not well-formed UserAgent: LenovoA658t_TD/1.0 Android 4.0.3 Release/10.01.2012 Browser/WAP2.0 appleWebkit/534.30 MicroMessenger/6.2.4.54_r266a9ba.601 NetType/cmnet Language/zh_CN" do
  before do
    @useragent = UserAgent.parse("LenovoA658t_TD/1.0 Android 4.0.3 Release/10.01.2012 Browser/WAP2.0 appleWebkit/534.30 MicroMessenger/6.2.4.54_r266a9ba.601 NetType/cmnet Language/zh_CN")
  end

  it "returns WechatBrowser" do
    expect(@useragent.browser).to eq("Wechat Browser")
  end

  it "returns '6.2.4.54_r266a9ba.601' as its version" do
    expect(@useragent.version).to eq("6.2.4.54_r266a9ba.601")
  end

  it "returns nil as its platform" do
    expect(@useragent.platform).to be_nil
  end

  it "returns nil as its os" do
    expect(@useragent.os).to be_nil
  end
end
