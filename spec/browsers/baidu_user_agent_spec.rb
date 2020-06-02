require 'user_agent'

shared_examples_for "Baidu browser" do
  it "should return 'Baidu Browser' as its browser" do
    expect(@useragent.browser).to eq("Baidu Browser")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end
end

describe "Android 4.4.4; zh-cn; Coolpad V1-C Build/KTU84P baidubrowser/7.9.12.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; Coolpad V1-C Build/KTU84P) AppleWebKit/534.24 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.24 T5/2.0 baidubrowser/7.9.12.0 (Baidu; P1 4.4.4)")
  end

  it_should_behave_like "Baidu browser"

  it "should return '7.9.12.0' as its version" do
    expect(@useragent.version).to eq("7.9.12.0")
  end

  it "should return 'Android 4.4.4' as its os" do
    expect(@useragent.os).to eq("Android 4.4.4")
  end
end

describe "Android 4.3; zh-cn; HUAWEI C8816 Build/HuaweiC8816 baidubrowser/5.6.4.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; HUAWEI C8816 Build/HuaweiC8816) AppleWebKit/534.24 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.24 T5/2.0 baidubrowser/5.6.4.0 (Baidu; P1 4.3)")
  end

  it_should_behave_like "Baidu browser"

  it "should return '5.6.4.0' as its version" do
    expect(@useragent.version).to eq("5.6.4.0")
  end

  it "should return 'Android 4.3' as its os" do
    expect(@useragent.os).to eq("Android 4.3")
  end
end

describe "Android 4.2.2; zh-cn; GT-N7100 Build/JDQ39E baidubrowser/5.6.4.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; GT-N7100 Build/JDQ39E) AppleWebKit/534.24 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.24 T5/2.0 baidubrowser/5.6.4.0 (Baidu; P1 4.2.2)
")
  end

  it_should_behave_like "Baidu browser"

  it "should return '5.6.4.0' as its version" do
    expect(@useragent.version).to eq("5.6.4.0")
  end

  it "should return 'Android 4.2.2' as its os" do
    expect(@useragent.os).to eq("Android 4.2.2")
  end
end

describe "Android 7.0; HUAWEI NXT-AL10 Build/HUAWEINXT-AL10 baidubrowser/7.9.12.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 7.0; HUAWEI NXT-AL10 Build/HUAWEINXT-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/48.0.2564.116 Mobile Safari/537.36 baidubrowser/7.9.12.0 (Baidu; P1 7.0)NULL")
  end

  it_should_behave_like "Baidu browser"

  it "should return '7.9.12.0' as its version" do
    expect(@useragent.version).to eq("7.9.12.0")
  end

  it "should return 'Android 7.0' as its os" do
    expect(@useragent.os).to eq("Android 7.0")
  end
end

describe "Android 6.0.1; vivo X9 Build/MMB29M baidubrowser/7.9.12.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 6.0.1; vivo X9 Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/48.0.2564.116 Mobile Safari/537.36 baidubrowser/7.9.12.0 (Baidu; P1 6.0.1)NULL")
  end

  it_should_behave_like "Baidu browser"

  it "should return '7.9.12.0' as its version" do
    expect(@useragent.version).to eq("7.9.12.0")
  end

  it "should return 'Android 6.0.1' as its os" do
    expect(@useragent.os).to eq("Android 6.0.1")
  end
end

describe "Android 7.0; EVA-AL10 Build/HUAWEIEVA-AL10 baidubrowser/7.9.12.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 7.0; EVA-AL10 Build/HUAWEIEVA-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/48.0.2564.116 Mobile Safari/537.36 baidubrowser/7.9.12.0 (Baidu; P1 7.0)NULL")
  end

  it_should_behave_like "Baidu browser"

  it "should return '7.9.12.0' as its version" do
    expect(@useragent.version).to eq("7.9.12.0")
  end

  it "should return 'Android 7.0' as its os" do
    expect(@useragent.os).to eq("Android 7.0")
  end
end

describe "Android 6.0; HUAWEI GRA-UL00 Build/HUAWEIGRA-UL00 baidubrowser/7.9.12.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 6.0; HUAWEI GRA-UL00 Build/HUAWEIGRA-UL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/48.0.2564.116 Mobile Safari/537.36 baidubrowser/7.9.12.0 (Baidu; P1 6.0)NULL")
  end

  it_should_behave_like "Baidu browser"

  it "should return '7.9.12.0' as its version" do
    expect(@useragent.version).to eq("7.9.12.0")
  end

  it "should return 'Android 6.0' as its os" do
    expect(@useragent.os).to eq("Android 6.0")
  end
end
