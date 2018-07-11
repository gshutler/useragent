require 'user_agent'

shared_examples 'OkHttp' do
  it "returns 'OkHttp' as its browser" do
    expect(useragent.browser).to eq('OkHttp')
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end
end

describe "UserAgent: okhttp/3.8.1" do
  let!(:useragent) { UserAgent.parse("okhttp/3.8.1") }

  it_behaves_like 'OkHttp'

  it "returns '3.8.1' as its version" do
    expect(useragent.version).to eq('3.8.1')
  end
end

describe "UserAgent: okhttp/3.10.0 BMID/E67925BB27" do
  let!(:useragent) { UserAgent.parse("okhttp/3.10.0 BMID/E67925BB27") }

  it_behaves_like 'OkHttp'

  it "returns '3.10.0' as its version" do
    expect(useragent.version).to eq('3.10.0')
  end
end

describe "UserAgent: okhttp/3.8.1 Dalvik/2.1.0 (Linux; U; Android 7.1.1; vivo X20A Build/NMF26X) baiduboxapp/10.1.0.11 (Baidu; P1 7.1.1)" do
  let!(:useragent) { UserAgent.parse("okhttp/3.8.1 Dalvik/2.1.0 (Linux; U; Android 7.1.1; vivo X20A Build/NMF26X) baiduboxapp/10.1.0.11 (Baidu; P1 7.1.1)") }

  it_behaves_like 'OkHttp'

  it "returns '3.8.1' as its version" do
    expect(useragent.version).to eq('3.8.1')
  end

  it "returns 'Android 7.1.1' as its operating system" do
    expect(useragent.os).to eq('Android 7.1.1')
  end
end

describe "UserAgent: okhttp/2.7.5 nyt-android/6.19.3 ,okhttp/2.7.5 nyt-android/6.19.3" do
  let!(:useragent) { UserAgent.parse("okhttp/2.7.5 nyt-android/6.19.3 ,okhttp/2.7.5 nyt-android/6.19.3") }

  it_behaves_like 'OkHttp'

  it "returns '2.7.5' as its version" do
    expect(useragent.version).to eq('2.7.5')
  end
end
