require "spec_helper"
require "user_agent"

shared_examples "libavformat" do
  it "returns 'libavformat' as its browser" do
    expect(useragent.browser).to eq("libavformat")
  end

  it "returns nil as its OS" do
    expect(useragent.os).to be_nil
  end

  it "returns nil as its platform" do
    expect(useragent.platform).to be_nil
  end
end

shared_examples "libavformat has version number" do |version|
  it "should return '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end
end

describe UserAgent do
  context do
    let(:useragent) { described_class.parse("Lavf/56.4.101") }

    it_behaves_like "libavformat"
    it_behaves_like "libavformat has version number", "56.4.101"
  end

  context do
    let(:useragent) { described_class.parse("NSPlayer/4.1.0.3856") }

    it_behaves_like "libavformat"
    it_behaves_like "libavformat has version number", nil
  end
end
