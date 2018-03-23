require "spec_helper"
require "user_agent"

shared_examples_for "Vivaldi browser" do
  it "returns 'Vivaldi' as its browser" do
    expect(useragent.browser).to eq("Vivaldi")
  end
end

describe UserAgent do
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43") }

    it_behaves_like "Vivaldi browser"

    it "returns '1.2.490.43' as its version" do
      expect(useragent.version).to eq("1.2.490.43")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it "returns '537.36' as its build" do
      expect(useragent.build).to eq("537.36")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36 Vivaldi/1.2.490.43") }

    it_behaves_like "Vivaldi browser"

    it "returns '1.2.490.43' as its version" do
      expect(useragent.version).to eq("1.2.490.43")
    end

    it "returns 'X11' as its platform" do
      expect(useragent.platform).to eq("X11")
    end

    it "returns 'Linux x86_64' as its os" do
      expect(useragent.os).to eq("Linux x86_64")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Linux; Android 6.0.1; SM-G920F Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.148 Mobile Safari/537.36 Vivaldi/1.4.589.38") }

    it_behaves_like "Vivaldi browser"

    it "returns 'Android 6.0.1' as its os" do
      expect(useragent.os).to eq("Android 6.0.1")
    end

    it "returns 'Android' as its platform" do
      expect(useragent.platform).to eq("Android")
    end
  end
end
