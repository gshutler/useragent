require "spec_helper"
require "user_agent"

describe UserAgent do
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)") }

    it { expect(useragent).to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)") }

    it { expect(useragent).to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Twitterbot/1.0") }

    it { expect(useragent).to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B411 Safari/600.1.4 (compatible; YandexMobileBot/3.0; +http://yandex.com/bots)") }

    it { expect(useragent).to be_bot }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)") }

    it { expect(useragent).to be_bot }
  end
end
