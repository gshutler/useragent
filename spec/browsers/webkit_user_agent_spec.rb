require 'user_agent'

shared_examples_for "Safari browser" do
  it "should return 'Safari' as its browser" do
    expect(@useragent.browser).to eq("Safari")
  end

  it "should return :strong as its security" do
    expect(@useragent.security).to eq(:strong)
  end
end

describe "UserAgent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '533.16' as its build" do
    expect(@useragent.build).to eq("533.16")
  end

  it "should return '5.0' as its version" do
    expect(@useragent.version).to eq("5.0")
  end

  it "should return '533.16' as its webkit version" do
    expect(@useragent.webkit.version).to eq("533.16")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.6.3' as its os" do
    expect(@useragent.os).to eq("OS X 10.6.3")
  end

  it "should return 'en-us' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    expect(@useragent.build).to eq("526.9")
  end

  it "should return '4.0dp1' as its version" do
    expect(@useragent.version).to eq("4.0dp1")
  end

  it "should return '526.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("526.9")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.5.3' as its os" do
    expect(@useragent.os).to eq("OS X 10.5.3")
  end

  it "should return 'en-us' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    expect(@useragent.build).to eq("526.9")
  end

  it "should return '4.0dp1' as its version" do
    expect(@useragent.version).to eq("4.0dp1")
  end

  it "should return '526.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("526.9")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it_should_behave_like "Safari browser"

  it "should return '525.18' as its build" do
    expect(@useragent.build).to eq("525.18")
  end

  it "should return '3.1.1' as its version" do
    expect(@useragent.version).to eq("3.1.1")
  end

  it "should return '525.18' as its webkit version" do
    expect(@useragent.webkit.version).to eq("525.18")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.5.3' as its os" do
    expect(@useragent.os).to eq("OS X 10.5.3")
  end

  it "should return 'en-us' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it "should be == 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    expect(@useragent).to eq(@useragent)
  end

  it "should not be == 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    expect(@useragent).not_to eq(UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3"))
  end

  it "should be > 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    expect(@useragent).to be > UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it "should not be > 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    expect(@useragent).not_to be > UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should be < 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    expect(@useragent).to be < UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should not be < 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    expect(@useragent).not_to be < @useragent
  end

  it "should be >= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    expect(@useragent).to be >= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it "should not be >= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    expect(@useragent).not_to be >= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should be <= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    expect(@useragent).to be <= @useragent
  end

  it "should not be <= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    expect(@useragent).not_to be <= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it_should_behave_like "Safari browser"

  it "should return '525.18' as its build" do
    expect(@useragent.build).to eq("525.18")
  end

  it "should return '3.1.1' as its version" do
    expect(@useragent.version).to eq("3.1.1")
  end

  it "should return '525.18' as its webkit version" do
    expect(@useragent.webkit.version).to eq("525.18")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '419.3' as its build" do
    expect(@useragent.build).to eq("419")
  end

  it "should return '2.0.4' as its version" do
    expect(@useragent.version).to eq("2.0.4")
  end

  it "should return '419' as its webkit version" do
    expect(@useragent.webkit.version).to eq("419")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2")
  end

  it_should_behave_like "Safari browser"

  it "should return '412.2' as its build" do
    expect(@useragent.build).to eq("412.6")
  end

  it "should return '2.0' as its version" do
    expect(@useragent.version).to eq("2.0")
  end

  it "should return '412.6' as its webkit version" do
    expect(@useragent.webkit.version).to eq("412.6")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2")
  end

  it_should_behave_like "Safari browser"

  it "should return '412.2.2' as its build" do
    expect(@useragent.build).to eq("412.6.2")
  end

  it "should return '2.0' as its version" do
    expect(@useragent.version).to eq("2.0")
  end

  it "should return '412.6.2' as its webkit version" do
    expect(@useragent.webkit.version).to eq("412.6.2")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.6' as its build" do
    expect(@useragent.build).to eq("312.8")
  end

  it "should return '1.3.2' as its version" do
    expect(@useragent.version).to eq("1.3.2")
  end

  it "should return '312.8' as its webkit version" do
    expect(@useragent.webkit.version).to eq("312.8")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312")
  end

  it_should_behave_like "Safari browser"

  it "should return '312' as its build" do
    expect(@useragent.build).to eq("312.1.1")
  end

  it "should return '1.3' as its version" do
    expect(@useragent.version).to eq("1.3")
  end

  it "should return '312.1.1' as its webkit version" do
    expect(@useragent.webkit.version).to eq("312.1.1")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("fr-ch")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3.3' as its build" do
    expect(@useragent.build).to eq("312.5.2")
  end

  it "should return '1.3.1' as its version" do
    expect(@useragent.version).to eq("1.3.1")
  end

  it "should return '312.5.2' as its webkit version" do
    expect(@useragent.webkit.version).to eq("312.5.2")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("es-es")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3.1' as its build" do
    expect(@useragent.build).to eq("312.5.1")
  end

  it "should return '1.3.1' as its version" do
    expect(@useragent.version).to eq("1.3.1")
  end

  it "should return '312.5.1' as its webkit version" do
    expect(@useragent.webkit.version).to eq("312.5.1")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("fr")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3' as its build" do
    expect(@useragent.build).to eq("312.5")
  end

  it "should return '1.3.1' as its version" do
    expect(@useragent.version).to eq("1.3.1")
  end

  it "should return '312.5' as its webkit version" do
    expect(@useragent.webkit.version).to eq("312.5")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125")
  end

  it_should_behave_like "Safari browser"

  it "should return '125' as its build" do
    expect(@useragent.build).to eq("124")
  end

  it "should return '1.2' as its version" do
    expect(@useragent.version).to eq("1.2")
  end

  it "should return '124' as its webkit version" do
    expect(@useragent.webkit.version).to eq("124")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12")
  end

  it_should_behave_like "Safari browser"

  it "should return '125.12' as its build" do
    expect(@useragent.build).to eq("125.5.7")
  end

  it "should return '1.2.4' as its version" do
    expect(@useragent.version).to eq("1.2.4")
  end

  it "should return '125.5.7' as its webkit version" do
    expect(@useragent.webkit.version).to eq("125.5.7")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5")
  end

  it_should_behave_like "Safari browser"

  it "should return '85.5' as its build" do
    expect(@useragent.build).to eq("85.7")
  end

  it "should return '1.0' as its version" do
    expect(@useragent.version).to eq("1.0")
  end

  it "should return '85.7' as its webkit version" do
    expect(@useragent.webkit.version).to eq("85.7")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("fr-fr")
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    expect(@useragent.build).to eq("420.1")
  end

  it "should return '3.0' as its version" do
    expect(@useragent.version).to eq("3.0")
  end

  it "should return '420.1' as its webkit version" do
    expect(@useragent.webkit.version).to eq("420.1")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'CPU like Mac OS X' as its os" do
    expect(@useragent.os).to eq("CPU like Mac OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    expect(@useragent.build).to eq("420.1")
  end

  it "should return '3.0' as its version" do
    expect(@useragent.version).to eq("3.0")
  end

  it "should return '420.1' as its webkit version" do
    expect(@useragent.webkit.version).to eq("420.1")
  end

  it "should return 'iPod' as its platform" do
    expect(@useragent.platform).to eq("iPod")
  end

  it "should return 'CPU like Mac OS X' as its os" do
    expect(@useragent.os).to eq("CPU like Mac OS X")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10")
  end

  it_should_behave_like "Safari browser"

  it "should return '531.21.10' as its build" do
    expect(@useragent.build).to eq("531.21.10")
  end

  it "should return '4.0.4' as its version" do
    expect(@useragent.version).to eq("4.0.4")
  end

  it "should return '531.21.10' as its webkit version" do
    expect(@useragent.webkit.version).to eq("531.21.10")
  end

  it "should return 'iPad' as its platform" do
    expect(@useragent.platform).to eq("iPad")
  end

  it "should return 'iOS 3.2' as its os" do
    expect(@useragent.os).to eq("iOS 3.2")
  end

  it "should return 'en-us' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '528.18' as its build" do
    expect(@useragent.build).to eq("528.18")
  end

  it "should return '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "should return '528.18' as its webkit version" do
    expect(@useragent.webkit.version).to eq("528.18")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 3.1.3' as its os" do
    expect(@useragent.os).to eq("iOS 3.1.3")
  end

  it "should return 'en-us' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '528.18' as its build" do
    expect(@useragent.build).to eq("528.18")
  end

  it "should return '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "should return '528.18' as its webkit version" do
    expect(@useragent.webkit.version).to eq("528.18")
  end

  it "should return 'iPod' as its platform" do
    expect(@useragent.platform).to eq("iPod")
  end

  it "should return 'iOS 3.1.3' as its os" do
    expect(@useragent.os).to eq("iOS 3.1.3")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4")
  end

  it_should_behave_like "Safari browser"

  it "should return '533.19.4' as its build" do
    expect(@useragent.build).to eq("533.19.4")
  end

  it "should return '5.0.3' as its version" do
    expect(@useragent.version).to eq("5.0.3")
  end

  it "should return '533.19.4' as its webkit version" do
    expect(@useragent.webkit.version).to eq("533.19.4")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.6.5' as its os" do
    expect(@useragent.os).to eq("OS X 10.6.5")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    expect(@useragent.build).to eq("532.9")
  end

  it "should return '4.0.5' as its version" do
    expect(@useragent.version).to eq("4.0.5")
  end

  it "should return '532.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("532.9")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 4.1'" do
    expect(@useragent.os).to eq("iOS 4.1")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/8A306'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/8A306")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    expect(@useragent.build).to eq("532.9")
  end

  it "should return '4.0.1' as its version" do
    expect(@useragent.version).to eq("4.0.1")
  end

  it "should return '532.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("532.9")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 4.0.1'" do
    expect(@useragent.os).to eq("iOS 4.0.1")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    expect(@useragent.build).to eq("532.9")
  end

  it "should return '4.0.5' as its version" do
    expect(@useragent.version).to eq("4.0.5")
  end

  it "should return '532.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("532.9")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone Simulator")
  end

  it "should return 'iOS 4.0.1'" do
    expect(@useragent.os).to eq("iOS 4.0.1")
  end

  it "should return 'en' as its localization" do
    expect(@useragent.localization).to eq("en-us")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Linux; U; Android 1.5; de-; HTC Magic Build/PLAT-RC33) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 1.5; de-; HTC Magic Build/PLAT-RC33) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1")
  end

  it "should return 'Android' as its browser" do
    expect(@useragent.browser).to eq("Android")
  end

  it "should return '528.5+' as its build" do
    expect(@useragent.build).to eq("528.5+")
  end

  it "should return '3.1.2' as its version" do
    expect(@useragent.version).to eq("3.1.2")
  end

  it "should return '528.5+' as its webkit version" do
    expect(@useragent.webkit.version).to eq("528.5+")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return 'Android 1.5' as its os" do
    expect(@useragent.os).to eq("Android 1.5")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en) AppleWebKit/534.1+ (KHTML, Like Gecko) Version/6.0.0.141 Mobile Safari/534.1+'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en) AppleWebKit/534.1+ (KHTML, Like Gecko) Version/6.0.0.141 Mobile Safari/534.1+")
  end

  it "should return 'BlackBerry' as its browser" do
    expect(@useragent.browser).to eq("BlackBerry")
  end

  it "should return '534.1+' as its build" do
    expect(@useragent.build).to eq("534.1+")
  end

  it "should return '6.0.0.141' as its version" do
    expect(@useragent.version).to eq("6.0.0.141")
  end

  it "should return '534.1+' as its webkit version" do
    expect(@useragent.webkit.version).to eq("534.1+")
  end

  it "should return 'BlackBerry' as its platform" do
    expect(@useragent.platform).to eq("BlackBerry")
  end

  it "should return 'BlackBerry 9800' as its os" do
    expect(@useragent.os).to eq("BlackBerry 9800")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.3+ (KHTML, like Gecko) Version/10.0.9.388 Mobile Safari/537.3+'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (BB10; Touch) AppleWebKit/537.3+ (KHTML, like Gecko) Version/10.0.9.388 Mobile Safari/537.3+")
  end

  it "should return 'BlackBerry' as its browser" do
    expect(@useragent.browser).to eq("BlackBerry")
  end

  it "should return '537.3+' as its build" do
    expect(@useragent.build).to eq("537.3+")
  end

  it "should return '10.0.9.388' as its version" do
    expect(@useragent.version).to eq("10.0.9.388")
  end

  it "should return '537.3+' as its webkit version" do
    expect(@useragent.webkit.version).to eq("537.3+")
  end

  it "should return 'BlackBerry' as its platform" do
    expect(@useragent.platform).to eq("BlackBerry")
  end

  it "should return 'Touch' as its os" do
    expect(@useragent.os).to eq("Touch")
  end

  it { expect(@useragent).to be_mobile }
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.51.22 (KHTML, like Gecko) Version/5.1.1 Safari/534.51.22" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.51.22 (KHTML, like Gecko) Version/5.1.1 Safari/534.51.22")
  end

  it "should return 'Safari' as its browser" do
    expect(@useragent.browser).to eq("Safari")
  end

  it "should return nil as its security" do
    expect(@useragent.security).to be_nil
  end

  it "should return '534.51.22' as its build" do
    expect(@useragent.build).to eq("534.51.22")
  end

  it "should return '5.1.1' as its version" do
    expect(@useragent.version).to eq("5.1.1")
  end

  it "should return '534.51.22' as its webkit version" do
    expect(@useragent.webkit.version).to eq("534.51.22")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.7.2' as its os" do
    expect(@useragent.os).to eq("OS X 10.7.2")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.52.7 (KHTML, like Gecko)" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.52.7 (KHTML, like Gecko)")
  end

  it "should return 'Safari' as its browser" do
    expect(@useragent.browser).to eq("Safari")
  end

  it "should return '5.1.2' as its version" do
    expect(@useragent.version).to eq("5.1.2")
  end
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Salamander/44.0 Safari/537.36" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Salamander/44.0 Safari/537.36")
  end

  it "should return '537.36' as its build" do
    expect(@useragent.build).to eq("537.36")
  end

  it "should return null as its version" do
    expect(@useragent.version).to eq("")
  end

  it "should return '537.36' as its webkit version" do
    expect(@useragent.webkit.version).to eq("537.36")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.9.5' as its os" do
    expect(@useragent.os).to eq("OS X 10.9.5")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (X11; CrOS armv7l 4537.56.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.38 Safari/537.36" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; CrOS armv7l 4537.56.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.38 Safari/537.36")
  end

  it "should return '537.36' as its build" do
    expect(@useragent.build).to eq("537.36")
  end

  it "should return '30.0.1599.38' as its version" do
    expect(@useragent.version).to eq("30.0.1599.38")
  end

  it "should return '537.36' as its webkit version" do
    expect(@useragent.webkit.version).to eq("537.36")
  end

  it "should return 'ChromeOS' as its platform" do
    expect(@useragent.platform).to eq("ChromeOS")
  end

  it "should return 'ChromeOS 4537.56.0' as its os" do
    expect(@useragent.os).to eq("ChromeOS 4537.56.0")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (X11; CrOS x86_64 4920.71.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.95 Safari/537.36" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; CrOS x86_64 4920.71.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.95 Safari/537.36")
  end

  it "should return '537.36' as its build" do
    expect(@useragent.build).to eq("537.36")
  end

  it "should return '32.0.1700.95' as its version" do
    expect(@useragent.version).to eq("32.0.1700.95")
  end

  it "should return '537.36' as its webkit version" do
    expect(@useragent.webkit.version).to eq("537.36")
  end

  it "should return 'ChromeOS' as its platform" do
    expect(@useragent.platform).to eq("ChromeOS")
  end

  it "should return 'ChromeOS 4920.71.0' as its os" do
    expect(@useragent.os).to eq("ChromeOS 4920.71.0")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (X11; U; CrOS i686 9.10.0; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.253.0 Safari/532.5" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; U; CrOS i686 9.10.0; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.253.0 Safari/532.5")
  end

  it "should return '532.5' as its build" do
    expect(@useragent.build).to eq("532.5")
  end

  it "should return '4.0.253.0' as its version" do
    expect(@useragent.version).to eq("4.0.253.0")
  end

  it "should return '532.5' as its webkit version" do
    expect(@useragent.webkit.version).to eq("532.5")
  end

  it "should return 'ChromeOS' as its platform" do
    expect(@useragent.platform).to eq("ChromeOS")
  end

  it "should return 'ChromeOS 9.10.0' as its os" do
    expect(@useragent.os).to eq("ChromeOS 9.10.0")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (iPhone; U; fr; CPU iPhone OS 4_2_1 like Mac OS X; fr) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148a Safari/6533.18.5" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; fr; CPU iPhone OS 4_2_1 like Mac OS X; fr) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148a Safari/6533.18.5")
  end

  it "should return '533.17.9' as its build" do
    expect(@useragent.build).to eq("533.17.9")
  end

  it "should return '5.0.2' as its version" do
    expect(@useragent.version).to eq("5.0.2")
  end

  it "should return '533.17.9' as its webkit version" do
    expect(@useragent.webkit.version).to eq("533.17.9")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 4.2.1' as its os" do
    expect(@useragent.os).to eq("iOS 4.2.1")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30")
  end

  it "should return 'Android' as its browser" do
    expect(@useragent.browser).to eq("Android")
  end

  it "should return :strong as its security" do
    expect(@useragent.security).to eq(:strong)
  end

  it "should return '534.30' as its build" do
    expect(@useragent.build).to eq("534.30")
  end

  it "should return '4.0' as its version" do
    expect(@useragent.version).to eq("4.0")
  end

  it "should return '534.30' as its webkit version" do
    expect(@useragent.webkit.version).to eq("534.30")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return 'Android 4.0.3' as its os" do
    expect(@useragent.os).to eq("Android 4.0.3")
  end

  it "should return 'ko-kr' as its localization" do
    expect(@useragent.localization).to eq("ko-kr")
  end

  it { expect(@useragent).to be_mobile }
