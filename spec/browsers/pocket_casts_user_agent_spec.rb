require 'user_agent'

shared_examples 'Pocket Casts' do |version, platform, os, desktop|
  it "returns 'Pocket Casts' as its browser" do
    expect(useragent.browser).to eq('Pocket Casts')
  end

  it "should return '#{version}' as its version" do
    expect(useragent.version).to eql(version)
  end

  it "should return '#{platform}' as its platform" do
    expect(useragent.platform).to eql(platform)
  end

  it "should return '#{os}' as its operating system" do
    expect(useragent.os).to eql(os)
  end

  it { expect(useragent.desktop?).to eql(desktop) }
end

describe "UserAgent: Pocket Casts BMID/E678F58F21" do
  let!(:useragent) { UserAgent.parse("Pocket Casts BMID/E678F58F21") }

  it_behaves_like 'Pocket Casts', nil, nil, nil, false
end

describe "UserAgent: PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)" do
  let!(:useragent) { UserAgent.parse("PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)") }

  it_behaves_like 'Pocket Casts', '1.0', nil, nil, false
end

describe "UserAgent: Shifty Jelly Pocket Casts, Android v4.5.3" do
  let!(:useragent) { UserAgent.parse("Shifty Jelly Pocket Casts, Android v4.5.3") }

  it_behaves_like 'Pocket Casts', '4.5.3', 'Android', nil, false
end

describe "UserAgent: Shifty Jelly Pocket Casts, iOS v4.3" do
  let!(:useragent) { UserAgent.parse("Shifty Jelly Pocket Casts, iOS v4.3") }

  it_behaves_like 'Pocket Casts', '4.3', 'iOS', nil, false
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1") }

  it_behaves_like 'Pocket Casts', '1.1', 'Windows', 'Windows 10', true
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcast/2.1.0 Chrome/58.0.3029.110 Molecule/2.1.0 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcast/2.1.0 Chrome/58.0.3029.110 Molecule/2.1.0 Safari/537.36") }

  it_behaves_like 'Pocket Casts', '2.1.0', 'Macintosh', 'OS X 10.14.4', true
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcasts/3.0.11 Chrome/58.0.3029.110 Molecule/3.0.11 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcasts/3.0.11 Chrome/58.0.3029.110 Molecule/3.0.11 Safari/537.36") }

  it_behaves_like 'Pocket Casts', '3.0.11', 'Windows', 'Windows 10', true
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) PocketCasts/1.0.0 Chrome/59.0.3071.115 Electron/1.8.3 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) PocketCasts/1.0.0 Chrome/59.0.3071.115 Electron/1.8.3 Safari/537.36") }

  it_behaves_like 'Pocket Casts', '1.0.0', 'Windows', 'Windows 10', true
end
