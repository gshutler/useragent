# frozen_string_literal: true

require 'user_agent'

shared_examples 'Amazon Echo' do |version|
  it "returns 'Amazon Echo' as its browser" do
    expect(useragent.browser).to eq('Amazon Echo')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it { expect(useragent).to be_speaker }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_bot }
end

describe 'UserAgent: Echo/1.0(APNG)' do
  let(:useragent) { UserAgent.parse('Echo/1.0(APNG)') }

  it_behaves_like 'Amazon Echo', '1.0'
end

describe 'UserAgent: Echo/1.0(MRM)' do
  let(:useragent) { UserAgent.parse('Echo/1.0(MRM)') }

  it_behaves_like 'Amazon Echo', '1.0'
end
