require 'user_agent'

shared_examples_for "Firefox browser" do
  it "should return 'Firefox' as its browser" do
    expect(@useragent.browser).to eq("Firefox")
  end

  it "should return :strong as its security" do
    expect(@useragent.security).to eq(:strong)
  end
end

describe 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b8) Gecko/20100101 Firefox/4.0b8' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b8) Gecko/20100101 Firefox/4.0b8')
  end

  it_should_behave_like "Firefox browser"

  it "should return '4.0b8' as its version" do
    expect(@useragent.version).to eq("4.0b8")
  end

  it "should return '20100101' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20100101")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.6' as its os" do
    expect(@useragent.os).to eq("OS X 10.6")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end

  it { expect(@useragent).not_to be_mobile }
end

describe 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13')
  end

  it_should_behave_like "Firefox browser"

  it "should return '3.6.13' as its version" do
    expect(@useragent.version).to eq("3.6.13")
  end

  it "should return '20101203' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20101203")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.6' as its os" do
    expect(@useragent.os).to eq("OS X 10.6")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008070206 Firefox/3.0.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008070206 Firefox/3.0.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '3.0.1' as its version" do
    expect(@useragent.version).to eq("3.0.1")
  end

  it "should return '2008070206' as its gecko version" do
    expect(@useragent.gecko.version).to eq("2008070206")
  end

  it "should return 'X11' as its platform" do
    expect(@useragent.platform).to eq("X11")
  end

  it "should return 'Linux i686' as its os" do
    expect(@useragent.os).to eq("Linux i686")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (X11; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64; rv:27.0) Gecko/20100101 Firefox/27.0")
  end

  it_should_behave_like "Firefox browser"

  it "should return '27.0' as its version" do
    expect(@useragent.version).to eq("27.0")
  end

  it "should return '20100101' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20100101")
  end

  it "should return 'X11' as its platform" do
    expect(@useragent.platform).to eq("X11")
  end

  it "should return 'Linux x86_64' as its os" do
    expect(@useragent.os).to eq("Linux x86_64")
  end

  it { expect(@useragent).not_to be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it_should_behave_like "Firefox browser"

  it "should return '2.0.0.14' as its version" do
    expect(@useragent.version).to eq("2.0.0.14")
  end

  it "should return '20080404' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20080404")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it_should_behave_like "Firefox browser"

  it "should return '2.0.0.14' as its version" do
    expect(@useragent.version).to eq("2.0.0.14")
  end

  it "should return '20080404' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20080404")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '16.0.1' as its version" do
    expect(@useragent.version).to eq("16.0.1")
  end

  it "should return '20121011' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20121011")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 7' as its os" do
    expect(@useragent.os).to eq("Windows 7")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; Win64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; Win64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '16.0.1' as its version" do
    expect(@useragent.version).to eq("16.0.1")
  end

  it "should return '20121011' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20121011")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 7' as its os" do
    expect(@useragent.os).to eq("Windows 7")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end
end

describe 'Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17.0')
  end

  it_should_behave_like "Firefox browser"

  it "should return '17.0' as its version" do
    expect(@useragent.version).to eq("17.0")
  end

  it "should return '20100101' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20100101")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end
end

describe 'UserAgent: Mozilla/5.0 (Windows NT 6.1; rv:17.0) Gecko/20100101 Firefox/17.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Windows NT 6.1; rv:17.0) Gecko/20100101 Firefox/17.0')
  end

  it_should_behave_like "Firefox browser"

  it "should return '17.0' as its version" do
    expect(@useragent.version).to eq("17.0")
  end

  it "should return '20100101' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20100101")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 7' as its os" do
    expect(@useragent.os).to eq("Windows 7")
  end

  it "should return nil as its localization" do
    expect(@useragent.localization).to be_nil
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.12' as its version" do
    expect(@useragent.version).to eq("1.5.0.12")
  end

  it "should return '20070508' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20070508")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'PPC Mac OS X Mach-O' as its os" do
    expect(@useragent.os).to eq("OS X")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.12' as its version" do
    expect(@useragent.version).to eq("1.5.0.12")
  end

  it "should return '20070508' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20070508")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060612 Firefox/1.5.0.4 Flock/0.7.0.17.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060612 Firefox/1.5.0.4 Flock/0.7.0.17.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.4' as its version" do
    expect(@useragent.version).to eq("1.5.0.4")
  end

  it "should return '20060612' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20060612")
  end

  it "should return 'X11' as its platform" do
    expect(@useragent.platform).to eq("X11")
  end

  it "should return 'Linux i686' as its os" do
    expect(@useragent.os).to eq("Linux i686")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080409 Camino/1.6 (like Firefox/2.0.0.14)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080409 Camino/1.6 (like Firefox/2.0.0.14)")
  end

  it "should return 'Camino' as its browser" do
    expect(@useragent.browser).to eq("Camino")
  end

  it "should return '1.6' as its version" do
    expect(@useragent.version).to eq("1.6")
  end

  it "should return '20080409' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20080409")
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