end

describe "UserAgent: HUAWEI_MT7-TL00_TD/5.0 Android/4.4.2 (Linux; U; Android 4.4.2; zh-cn) Release/01.18.2014 Browser/WAP2.0 (AppleWebKit/537.36) Mobile Safari/537.36" do
  before do
    @useragent = UserAgent.parse("HUAWEI_MT7-TL00_TD/5.0 Android/4.4.2 (Linux; U; Android 4.4.2; zh-cn) Release/01.18.2014 Browser/WAP2.0 (AppleWebKit/537.36) Mobile Safari/537.36")
  end

  it "should return 'Android' as its browser" do
    expect(@useragent.browser).to eq("Android")
  end

  it "should return :strong as its security" do
    expect(@useragent.security).to eq(:strong)
  end

  it "should return '537.36' as its build" do
    expect(@useragent.build).to eq("537.36")
  end

  it "should return nil as its version" do
    expect(@useragent.version).to be_nil
  end

  it "should return '537.36' as its webkit version" do
    expect(@useragent.webkit.version).to eq("537.36")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return 'Android 4.4.2' as its os" do
    expect(@useragent.os).to eq("Android 4.4.2")
  end

  it "should return 'zh-cn' as its localization" do
    expect(@useragent.localization).to eq("zh-cn")
  end

  it { expect(@useragent).to be_mobile }
end
