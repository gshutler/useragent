# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Podkicker' do |version|
  it "returns 'Podkicker' as its browser" do
    expect(useragent.browser).to eq('Podkicker')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android' as its os" do
    expect(useragent.os).to eq('Android')
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Podkicker Pro/3.1.19.RC-GP-Pro(2028)" do
  let(:useragent) { UserAgent.parse("Podkicker Pro/3.1.19.RC-GP-Pro(2028)") }

  it_behaves_like 'Podkicker', '3.1.19.RC-GP-Pro(2028)'
end

describe "UserAgent: Podkicker/2.2.10" do
  let(:useragent) { UserAgent.parse("Podkicker/2.2.10") }

  it_behaves_like 'Podkicker', '2.2.10'
end

describe "UserAgent: Podkicker Classic/1.2.9" do
  let(:useragent) { UserAgent.parse("Podkicker Classic/1.2.9") }

  it_behaves_like 'Podkicker', '1.2.9'
end
