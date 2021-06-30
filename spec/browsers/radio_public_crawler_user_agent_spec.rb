# frozen_string_literal: true

require 'user_agent'

shared_examples 'RadioPublicCrawler' do
  it "returns 'RadioPublic' as its browser" do
    expect(useragent.browser).to eq('RadioPublic')
  end

  it { expect(useragent.platform).to be_nil }
  it { expect(useragent.os).to be_nil }

  it { expect(useragent).to be_bot }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_speaker }
end

describe "UserAgent: RadioPublic-Web/e0d2cd1" do
  let(:useragent) { UserAgent.parse("RadioPublic-Web/e0d2cd1") }

  it_behaves_like 'RadioPublicCrawler'
end
