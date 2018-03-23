require "spec_helper"
require "user_agent"

shared_examples_for "Chrome browser" do
  it "returns 'Chrome' as its browser" do
    expect(useragent.browser).to eq("Chrome")
  end
end

# http://www.useragentstring.com/Chrome30.0.1599.17_id_19721.php
describe UserAgent do
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36") }

    it_behaves_like "Chrome browser"

    it "returns '30.0.1599.17' as its version" do
      expect(useragent.version).to eq("30.0.1599.17")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 8' as its os" do
      expect(useragent.os).to eq("Windows 8")
    end
  end

  # http://www.useragentstring.com/Chrome29.0.1547.62_id_19709.php
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36") }

    it_behaves_like "Chrome browser"

    it "returns '29.0.1547.62' as its version" do
      expect(useragent.version).to eq("29.0.1547.62")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36") }

    it_behaves_like "Chrome browser"

    it "returns '29.0.1547.57' as its version" do
      expect(useragent.version).to eq("29.0.1547.57")
    end

    it "returns 'X11' as its platform" do
      expect(useragent.platform).to eq("X11")
    end

    it "returns 'Linux x86_64' as its os" do
      expect(useragent.os).to eq("Linux x86_64")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25") }

    it_behaves_like "Chrome browser"

    it "returns '536.26' as its build" do
      expect(useragent.build).to eq("536.26")
    end

    it "returns '28.0.1500.16' as its version" do
      expect(useragent.version).to eq("28.0.1500.16")
    end

    it "returns '536.26' as its webkit version" do
      expect(useragent.webkit.version).to eq("536.26")
    end

    it "returns 'iPhone' as its platform" do
      expect(useragent.platform).to eq("iPhone")
    end

    it "returns 'iOS 6.1.3' as its os" do
      expect(useragent.os).to eq("iOS 6.1.3")
    end

    it { expect(useragent).to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.40 Safari/537.17") }

    it "returns 'Macintosh' as its platform" do
      expect(useragent.platform).to eq("Macintosh")
    end

    it "returns 'OS X 10.8.2' as its os" do
      expect(useragent.os).to eq("OS X 10.8.2")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19") }

    it_behaves_like "Chrome browser"

    it "returns '535.19' as its build" do
      expect(useragent.build).to eq("535.19")
    end

    it "returns '18.0.1025.168' as its version" do
      expect(useragent.version).to eq("18.0.1025.168")
    end

    it "returns '535.19' as its webkit version" do
      expect(useragent.webkit.version).to eq("535.19")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Linux; Android 4.2; Nexus 7 Build/JOP40C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19") }

    it "returns 'Chrome' as its browser" do
      expect(useragent.browser).to eq("Chrome")
    end

    it "returns 'Android' as its platform" do
      expect(useragent.platform).to eq("Android")
    end

    it "returns 'Android 4.2' as its os" do
      expect(useragent.os).to eq("Android 4.2")
    end

    it { expect(useragent).to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.639.0 Safari/534.16") }

    it_behaves_like "Chrome browser"

    it "returns '534.16' as its build" do
      expect(useragent.build).to eq("534.16")
    end

    it "returns '10.0.639.0' as its version" do
      expect(useragent.version).to eq("10.0.639.0")
    end

    it "returns '534.16' as its webkit version" do
      expect(useragent.webkit.version).to eq("534.16")
    end

    it "returns 'Macintosh' as its platform" do
      expect(useragent.platform).to eq("Macintosh")
    end

    it "returns 'OS X 10.6.5' as its os" do
      expect(useragent.os).to eq("OS X 10.6.5")
    end

    it "returns 'en-US' as its localization" do
      expect(useragent.localization).to eq("en-US")
    end

    it "is greater than Chrome 8.0" do
      other = described_class.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
      expect(useragent).to be > other
    end

    it "is not less than Chrome 8.0" do
      other = described_class.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
      expect(useragent).not_to be < other
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10") }

    it_behaves_like "Chrome browser"

    it "returns '534.10' as its build" do
      expect(useragent.build).to eq("534.10")
    end

    it "returns '8.0.552.231' as its version" do
      expect(useragent.version).to eq("8.0.552.231")
    end

    it "returns '534.10' as its webkit version" do
      expect(useragent.webkit.version).to eq("534.10")
    end

    it "returns 'Macintosh' as its platform" do
      expect(useragent.platform).to eq("Macintosh")
    end

    it "returns 'OS X 10.6.5' as its os" do
      expect(useragent.os).to eq("OS X 10.6.5")
    end

    it "returns 'en-US' as its localization" do
      expect(useragent.localization).to eq("en-US")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 AppleWebKit/534.10 Chrome/8.0.552.215 Safari/534.10") }

    it_behaves_like "Chrome browser"

    it "returns '534.10' as its build" do
      expect(useragent.build).to eq("534.10")
    end

    it "returns '8.0.552.215' as its version" do
      expect(useragent.version).to eq("8.0.552.215")
    end

    it "returns '534.10' as its webkit version" do
      expect(useragent.webkit.version).to eq("534.10")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to be_nil
    end

    it "returns nil as its os" do
      expect(useragent.os).to be_nil
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0") }

    it_behaves_like "Chrome browser"

    it "returns '533.2' as its build" do
      expect(useragent.build).to eq("533.2")
    end

    it "returns '6.0' as its version" do
      expect(useragent.version).to eq("6.0")
    end

    it "returns '533.2' as its webkit version" do
      expect(useragent.webkit.version).to eq("533.2")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it "returns 'en-US' as its localization" do
      expect(useragent.localization).to eq("en-US")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13") }

    it_behaves_like "Chrome browser"

    it "returns '525.13' as its build" do
      expect(useragent.build).to eq("525.13")
    end

    it "returns '0.0.2' as its version" do
      expect(useragent.version).to eq("0.0.2")
    end

    it "returns '525.13' as its webkit version" do
      expect(useragent.webkit.version).to eq("525.13")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows XP' as its os" do
      expect(useragent.os).to eq("Windows XP")
    end

    it "returns 'en-US' as its localization" do
      expect(useragent.localization).to eq("en-US")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36") }

    it_behaves_like "Chrome browser"

    it "returns '537.36' as its build" do
      expect(useragent.build).to eq("537.36")
    end

    it "returns '29.0.1547.62' as its version" do
      expect(useragent.version).to eq("29.0.1547.62")
    end

    it "returns '537.36' as its webkit version" do
      expect(useragent.webkit.version).to eq("537.36")
    end

    it "returns 'X11' as its platform" do
      expect(useragent.platform).to eq("X11")
    end

    it "returns 'Linux x86_64' as its os" do
      expect(useragent.os).to eq("Linux x86_64")
    end
  end
end
