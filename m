Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLpyA-0008KM-W1
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2019 10:12:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLpy7-0008I0-0F
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:12:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLpy3-0003xm-3l
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:12:18 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44539)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLpy2-0003x8-Jl
	for qemu-trivial@nongnu.org; Wed, 01 May 2019 10:12:15 -0400
Received: by mail-pl1-x62e.google.com with SMTP id l2so5481532plt.11
	for <qemu-trivial@nongnu.org>; Wed, 01 May 2019 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4kQDhN4NfcJBF1zjhcmoNb8ChmBiTpVGRwYChVDGMjI=;
	b=srM7ZBe8Zw0DfinvlSvYIhB4E7D1RwepaUfUtAsRpLBecIh65i1Hsb2qMIQzBLAdHh
	Yv8HfMJoGIiCXK+6HGLQs/fjmR55Zjf96kPytC7tO0OYCuF3m+RYwyKWX1pOPRK8yeHg
	ZYoZSuaDSEr/WN+6E1q0d7ZgO01fLjIWo63MT3Q7wyzR2wP5fLpIHXgNKZczRDqdPOav
	zwR42Ayj0qOcSsSX5y6j0DIlBpogO881CoeOKKa/qkdVPVkFAr0DjaavWKIzkhAbI2ks
	jue9ujCXAw/kfHrHE1EoKcavktWabqGuM9HPhKfVT5QR99MIgTenatc0o31Wce/r15R/
	buxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4kQDhN4NfcJBF1zjhcmoNb8ChmBiTpVGRwYChVDGMjI=;
	b=EsYWci/989A898myIijNvmQs+JM7k3kyFVKp0B7IwuZijLa24lJJ6oso4I6+OplUl/
	ubeA9Ev8Xl1tzHEmgr2bTWRLEWkfshKcJIXplb0TjXcrNtdYEATlbrwddA27DYFK1jcS
	De2uOyY3+gu387Y1uiSi/WR/s1MRcsWyyWnlTFT0yrF9xoKiW5WOzQUF+efSueBvTCdw
	Jamj4RoBVDVj8JW8pL9G0cx7ft4MHyt2U4s2d4/8Gxk3mZuMJm5d13LfjCIRlrw6LY8x
	zC7CfmJTA9gFsxzlHgaFef0v//R0Rx69XqIREY8YM+oaWGrlv4FazWJDJYZKu9Zk1cXD
	JUow==
X-Gm-Message-State: APjAAAU1YrY0eNPI9BsyPHKL7mvwNAYiMkDRZerNB1q4nx2PenXJtRIt
	291rIoQp30ghxz+fp2lnxYHvnw==
X-Google-Smtp-Source: APXvYqyZzZZIH4hhL8sXByYEejO6rlQMe98XGUZrIsnQu71RB1XTNt2IaqtPZmBRvLi+0jtzvftHng==
X-Received: by 2002:a17:902:28e9:: with SMTP id
	f96mr5708519plb.37.1556719933212; 
	Wed, 01 May 2019 07:12:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	e6sm41948353pfe.158.2019.05.01.07.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 07:12:12 -0700 (PDT)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<ff51c73e3095fa503d14aafece54f8565fe99900.1556666645.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0d585793-20a8-8dc8-98fa-13789113f672@linaro.org>
Date: Wed, 1 May 2019 07:12:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff51c73e3095fa503d14aafece54f8565fe99900.1556666645.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/5] hw/usb/hcd-xhci: Fix
 GCC 9 build warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 14:12:22 -0000

On 4/30/19 4:28 PM, Alistair Francis wrote:
>      for (i = 0; i < usbports; i++) {
> +        g_assert(i < MAX(MAXPORTS_2, MAXPORTS_3));

I would hope that it works to move this out of the loop:

  g_assert(usbports <= MAX(MAXPORTS_2, MAXPORTS_3));


r~

