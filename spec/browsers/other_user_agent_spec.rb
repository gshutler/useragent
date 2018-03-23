require "spec_helper"
require "user_agent"

describe UserAgent do
  context do
    let(:useragent) { described_class.parse(nil) }

    it "returns 'Mozilla' as its browser" do
      expect(useragent.browser).to eq("Mozilla")
    end

    it "returns '4.0' as its version" do
      expect(useragent.version).to eq("4.0")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to eq(nil)
    end

    it "returns nil as its os" do
      expect(useragent.os).to eq(nil)
    end

    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).not_to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("") }

    it "returns 'Mozilla' as its browser" do
      expect(useragent.browser).to eq("Mozilla")
    end

    it "returns '4.0' as its version" do
      expect(useragent.version).to eq("4.0")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to eq(nil)
    end

    it "returns nil as its os" do
      expect(useragent.os).to eq(nil)
    end

    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).not_to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible)") }

    it "returns 'Mozilla' as its browser" do
      expect(useragent.browser).to eq("Mozilla")
    end

    it "returns '4.0' as its version" do
      expect(useragent.version).to eq("4.0")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to eq(nil)
    end

    it "returns nil as its os" do
      expect(useragent.os).to eq(nil)
    end

    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).not_to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0") }

    it "returns 'Mozilla' as its browser" do
      expect(useragent.browser).to eq("Mozilla")
    end

    it "returns '5.0' as its version" do
      expect(useragent.version).to eq("5.0")
    end

    it "returns nil as its platform" do
      expect(useragent.platform).to eq(nil)
    end

    it "returns nil as its os" do
      expect(useragent.os).to eq(nil)
    end

    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).not_to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("amaya/9.51 libwww/5.4.0") }

    it "returns 'amaya' as its browser" do
      expect(useragent.browser).to eq("amaya")
    end

    it "returns '9.51' as its version" do
      expect(useragent.version).to eq("9.51")
    end

    it "returns '5.4.0' as its libwww version" do
      expect(useragent.libwww.version).to eq("5.4.0")
    end
  end

  context do
    let(:useragent) { described_class.parse("Rails Testing") }

    it "returns 'Rails' as its browser" do
      expect(useragent.browser).to eq("Rails")
    end

    it { expect(useragent.version).to be_nil }
    it { expect(useragent.platform).to be_nil }
    it { expect(useragent.os).to be_nil }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Python-urllib/2.7") }

    it "returns 'Python-urllib' as its browser" do
      expect(useragent.browser).to eq("Python-urllib")
    end

    it "returns '2.7' as its version" do
      expect(useragent.version).to eq("2.7")
    end

    it { expect(useragent.platform).to be_nil }
    it { expect(useragent.os).to be_nil }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("check_http/v1.4.15 (nagios-plugins 1.4.15)") }

    it "returns 'check_http' as its browser" do
      expect(useragent.browser).to eq("check_http")
    end

    it "returns 'v1.4.15' as its version" do
      expect(useragent.version).to eq("v1.4.15")
    end

    it { expect(useragent.platform).to be_nil }
    it { expect(useragent.os).to be_nil }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("/WebTest.pm") }

    it "returns nil as its browser" do
      expect(useragent.browser).to eq(nil)
    end
  end
end
