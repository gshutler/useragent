require 'user_agent'

shared_examples 'Pocket Casts' do
  it "returns 'Pocket Casts' as its browser" do
    expect(useragent.browser).to eq('Pocket Casts')
  end
end

describe "UserAgent: Pocket Casts BMID/E678F58F21" do
  let!(:useragent) { UserAgent.parse("Pocket Casts BMID/E678F58F21") }

  it_behaves_like 'Pocket Casts'

  it "should return nil as its version" do
    expect(useragent.version).to be_nil
  end

  it "should return nil as its platform" do
    expect(useragent.platform).to be_nil
  end
end

describe "UserAgent: PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)" do
  let!(:useragent) { UserAgent.parse("PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)") }

  it_behaves_like 'Pocket Casts'

  it "should return '1.0' as its version" do
    expect(useragent.version).to eq('1.0')
  end

  it "should return nil as its platform" do
    expect(useragent.platform).to be_nil
  end
end

describe "UserAgent: Shifty Jelly Pocket Casts, Android v4.5.3" do
  let!(:useragent) { UserAgent.parse("Shifty Jelly Pocket Casts, Android v4.5.3") }

  it_behaves_like 'Pocket Casts'

  it "should return '4.5.3' as its version" do
    expect(useragent.version).to eq('4.5.3')
  end

  it "should return 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end
end

describe "UserAgent: Shifty Jelly Pocket Casts, iOS v4.3" do
  let!(:useragent) { UserAgent.parse("Shifty Jelly Pocket Casts, iOS v4.3") }

  it_behaves_like 'Pocket Casts'

  it "should return '4.3' as its version" do
    expect(useragent.version).to eq('4.3')
  end

  it "should return 'iPhone' as its platform" do
    expect(useragent.platform).to eq('iPhone')
  end
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1") }

  it_behaves_like 'Pocket Casts'

  it "should return '1.1' as its version" do
    expect(useragent.version).to eq('1.1')
  end

  it "should return 'Windows' as its platform" do
    expect(useragent.platform).to eq('Windows')
  end

  it "should return 'Windows 10' as its os" do
    expect(useragent.os).to eq('Windows 10')
  end
end
