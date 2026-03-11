Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F9104C007
	for <qemu-trivial@archiver.kernel.org>; Wed, 11 Mar 2026 10:53:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w0HBg-0004jw-2q; Wed, 11 Mar 2026 06:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0HBL-0004cJ-9k
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2026 06:52:54 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0HBI-0001zE-5S
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2026 06:52:50 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64caaacb9bcso13513134d50.1
 for <qemu-trivial@nongnu.org>; Wed, 11 Mar 2026 03:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773226367; cv=none;
 d=google.com; s=arc-20240605;
 b=hOy/rBJQOapUEfCVR7iPMXGQWTOzxSejGIrp1fGCIYvW+UQMe8VqjUw8WktkMz17yV
 KFzE4/uOQHqaYttEFVuLLF0xM2OvfqUyI8zSXtcGF8mhGKr+Jal3lmNFJAP2tm7gb0SO
 H5y82x4pKgYePFXNAyay4BOiUD0/BynnLcKi7fXFgZuaWwjXNSJwg7ik0MJ/EXPNjIP4
 cIAlGlLXwFFObbZ4l/wptRcmItD2C2ww5dD70DNg/vHXLJVSzlgx9gxCkv/ZGkHA9eLP
 33OpRn6HcyF8UCZ2mImTxlP65QtCvojHoYCQe2rPnGHiv5+iMoBCz3BAmTxxqXzsWP/X
 TJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8sUemrHPOW40xJ0blk1bRj6suupCKfQkWnwFoAScRqQ=;
 fh=8QYp8vxj7vF22Tx2zSeYDFgbjSzuWkvuUxMhMj838fY=;
 b=QU8tAfVnU3ulzcFUzIUztiZ9tFctHpPcEOIIRKhT8FV/rfvc16E40Ht7/gbgeyAzJ8
 tbuQ/7s5yTpw4zz+3Djk58caHM9ZwuG0v5kcVu63nHRNkKhRyuwaN6wEo530o1Tlf3tr
 KLARtdFLraBqfk0ydVhgiM8zwGZjo+T8TeBnYrSEHandgPkOaUQhdgoYpLc63YxaxUIy
 2FszUbXKcLUW4puHNeGtEO7CTo8TtSMyiGvYMAaHLOPCJgBfwbwPhv4xTuEb3ExhO6KH
 +sRiwrzzeergHzbqWelrVKCZZLORzpkDvOko+AuHp4l4D89o2kNckrvhmd3cMKwtIj7c
 7j3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773226367; x=1773831167; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8sUemrHPOW40xJ0blk1bRj6suupCKfQkWnwFoAScRqQ=;
 b=Hp4+gTdJv9bu4ZujMzCZw+OC0xp+ZahomQF84Vrwq7ec0ZqgJs//VP6W6tHHrbfbpT
 QxBvr4RN+thXkuS9ZltENgjSLQLxD2i2UxfhezqpEveQU8ei7qHxInY0pUJ+Tbs51VdM
 HyThqfW67VBvZSJ2+scv1L8YvzPh6ZP3vljfadjDfG+oMWOosz5mKWA1Enq+RODNZXwX
 VEOIiMY9W1DgCQF+fuyRJZTBpjvH8IIp/NSluvWpOPomVX1befrfUY9ang89g7AMswXF
 VL2C2pMufxDZ+Cufbz7zf60rCFlXKSofiV6TWCBxUJ74JVdDvPynPfSc7EPDVjv6HHBR
 aakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773226367; x=1773831167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8sUemrHPOW40xJ0blk1bRj6suupCKfQkWnwFoAScRqQ=;
 b=sWYSsy5MbTkmGpARZsHCNaOu/Dtw60/ZTkOY20tB5c3rSi77HTx2vwOo1KCdZKuCQz
 4pEx78XHVvHWKymB6uP0HsnOS0fXPycBwVHKosJIo71jpsJYn8io0minr7XktFElSOx5
 g/TiwPrrDS7vfcBLt9jmQp/hhZsK6Q9/Fdo6YAuPnNIyaNlbutmub9k00L/Ql3jkJaHC
 4rIVco0fl4Ekxw7X9QM7FKa/YGkFfRfrpliOjcBT2qMRMU8+NttY5nc6lqnzBeCMHIUp
 F7pbdY6gpsVHo+qoen8ZoAbHc9ZMMjDa5e4pbYQMLkSTGHYzZI+qkYIeUWQQ9CzVqDBV
 rcOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWks1qOYUXW33YgH0yvTgrLgYXIF8Td2FDakUFwkoqNRTJi30hz/qz/F+0aoVd2zkYGsgCRNmZa3kketUY=@nongnu.org
