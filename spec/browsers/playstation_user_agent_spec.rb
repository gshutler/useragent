require 'user_agent'

shared_examples 'PlayStation 3' do
  it "returns 'PlayStation 3' as its platform" do
    expect(@useragent.platform).to eq('PlayStation 3')
  end

  it "returns 'PS3 Internet Browser' as its browser" do
    expect(@useragent.browser).to eq('PS3 Internet Browser')
  end

  it 'returns false for mobile?' do
    expect(@useragent.mobile?).to be false
  end
end

describe "UserAgent: Mozilla/5.0 (PLAYSTATION 3 4.75) AppleWebKit/531.22.8 (KHTML, like Gecko)" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (PLAYSTATION 3 4.75) AppleWebKit/531.22.8 (KHTML, like Gecko)")
  end

  it_behaves_like 'PlayStation 3'

  it "returns 'PLAYSTATION 3 4.75' as its operating system" do
    expect(@useragent.os).to eq('PLAYSTATION 3 4.75')
  end

  it "returns 4.75 as its version" do
    expect(@useragent.version.to_a).to eq([4, 75])
  end
end

describe "UserAgent: Mozilla/5.0 (PLAYSTATION 3; 1.00)" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (PLAYSTATION 3; 1.00)")
  end

  it_behaves_like 'PlayStation 3'

  it "returns 'PLAYSTATION 3 1.00' as its operating system" do
    expect(@useragent.os).to eq('PLAYSTATION 3 1.00')
  end

  it "returns 1.0 as its version" do
    expect(@useragent.version.to_a).to eq([1, 0])
  end
end

describe "UserAgent: Mozilla/5.0 (PlayStation Vita 3.52) AppleWebKit/537.73 (KHTML, like Gecko) Silk/3.2" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (PlayStation Vita 3.52) AppleWebKit/537.73 (KHTML, like Gecko) Silk/3.2")
  end

  it "returns 'Silk' as its browser" do
    expect(@useragent.browser).to eq('Silk')
  end

  it "returns 'PlayStation Vita' as its platform" do
    expect(@useragent.platform).to eq('PlayStation Vita')
  end

  it "returns 'PlayStation Vita 3.52' as its operating system" do
    expect(@useragent.os).to eq('PlayStation Vita 3.52')
  end

  it "returns 3.2 as its version" do
    expect(@useragent.version.to_a).to eq([3, 2])
  end

  it 'returns true for mobile?' do
    expect(@useragent.mobile?).to be true
  end
end

describe "UserAgent: Mozilla/5.0 (PlayStation 4 2.57) AppleWebKit/537.73 (KHTML, like Gecko)" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (PlayStation 4 2.57) AppleWebKit/537.73 (KHTML, like Gecko)")
  end

  it "returns 'PS4 Internet Browser' as its browser" do
    expect(@useragent.browser).to eq('PS4 Internet Browser')
  end

  it "returns 'PlayStation 4' as its platform" do
    expect(@useragent.platform).to eq('PlayStation 4')
  end

  it "returns 'PlayStation 4 2.57' as its operating system" do
    expect(@useragent.os).to eq('PlayStation 4 2.57')
  end

  it "returns 2.57 as its version" do
    expect(@useragent.version.to_a).to eq([2, 57])
  end

  it 'returns false for mobile?' do
    expect(@useragent.mobile?).to be false
  end
end