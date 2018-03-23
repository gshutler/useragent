require "spec_helper"
require "user_agent"

shared_examples_for "Opera browser" do
  it "returns 'Opera' as its browser" do
    expect(useragent.browser).to eq("Opera")
  end

  it "returns a Version object for version" do
    expect(useragent.version).to be_a(UserAgent::Version)
  end
end

describe UserAgent do
  # http://www.useragentstring.com/Opera12.14_id_19612.php
  context do
    let(:useragent) { described_class.parse("Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14") }

    it_behaves_like "Opera browser"

    it "returns '12.14' as its version" do
      expect(useragent.version).to eq("12.14")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows Vista' as its os" do
      expect(useragent.os).to eq("Windows Vista")
    end

    it "returns nil as its security" do
      expect(useragent.security).to eq(nil)
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.27 (Macintosh; Intel Mac OS X; U; en)") }

    it_behaves_like "Opera browser"

    it "returns '9.27' as its version" do
      expect(useragent.version).to eq("9.27")
    end

    it "returns 'Macintosh' as its platform" do
      expect(useragent.platform).to eq("Macintosh")
    end

    it "returns 'Intel Mac OS X' as its os" do
      expect(useragent.os).to eq("Intel Mac OS X")
    end

    it "returns 'en' as its localization" do
      expect(useragent.localization).to eq("en")
    end

    it "returns strong as its security" do
      expect(useragent.security).to eq(:strong)
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.27 (Windows NT 5.1; U; en)") }

    it_behaves_like "Opera browser"

    it "returns '9.27' as its version" do
      expect(useragent.version).to eq("9.27")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows XP' as its os" do
      expect(useragent.os).to eq("Windows XP")
    end

    it "returns 'en' as its localization" do
      expect(useragent.localization).to eq("en")
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80") }

    it_behaves_like "Opera browser"

    it "returns '9.80' as its version" do
      expect(useragent.version).to eq("9.80")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to be_nil
    end

    it "returns nil as its os" do
      expect(useragent.os).to be_nil
    end

    it "returns nil as its localization" do
      expect(useragent.localization).to be_nil
    end

    it "returns strong as its security" do
      expect(useragent.security).to eq(:strong)
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.2.15 Version/10.10") }

    it_behaves_like "Opera browser"

    it "returns '10.10' as its version" do
      expect(useragent.version).to eq("10.10")
    end

    it "returns 'Macintosh' as its platform" do
      expect(useragent.platform).to eq("Macintosh")
    end

    it "returns 'Intel Mac OS X' as its os" do
      expect(useragent.os).to eq("Intel Mac OS X")
    end

    it "returns 'en' as its localization" do
      expect(useragent.localization).to eq("en")
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80 (Windows NT 6.0; U; en) Presto/2.2.15 Version/10.10") }

    it_behaves_like "Opera browser"

    it "returns '10.10' as its version" do
      expect(useragent.version).to eq("10.10")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows Vista' as its os" do
      expect(useragent.os).to eq("Windows Vista")
    end

    it "returns 'en' as its localization" do
      expect(useragent.localization).to eq("en")
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80 (J2ME/MIDP; Opera Mini/9 (Compatible; MSIE:9.0; iPhone; BlackBerry9700; AppleWebKit/24.746; U; en) Presto/2.5.25 Version/10.54'") }

    it_behaves_like "Opera browser"

    it { expect(useragent).to be_mobile }

    it "returns strong as its security" do
      expect(useragent.security).to eq(:strong)
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80 (J2ME/MIDP; Opera Mini/9.80 (J2ME/23.377; U; en) Presto/2.5.25 Version/10.54") }

    it_behaves_like "Opera browser"

    it { expect(useragent).to be_mobile }
  end

  # http://www.useragentstring.com/Opera%20Mini9.80_id_17936.php
  context do
    let(:useragent) { described_class.parse("Opera/9.80 (J2ME/MIDP; Opera Mini/9.80 (S60; SymbOS; Opera Mobi/23.348; U; en) Presto/2.5.25 Version/10.54") }

    it_behaves_like "Opera browser"

    it "returns '9.80' as its version" do
      expect(useragent.version).to eq("9.80")
    end
  end

  # http://www.useragentstring.com/Opera%20Mini7.1.32694_id_19147.php
  context do
    let(:useragent) { described_class.parse("Opera/9.80 (iPhone; Opera Mini/7.1.32694/27.1407; U; en) Presto/2.8.119 Version/11.10") }

    it_behaves_like "Opera browser"

    it "returns '7.1.32694' as its version" do
      expect(useragent.version).to eq("7.1.32694")
    end
  end

  context do
    let(:useragent) { described_class.parse("Opera/9.80 (BREW Opera Mini/6.0.3/27.2354 U es) Presto/2.8.119 240X320 Samsung SCH-U485") }

    it_behaves_like "Opera browser"

    it "returns '6.0.3' as its version" do
      expect(useragent.version).to eq("6.0.3")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36 OPR/28.0.1750.48") }

    it_behaves_like "Opera browser"

    it "returns '28.0.1750.48' as it's version" do
      expect(useragent.version).to eq("28.0.1750.48")
    end
  end
end
