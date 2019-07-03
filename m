Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hih9x-0001iR-JC
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2019 11:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hih9t-0001f8-34
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hih9s-0007zf-00
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:26:57 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:40365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hih9r-0007zO-Rc
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 11:26:55 -0400
Received: by mail-ot1-x331.google.com with SMTP id e8so2756444otl.7
 for <qemu-trivial@nongnu.org>; Wed, 03 Jul 2019 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wa2nr3pOM9YKTME2p6Fzl53abg1fxXpLRiMqueo6uI8=;
 b=WQskWGM6+0qAozo1azCIT9M2IsdelXHiT42wo8lHJ5L6SXr7qgTaZL3AxPR1MMYdII
 MtbqhTb1teDO3rD9S2bujgCOLZNvN68epszZXnpZYsW9XoWf7K8ZgP8odmHfVM1+4tnI
 xp/haFerp0BOI+dSo2L0q8TXNLCTp/TB6DMoRr9A+GUEY24u/VYLPWpG8kGj0zWcgwEv
 RDKUdzLj56VWpyY3R6/AVrHl9oD2H+eyc2W6SZxFgVrsoqOehf28F8WAX8USq3vStOOM
 wfXjfV1cTQBBg0MQP1phnOyfBvjV27XfZ3z97lmUCBcbZiyDa9tBEa/LKXYlgdH4WAZz
 hyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wa2nr3pOM9YKTME2p6Fzl53abg1fxXpLRiMqueo6uI8=;
 b=ZwBt/qR2DhIu4haOKBNbcFhjvL9Wxysia9mH1wEMYTOkkS16jQG81WI6J6J2VF2OlK
 KVMoehABcOABdov3wHGK9/9rZzyNm5sucuqVDKdeU80eYeNTH+rWs7hY0zyd7evw/4Zx
 +bJ/eanyQEsdlFoelM9g1rvC6DBRn3SudESrDgrSQs7ECZ0OAIe1OiTWjfsC1Dh1qzs6
 jaFNxuemNTnHl5T+0EUq/G35mwGPtx3UdklyGQKD5u8lAV333n49FC9ulXNYT+3vjXf5
 WacsoUZLaWuaGgQoFo+8s+/qvHjyn5cX7rcn/rt2Edbh8JTTeEZVK9yqJVvwx0MpInak
 2rUQ==
X-Gm-Message-State: APjAAAVY8oQ1qVaaMjssURYKx4S9eMM3CvgA/MPdLb/BZbxAydJSi/6Z
 JndjKliJHf0lDfqL3wmobUH3HpZhRfC7A4jv0vYLjA==
X-Google-Smtp-Source: APXvYqwmPugBG1HtIX84qwVCR7XgbML7sbDxo2sSjRnkwTm2yUdF9shsc3/B5ti+HrRGwt/HHNyg/lz6+0vhqAV0CF8=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr28002523otj.97.1562167614519; 
 Wed, 03 Jul 2019 08:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123713.14396-1-laurent@vivier.eu>
 <CAFEAcA_Zu0X1zLfKtBkQdi25KCkjf_PNu8zKWE5Dx7uzzLEzBA@mail.gmail.com>
 <5d7fa8ef-c56c-1f90-d5d6-b230d1e3f363@vivier.eu>
In-Reply-To: <5d7fa8ef-c56c-1f90-d5d6-b230d1e3f363@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jul 2019 16:26:43 +0100
Message-ID: <CAFEAcA_5y6HcTXWeyGHuLx_=ROiMBttQw7enW3HGgxuWPYb_kQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Justin Hibbits <chmeeedalf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/3] Trivial branch patches
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
X-List-Received-Date: Wed, 03 Jul 2019 15:26:58 -0000

On Wed, 3 Jul 2019 at 16:22, Laurent Vivier <laurent@vivier.eu> wrote:
> Is there a HOWTO explaining how to build QEMU on MacOS X?

https://wiki.qemu.org/Hosts/Mac though I think it's a little out of
date now. The short answer is "osx 10.12 or better, use homebrew
to install QEMU's dependencies, then just configure and make
the same as for a Linux host".

thanks
-- PMM

