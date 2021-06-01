require 'user_agent'

shared_examples_for 'Chrome browser' do |version, platform, os, type|
  it "should return 'Chrome' as its browser" do
    expect(useragent.browser).to eq('Chrome')
  end

  it "should return '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "should return '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "should return '#{os}' as its os" do
    expect(useragent.os).to eq(os)
  end

  if type == :desktop
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  elsif type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

# http://www.useragentstring.com/Chrome30.0.1599.17_id_19721.php
describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36") }

  it_behaves_like 'Chrome browser', '30.0.1599.17', 'Windows', 'Windows 8', :desktop
end

# http://www.useragentstring.com/Chrome29.0.1547.62_id_19709.php
describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36") }

  it_behaves_like 'Chrome browser', '29.0.1547.62', 'Windows', 'Windows 7', :desktop
end

describe "UserAgent: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36") }

  it_behaves_like 'Chrome browser', '29.0.1547.57', 'X11', 'Linux x86_64', :desktop
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25") }

  it_behaves_like 'Chrome browser', '28.0.1500.16', 'iPhone', 'iOS 6.1.3', :mobile

  it "should return '536.26' as its build" do
    expect(useragent.build).to eq("536.26")
  end

  it "should return '536.26' as its webkit version" do
    expect(useragent.webkit.version).to eq("536.26")
  end
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.40 Safari/537.17" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.40 Safari/537.17") }

  it_behaves_like 'Chrome browser', '24.0.1312.40', 'Macintosh', 'OS X 10.8.2', :desktop
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19") }

  it_behaves_like 'Chrome browser', '18.0.1025.168', 'Windows', 'Windows 7', :desktop

  it "should return '535.19' as its build" do
    expect(useragent.build).to eq("535.19")
  end

  it "should return '535.19' as its webkit version" do
    expect(useragent.webkit.version).to eq("535.19")
  end
end

describe "Mozilla/5.0 (Linux; Android 4.2; Nexus 7 Build/JOP40C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 4.2; Nexus 7 Build/JOP40C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19") }

  it_behaves_like 'Chrome browser', '18.0.1025.166', 'Android', 'Android 4.2', :mobile
end


describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.639.0 Safari/534.16'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.639.0 Safari/534.16") }

  it_behaves_like 'Chrome browser', '10.0.639.0', 'Macintosh', 'OS X 10.6.5', :desktop

  it "should return '534.16' as its build" do
    expect(useragent.build).to eq("534.16")
  end

  it "should return '534.16' as its webkit version" do
    expect(useragent.webkit.version).to eq("534.16")
  end

  it "should return 'en-US' as its localization" do
    expect(useragent.localization).to eq("en-US")
  end

  it "should be greater than Chrome 8.0" do
    other = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
    expect(useragent).to be > other
  end

  it "should not be less than Chrome 8.0" do
    other = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
    expect(useragent).not_to be < other
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10") }

  it_behaves_like 'Chrome browser', '8.0.552.231', 'Macintosh', 'OS X 10.6.5', :desktop

  it "should return '534.10' as its build" do
    expect(useragent.build).to eq("534.10")
  end

  it "should return '534.10' as its webkit version" do
    expect(useragent.webkit.version).to eq("534.10")
  end

  it "should return 'en-US' as its localization" do
    expect(useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 AppleWebKit/534.10 Chrome/8.0.552.215 Safari/534.10'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 AppleWebKit/534.10 Chrome/8.0.552.215 Safari/534.10") }

  it_behaves_like 'Chrome browser', '8.0.552.215', nil, nil

  it "should return '534.10' as its build" do
    expect(useragent.build).to eq("534.10")
  end

  it "should return '534.10' as its webkit version" do
    expect(useragent.webkit.version).to eq("534.10")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0") }

  it_behaves_like 'Chrome browser', '6.0', 'Windows', 'Windows 7', :desktop

  it "should return '533.2' as its build" do
    expect(useragent.build).to eq("533.2")
  end

  it "should return '533.2' as its webkit version" do
    expect(useragent.webkit.version).to eq("533.2")
  end

  it "should return 'en-US' as its localization" do
    expect(useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13'" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13") }

  it_behaves_like 'Chrome browser', '0.0.2', 'Windows', 'Windows XP', :desktop

  it "should return '525.13' as its build" do
    expect(useragent.build).to eq("525.13")
  end

  it "should return '525.13' as its webkit version" do
    expect(useragent.webkit.version).to eq("525.13")
  end

  it "should return 'en-US' as its localization" do
    expect(useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36") }

  it_behaves_like 'Chrome browser', '29.0.1547.62', 'X11', 'Linux x86_64', :desktop

  it "should return '537.36' as its build" do
    expect(useragent.build).to eq("537.36")
  end

  it "should return '537.36' as its webkit version" do
    expect(useragent.webkit.version).to eq("537.36")
  end
end
