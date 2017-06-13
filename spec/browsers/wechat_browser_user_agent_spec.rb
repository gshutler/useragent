require 'user_agent'

describe "UserAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238 MicroMessenger/6.3.16 NetType/WIFI Language/zh_CN'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E238 MicroMessenger/6.3.16 NetType/WIFI Language/zh_CN")
  end

  it "should return WechatBrowser" do
    expect(@useragent.browser).to eq("Wechat Browser")
  end

  it "should return '6.3.16' as its version" do
    expect(@useragent.version).to eq("6.3.16")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 9.3.1' as its os" do
    expect(@useragent.os).to eq("iOS 9.3.1")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Linux; Android 4.4.4; MI 4LTE Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile MQQBrowser/6.2 TBS/036215 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 4.4.4; MI 4LTE Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile MQQBrowser/6.2 TBS/036215 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN")
  end

  it "should return WechatBrowser" do
    expect(@useragent.browser).to eq("Wechat Browser")
  end

  it "should return '6.3.16.49_r03ae324.780' as its version" do
    expect(@useragent.version).to eq("6.3.16.49_r03ae324.780")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return 'Android 4.4.4' as its os" do
    expect(@useragent.os).to eq("Android 4.4.4")
  end
end

