require "spec_helper"
require "user_agent"

shared_examples_for "Internet Explorer browser" do
  it "returns 'Internet Explorer' as its browser" do
    expect(useragent.browser).to eq("Internet Explorer")
  end

  it "returns 'Windows' as its platform" do
    expect(useragent.platform).to eq("Windows")
  end
end

describe UserAgent do
  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it "has a higher version number than IE10" do
      expect(useragent.version).to be >
                                   described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)").version
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 8.1' as its os" do
      expect(useragent.os).to eq("Windows 8.1")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (IE 11.0; Windows NT 6.3; Trident/7.0; .NET4.0E; .NET4.0C; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 8.1' as its os" do
      expect(useragent.os).to eq("Windows 8.1")
    end

    it "has a higher version number than IE10" do
      expect(useragent.version).to be >
                                   described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)").version
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 8.1' as its os" do
      expect(useragent.os).to eq("Windows 8.1")
    end

    it "has a higher version number than IE10" do
      expect(useragent.version).to be >
                                   described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)").version
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns 'Windows 8.1' as its os" do
      expect(useragent.os).to eq("Windows 8.1")
    end

    it "has a higher version number than IE10" do
      expect(useragent.version).to be >
                                   described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)").version
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (Windows NT 6.1; Trident/8.0; rv:11.0) like Gecko") }

    it_behaves_like "Internet Explorer browser"

    it "returns '11.0' as its version" do
      expect(useragent.version).to eq("11.0")
    end

    it "returns '11.0' as its real version" do
      expect(useragent.real_version).to eq("11.0")
    end

    it { expect(useragent).not_to be_compatibility_view }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '10.0' as its version" do
      expect(useragent.version).to eq("10.0")
    end

    it "returns 'Windows 8' as its os" do
      expect(useragent.os).to eq("Windows 8")
    end

    it "has a higher version number than IE9" do
      expect(useragent.version).to be >
                                   described_class.parse("Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.2; ARM; Trident/6.0; Touch; .NET4.0E; .NET4.0C; Tablet PC 2.0)").version
    end

    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; ARM; Trident/6.0; Touch; .NET4.0E; .NET4.0C; Tablet PC 2.0)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '7.0' as its version" do
      expect(useragent.version).to eq("7.0")
    end

    it "returns 'Windows 8' as its os" do
      expect(useragent.os).to eq("Windows 8")
    end

    it { expect(useragent).to be_compatibility_view }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; ARM; Trident/6.0; Touch)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '10.0' as its version" do
      expect(useragent.version).to eq("10.0")
    end

    it "returns 'Windows 8' as its os" do
      expect(useragent.os).to eq("Windows 8")
    end

    it { expect(useragent).not_to be_compatibility_view }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '9.0' as its version" do
      expect(useragent.version).to eq("9.0")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '9.0' as its version" do
      expect(useragent.version).to eq("9.0")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it { expect(useragent).not_to be_compatibility_view }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '7.0' as its version" do
      expect(useragent.version).to eq("7.0")
    end

    it "returns 'Windows 7' as its os" do
      expect(useragent.os).to eq("Windows 7")
    end

    it { expect(useragent).to be_compatibility_view }
    it { expect(useragent).not_to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '7.0' as its version" do
      expect(useragent.version).to eq("7.0")
    end

    it "returns 'Windows Vista' as its os" do
      expect(useragent.os).to eq("Windows Vista")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '6.0' as its version" do
      expect(useragent.version).to eq("6.0")
    end

    it "returns 'Windows XP' as its os" do
      expect(useragent.os).to eq("Windows XP")
    end

    it "is == 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'" do
      expect(useragent).to eq(useragent)
    end

    it "is not == 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
      expect(useragent).not_to eq(described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)"))
    end

    it "is > 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
      expect(useragent).to be > described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
    end

    it "is not < 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
      expect(useragent).not_to be < described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
    end

    it "is >= 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
      expect(useragent).to be >= described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
    end

    it "is not >= 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'" do
      expect(useragent).not_to be >= described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    end

    it "is <= 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'" do
      expect(useragent).to be <= described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    end

    it "is not <= 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
      expect(useragent).not_to be <= described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '5.5' as its version" do
      expect(useragent.version).to eq("5.5")
    end

    it "returns 'Windows XP' as its os" do
      expect(useragent.os).to eq("Windows XP")
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; SAMSUNG; SGH-i917)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '7.0' as its version" do
      expect(useragent.version).to eq("7.0")
    end

    it "returns 'Windows Phone OS 7.0' as its os" do
      expect(useragent.os).to eq("Windows Phone OS 7.0")
    end

    it { expect(useragent).to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 625; Vodafone)") }

    it_behaves_like "Internet Explorer browser"

    it "returns '10.0' as its version" do
      expect(useragent.version).to eq("10.0")
    end

    it "returns 'Windows Phone 8.0' as its os" do
      expect(useragent.os).to eq("Windows Phone 8.0")
    end

    it { expect(useragent).to be_mobile }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (MSIE 8.0; Windows NT 6.0; Trident/7.0; rv:11.0) like Gecko") }

    it "returns '8.0' as its version" do
      expect(useragent.version).to eq("8.0")
    end

    it "returns '11.0' as its real version" do
      expect(useragent.real_version).to eq("11.0")
    end

    it { expect(useragent).to be_compatibility_view }
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; BOIE9;ENUS))") }

    it "returns '9.0' as its version" do
      expect(useragent.version).to eq("9.0")
    end

    it "returns '11.0' as its real version" do
      expect(useragent.real_version).to eq("11.0")
    end

    it { expect(useragent).to be_compatibility_view }
  end

  # Non-Chrome Frame Browsers
  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)") }

    it_behaves_like "Internet Explorer browser"

    it "does not pose as chromeframe" do
      expect(useragent.chromeframe).to be_nil
    end
  end

  # Chrome Frame install before version 4.0
  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; chromeframe)") }

    it_behaves_like "Internet Explorer browser"

    it "returns true as chromeframe" do
      expect(useragent.chromeframe).to be_truthy
    end

    it "does not have a version" do
      expect(useragent.chromeframe).not_to respond_to(:version)
    end
  end

  context do
    context "when separate product" do
      let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) chromeframe/4.0") }

      it_behaves_like "Internet Explorer browser"

      it "returns true as chromeframe" do
        expect(useragent.chromeframe).to be_truthy
      end

      it "has a version" do
        expect(useragent.chromeframe.version).to eq("4.0")
      end
    end

    context "with versioned comment" do
      let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; chromeframe/4.0)") }

      it_behaves_like "Internet Explorer browser"

      it "returns true as chromeframe" do
        expect(useragent.chromeframe).to be_truthy
      end

      it "has a version" do
        expect(useragent.chromeframe.version).to eq("4.0")
      end
    end
  end

  context do
    let(:useragent) { described_class.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;)") }

    it_behaves_like "Internet Explorer browser"

    it "is not considered to be in compatibility view" do
      expect(useragent).not_to be_compatibility_view
    end
  end
end
