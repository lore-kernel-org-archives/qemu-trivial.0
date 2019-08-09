Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvxhS-00045f-BP
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2019 01:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxhP-00041J-GF
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxhO-00027w-GW
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:44:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvxhO-00026p-7w
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:44:22 -0400
Received: by mail-pf1-x441.google.com with SMTP id w26so149864pfq.12
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2019 22:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2KnyOgkdlrynBJnS9yh0lUNDzVzf3aLmEm/puFZtaQ=;
 b=AdF5SebJIvdwYg2FDpvZ4oZrTEeTTASafLP4XVfQDFPw8QcMmG6dBEk7meMX00gjEn
 Lw+M6dX3Ge9iZme9wtWxjPizDgrgLaT2nxPX5xficdqLL7EG+xsHGjaHBkMsVsXfAkKa
 +fLFF/edHokPKNVlNa3s52k7JbERRicg5uDt2v0mX5/Hkd1F7Y1XfJ9FfxMur7YElyZz
 8LNLSYa1Hytpl5p5cXEOfs8eSElK7peo3EHfm79+zQhxw2kwqDLkymVtEARBTKME1SgQ
 Y1g1AU7Fw8rUbKC7owXnhVSMD1rnCqj1NwoykLeUSdp8iUX7zCaiOOqEqC8dOQ+vkLKd
 ipdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2KnyOgkdlrynBJnS9yh0lUNDzVzf3aLmEm/puFZtaQ=;
 b=f/F5Z9AGXgXlPykf9YBsmO4TsL9Zn52Sy3aqoMKHE+w2JlFVgu8mnIDqWHzaRYPFxq
 eFZ4D7zsa2yqBv2df7ki6tFLJ1bVlnaZ8UvwLpIAMMf3QJuPfZdjsjrmxknUtZ9CAW1M
 bPSbpBIQT24XnXSIY+3VRo4nyEmlFgK7w7pRMPojuDTF6Up6fEjvjn+h/MMWJ6YThIjC
 O6L2/YY8/RmCyOJE/rXLvUz/+8Xd8TcEDD/xVGpmRJSfgV2qCsc4W4LW67d88pfAqleh
 5BXLkPHMgqii9kHcyp2cAE09vfmqv1n5EfoBsBknatScADa7EW7Fv6pSLeidMsBty7z+
 b7rw==
X-Gm-Message-State: APjAAAUZwCq46q9inJNdTjaDxjf2FFpQyAKErcukQSWjErA0VT/24Rjn
 3/k1H3klk7/rIoAknWtHrVi9PMkZFhE=
X-Google-Smtp-Source: APXvYqyHkXv053hrifpT4DbOTL+3d+aGIlR7DZKAlOh4DGHSrsXcdV/RzOTjqvu+907xlkgqo3gjJw==
X-Received: by 2002:a17:90a:6097:: with SMTP id
 z23mr7725483pji.75.1565329460666; 
 Thu, 08 Aug 2019 22:44:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x128sm143294313pfd.17.2019.08.08.22.44.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 22:44:19 -0700 (PDT)
To: Rebecca Cran <rebecca@bsdio.com>, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
References: <20190809042909.74988-1-rebecca@bsdio.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6330eca7-6808-d1bc-09f8-2fd3c87551e0@linaro.org>
Date: Thu, 8 Aug 2019 22:44:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809042909.74988-1-rebecca@bsdio.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Update the avx2
 configure test to be compatible with clang
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2019 05:44:24 -0000

On 8/8/19 9:29 PM, Rebecca Cran wrote:
> clang doesn't support the GCC pragma to enable AVX2, but instead
> requires the command line option -mavx2. Since GCC also supports that,
> remove the pragma lines and add the -mavx2 option when building the
> test. If AVX2 is supported, update QEMU_CFLAGS to include -mavx2 .
> 
> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> ---
>  configure | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

No, this has the same problem as v1.


r~

