require 'user_agent'

shared_examples 'BlackBerry' do |version|
  it "returns 'BlackBerry' as its browser" do
    expect(useragent.browser).to eq('BlackBerry')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'BlackBerry' as its platform" do
    expect(useragent.platform).to eq('BlackBerry')
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: BlackBerry8520/5.0.0.681 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/600" do
  let(:useragent) { UserAgent.parse("BlackBerry8520/5.0.0.681 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/600") }

  it_behaves_like 'BlackBerry', '5.0.0.681'
end

describe "UserAgent: BlackBerry9630/5.0.0.975 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/105" do
  let(:useragent) { UserAgent.parse("BlackBerry9630/5.0.0.975 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/105") }

  it_behaves_like 'BlackBerry', '5.0.0.975'
end

describe "UserAgent: BlackBerry9550/4.2.0.442 Profile/MIDP-2.0 Configuration/CLDC-1.1/UC Browser7.8.0.95/161/352" do
  let(:useragent) { UserAgent.parse("BlackBerry9550/4.2.0.442 Profile/MIDP-2.0 Configuration/CLDC-1.1/UC Browser7.8.0.95/161/352") }

  it_behaves_like 'BlackBerry', '4.2.0.442'
end