X-Gm-Message-State: AOJu0YwT0LzLlouAMDoI2FBiH0xxRW4CxioneCDdgskog5cqL8rsTVbh
 gCbGS/fLxgAP/8kIZqR8SjLO6u7bcJj/dE7hHviS+DoHBcwwEU1g+QjEarc1X21VyEnj1oBHDWR
 6/RjWLlxhekbKvSKnQbZKvbfkYWws6FDqp/puo/h75uexxAKW0zJd
X-Gm-Gg: ATEYQzw75K84KE0EpDYdEB+mUKHSKuHY1cC4UV9uVBQqB5z6SeALRlgFzlxLoovw61a
 zIP9lIZI8lPYcFac+aVTc871kgQbP4cA+LqBUKc9WCHfKwzXAq9LM5JuUslAv+RhHYUsxjjQ4V8
 sKhSA50HjWnxWYexv90lJlO30sKsdnxCdwt59nibH/r4r50N4l7OKjsXZGiGPZTsc1s4yYbGYKR
 9BCr+WpJu3bKcWAVJSjxqvJMRvXpA13z9Ve48gXWikrdDOYzGvTM0WiIoYUMzJAVXeolvw7xX6N
 lVfGy6mjSHTG+6TJkpAdon2UENmHJgIAygpp7vew1BgtBYVwbwh5nFP52CFWU8pfw9A=
X-Received: by 2002:a05:690e:b49:b0:64d:6600:64a1 with SMTP id
 956f58d0204a3-64d660066e4mr1617171d50.16.1773226366726; Wed, 11 Mar 2026
 03:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260208103958.121455-1-heifetz@yandex-team.com>
 <47a14220-139f-4be6-a19d-503924d5e90b@tls.msk.ru>
In-Reply-To: <47a14220-139f-4be6-a19d-503924d5e90b@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2026 10:52:35 +0000
X-Gm-Features: AaiRm51Mm-9wzovRtGo7Zm7286__J8iEJ4B4LGkzDDxKgsWPy3CqmkvtMERAz_A
Message-ID: <CAFEAcA8xKEC62gTv2Trni_Ers7gkFWUgdTb_r3PaT0_Vz9sUPg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix a few minor issues reported by Coverity
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Sergei Heifetz <heifetz@yandex-team.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Wed, 11 Mar 2026 at 10:48, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 08.02.2026 13:39, Sergei Heifetz wrote:
> > Hi. This patch series fixes several minor issues reported by our local
> > Coverity installation.
> >
> > Changes in v3:
> > - Nothing. I sent the second version of the series without the corresponding 'v2'
> >    suffix by mistake. I apologise.
> >
> > Changes in v2:
> > - Remove assert(block) in system/physmem.c instead of placing it
> >    before the dereference.
> >
> > Sergei Heifetz (4):
> >    migration/savevm.c: reorder usage and assertion of mis->from_src_file
> >    dump/dump.c: reorder usage and assertion of block
> >    system/physmem.c: remove useless assertion of block
> >    hw/usb/core.c: reorder usage and assertion of p->ep
>
> Hi!
>
> I applied 3 patches from this series - all but the physmem.c one.
> It's ugly either way, so I'm not picking it up.  Sigh.

I think patch 3 is good, the commit message just didn't include
enough information to fully explain why the assert() there is pointless
(i.e. that it's called from only two places, which both already
assert or assume that block isn't NULL).

thanks
-- PMM