describe 'UserAgent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1) Gecko/20061024 Iceweasel/2.0 (Debian-2.0+dfsg-1)' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1) Gecko/20061024 Iceweasel/2.0 (Debian-2.0+dfsg-1)')
  end

  it "should return 'Iceweasel' as its browser" do
    expect(@useragent.browser).to eq("Iceweasel")
  end

  it "should return '2.0' as its version" do
    expect(@useragent.version).to eq("2.0")
  end

  it "should return '20061024' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20061024")
  end

  it "should return 'X11' as its platform" do
    expect(@useragent.platform).to eq("X11")
  end

  it "should return 'Linux i686' as its os" do
    expect(@useragent.os).to eq("Linux i686")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe 'UserAgent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.4) Gecko/20091017 SeaMonkey/2.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.4) Gecko/20091017 SeaMonkey/2.0')
  end

  it "should return 'Seamonkey' as its browser" do
    expect(@useragent.browser).to eq("Seamonkey")
  end

  it "should return '2.0' as its version" do
    expect(@useragent.version).to eq("2.0")
  end

  it "should return '20091017' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20091017")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.6' as its os" do
    expect(@useragent.os).to eq("OS X 10.6")
  end

  it "should return 'en-US' as its localization" do
    expect(@useragent.localization).to eq("en-US")
  end
end

describe 'Mozilla/5.0 (Android; Mobile; rv:19.0) Gecko/19.0 Firefox/19.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Android; Mobile; rv:19.0) Gecko/19.0 Firefox/19.0')
  end

  it_behaves_like 'Firefox browser'

  it 'returns true for mobile?' do
    expect(@useragent.mobile?).to be true
  end

  it "returns 'Android' as the platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns 'Android' as the operating system" do
    expect(@useragent.os).to eq('Android')
  end
end

describe 'Mozilla/5.0 (Mobile; rv:41.0) Gecko/41.0 Firefox/41.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Mobile; rv:41.0) Gecko/41.0 Firefox/41.0')
  end

  it_behaves_like 'Firefox browser'

  it 'returns true for mobile?' do
    expect(@useragent.mobile?).to be true
  end

  it "returns nil as the platform" do
    expect(@useragent.platform).to be_nil
  end

  it "returns nil as the operating system" do
    expect(@useragent.os).to be_nil
  end
end

describe 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:x.x.x) Gecko/20041107 Firefox/x.x' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:x.x.x) Gecko/20041107 Firefox/x.x')
  end

  it_should_behave_like "Firefox browser"

  it "should return 'x.x' as its version" do
    expect(@useragent.version).to eq("x.x")
  end

  it "should return '20041107' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20041107")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows XP' as its os" do
    expect(@useragent.os).to eq("Windows XP")
  end
end

shared_examples_for "PaleMoon browser" do
  it "should return 'PaleMoon' as its browser" do
    expect(@useragent.browser).to eq("PaleMoon")
  end
end

describe 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.7) Gecko/20140802 Firefox/24.7 PaleMoon/24.7.1' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.7) Gecko/20140802 Firefox/24.7 PaleMoon/24.7.1')
  end

  it_should_behave_like "PaleMoon browser"

  it "should return '24.7.1' as its version" do
    expect(@useragent.version).to eq("24.7.1")
  end

  it "should return '20140802' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20140802")
  end

  it "should return '24.7' as its firefox version" do
    expect(@useragent.firefox.version).to eq("24.7")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 7' as its os" do
    expect(@useragent.os).to eq("Windows 7")
  end
end

describe 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20141001 PaleMoon/25.0.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20141001 PaleMoon/25.0.0')
  end

  it_should_behave_like "PaleMoon browser"

  it "should return '25.0.0' as its version" do
    expect(@useragent.version).to eq("25.0.0")
  end

  it "should return '20141001' as its gecko version" do
    expect(@useragent.gecko.version).to eq("20141001")
  end

  it "should return '24.7' as its firefox version" do
    expect { @useragent.firefox }.to raise_error(NoMethodError)
  end
end