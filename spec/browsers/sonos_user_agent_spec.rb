require 'user_agent'

shared_examples 'Sonos' do |version|
  it "returns 'Sonos' as its browser" do
    expect(useragent.browser).to eq('Sonos')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Sonos' as its platform" do
    expect(useragent.platform).to eq('Sonos')
  end

  it { expect(useragent.os).to be_nil }
  it { expect(useragent).to be_speaker }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Linux UPnP/1.0 Sonos/44.2-53100-mainline_integ (ZPS120)" do
  let!(:useragent) { UserAgent.parse("Linux UPnP/1.0 Sonos/44.2-53100-mainline_integ (ZP120)") }

  it_behaves_like 'Sonos', '44.2-53100-mainline_integ'
end

describe "UserAgent: Linux UPnP/1.0 Sonos/44.2-54250 (ZP90)" do
  let!(:useragent) { UserAgent.parse("Linux UPnP/1.0 Sonos/44.2-54250 (ZP90)") }

  it_behaves_like 'Sonos', '44.2-54250'
end

describe "UserAgent: Linux UPnP/1.0 Sonos/48.2-57300-mcs9_dev_integ (ZPS11)" do
  let!(:useragent) { UserAgent.parse("Linux UPnP/1.0 Sonos/48.2-57300-mcs9_dev_integ (ZPS11)") }

  it_behaves_like 'Sonos', '48.2-57300-mcs9_dev_integ'
end

describe "UserAgent: Linux UPnP/1.0 Sonos/65.1-15280-mainline_integ_alt_release (ZPS16)" do
  let!(:useragent) { UserAgent.parse("Linux UPnP/1.0 Sonos/65.1-15280-mainline_integ_alt_release (ZPS16)") }

  it_behaves_like 'Sonos', '65.1-15280-mainline_integ_alt_release'
end
