Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvxLv-0005zl-IO
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2019 01:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxLt-0005zU-GC
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvxLs-0000Lf-Ks
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:22:09 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36268)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvxLs-0000L2-Am
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 01:22:08 -0400
Received: by mail-pg1-x544.google.com with SMTP id l21so45255718pgm.3
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2019 22:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GFQf6fdXY7+fyX4kjByQA9BGer8bsmegQl2PDNmFEa8=;
 b=lxMyPPaNvSlC517wHZLEpXfkYJI3oYZE3vOUN726nsCOcScQrjRm16lXlm8lZvKg6A
 Jebz1pID2sLsnqDQKsUH0Zb5lTihPNZUZTqdAp2X4bTiiHQ2ogMDYAJmjr+EbZzQMvlq
 /vDPSQF03RTFxAVhJBRlAuXMRIkHgTjJv/vhvCZzUq4A3Zm9o1fa5aiHWoBHe//iV5FG
 +H3rccc8gYc2yl0lMnPuyjS5wU9+WxgqD6L6njoKt6gSUnTyDpk4nMHh7VDniKinAyGp
 GGo05TCy6SxDDL+bVQOtNNJ2qm3SpI5Rc/Khnm84Fxc33dQj/URdq46j9Eg43Sj7KT5P
 vdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GFQf6fdXY7+fyX4kjByQA9BGer8bsmegQl2PDNmFEa8=;
 b=WKKH118+YUk0LkHHIYn5G4D4ebe5HKXdqeaEJ4EajO4nrfJUacXNHN88aP1OI2mSlQ
 r28jfg5wOuXBs5M5jECxl/V4eluzRCnWcYvUvGNMf2u+KedJSh6n7s3sEyMoBWjd3yZR
 uCQTXU4fTcgLl80wyhqD+HLcfYT3aY+6mNDvGmOLFwP9mHAgF3azk8AW4vbh+U34H7LE
 CcCrotOe9vuROy5pbA1zUTvECIGIAuwjisaRaQOduZHN92Y1cEHaOL3kMpvQVq00O0Vj
 UQsZxhMtdVbO7Sq93OvKjZM0Ecb3WTi1yfCMkzZ3QpiN57cG227meAiyzbBpmM5fchga
 Zmzw==
X-Gm-Message-State: APjAAAV/DGhmJ8SkPSidTGxTOW9KBSO8zPFdFDLvFL/q4aOzQH3XkSYb
 QiQbRX1lT5r8AFq0EvUBWfUsAD7JtPQ=
X-Google-Smtp-Source: APXvYqx7B1/MLRUjD3/SpODUmBII9i2WrCON3ThKkuoOTgbPGI7oW5VDSLBIdf3lQVxjD9B/+M7+vQ==
X-Received: by 2002:a65:690e:: with SMTP id s14mr16216648pgq.47.1565328126625; 
 Thu, 08 Aug 2019 22:22:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a16sm105168363pfd.68.2019.08.08.22.22.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 22:22:05 -0700 (PDT)
To: Rebecca Cran <rebecca@bsdio.com>, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
References: <20190809041952.57302-1-rebecca@bsdio.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <57083e0b-2853-7f5b-16ec-83bc22f237fa@linaro.org>
Date: Thu, 8 Aug 2019 22:22:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809041952.57302-1-rebecca@bsdio.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update the avx2 configure
 test to be compatible with clang
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
X-List-Received-Date: Fri, 09 Aug 2019 05:22:10 -0000

On 8/8/19 9:19 PM, Rebecca Cran wrote:
> clang doesn't support the GCC pragma to enable AVX2, but instead
> requires the command line option -mavx2. Since GCC also supports that,
> remove the pragma lines and add the -mavx2 option when building the
> test.

No, this means we're not testing what we need:

We need to compile exactly one function using avx2.

The other functions should be compiled with sse4 and sse2, respectively, and we
choose between them by testing cpuid bits at startup.  If you supply -mavx2 to
the entire compilation, then the routine that is supposed to use only sse2 will
in fact use avx2, and then the runtime selection is moot.


r~

