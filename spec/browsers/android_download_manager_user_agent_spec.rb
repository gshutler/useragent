require 'user_agent'

shared_examples_for 'AndroidDownloadManager' do |version, os|
  it "returns 'Android Download Manager' as its browser" do
    expect(useragent.browser).to eq('Android Download Manager')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: AndroidDownloadManager/10 (Linux; U; Android 10; HMA-AL00 Build/HUAWEIHMA-AL00)" do
  let(:useragent) { UserAgent.parse("AndroidDownloadManager/10 (Linux; U; Android 10; HMA-AL00 Build/HUAWEIHMA-AL00)") }

  it_behaves_like 'AndroidDownloadManager', '10', 'Android 10'
end

describe "UserAgent: AndroidDownloadManager" do
  let(:useragent) { UserAgent.parse("AndroidDownloadManager") }

  it_behaves_like 'AndroidDownloadManager', nil, nil
end
