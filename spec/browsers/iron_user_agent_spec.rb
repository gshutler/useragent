require "spec_helper"
require "user_agent"

shared_examples_for "Iron browser" do
  it "returns 'Iron' as its browser" do
    expect(useragent.browser).to eq("Iron")
  end

  it "returns a Version object for version" do
    expect(useragent.version).to be_a(UserAgent::Version)
  end
end

describe UserAgent do
  # http://www.useragentstring.com/Iron22.0.2150.0_id_19368.php
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1250.0 Iron/22.0.2150.0 Safari/537.4") }

    it_behaves_like "Iron browser"

    it "returns '22.0.1250.0' as its version" do
      expect(useragent.version).to eq("22.0.1250.0")
    end

    it "returns 'Windows' as its platform" do
      expect(useragent.platform).to eq("Windows")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end
  end

  # http://www.useragentstring.com/Iron21.0.1200.0_id_19375.php
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (X11; U; Linux amd64) Iron/21.0.1200.0 Chrome/21.0.1200.0 Safari/537.1") }

    it_behaves_like "Iron browser"

    it "returns '21.0.1200.0' as its version" do
      expect(useragent.version).to eq("21.0.1200.0")
    end

    it "returns 'X11' as its platform" do
      expect(useragent.platform).to eq("X11")
    end

    it "returns 'Linux amd' as its os" do
      expect(useragent.os).to eq("Linux amd64")
    end
  end
end
