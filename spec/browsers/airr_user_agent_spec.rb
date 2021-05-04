require 'user_agent'

shared_examples 'Airr' do |version, os|
  it "returns 'Airr' as its browser" do
    expect(useragent.browser).to eq('Airr')
  end

  it 'returns mobile true' do
    expect(useragent.mobile?).to be true
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'iPhone' as its platform" do
    expect(useragent.platform).to eq('iPhone')
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end
end

describe "UserAgent: Airr/3916 CFNetwork/1202 Darwin/20.1.0" do
  let!(:useragent) { UserAgent.parse("Airr/3916 CFNetwork/1202 Darwin/20.1.0") }

  it_behaves_like 'Airr', '3916', 'iOS 14.2.x'
end

describe "UserAgent: Airr/3186 CFNetwork/1128.0.1 Darwin/19.6.0" do
  let!(:useragent) { UserAgent.parse("Airr/3186 CFNetwork/1128.0.1 Darwin/19.6.0") }

  it_behaves_like 'Airr', '3186', 'iOS 13.6.x'
end

