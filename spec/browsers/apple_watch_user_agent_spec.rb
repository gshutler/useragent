# frozen_string_literal: true

require 'user_agent'

shared_examples 'Apple Watch' do
  it "returns 'Apple Watch' as its browser" do
    expect(useragent.browser).to eq('Apple Watch')
  end

  it "returns 'WatchOS' as its operating system" do
    expect(useragent.os).to eq('WatchOS')
  end

  it "returns 'Apple Watch' as its platform" do
    expect(useragent.platform).to eq('Apple Watch')
  end
end

{
  '(null)/(null) watchOS/5.0 model/Watch2 ,7 hwp/t8002 build/16R349 (6; dt:149)' => '5.0',
  '(null)/(null) watchOS/5.1.1 model/Watch4 ,3 hwp/t8006 build/16S21 (6; dt:192)' => '5.1.1',
  '(null)/(null) watchOS/5.2 model/Watch3 ,2 hwp/t8004 build/16T124 (6; dt:154)' => '5.2',
  '(null)/(null) watchOS/6.0 model/Watch4 ,4 hwp/t8006 build/17R349 (6; dt:193)' => '6.0'
}.each do |ua, version|
  context "with UserAgent: #{ua}" do
    let!(:useragent) { UserAgent.parse(ua) }

    it_behaves_like 'Apple Watch'
    it { expect(useragent.version).to eq(version) }
  end
end
