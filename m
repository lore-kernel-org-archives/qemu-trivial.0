Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28172EE20A5
	for <qemu-trivial@archiver.kernel.org>; Fri,  6 Feb 2026 13:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1voMDC-0000wo-CQ; Fri, 06 Feb 2026 08:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMCv-0000m8-2Q
 for qemu-trivial@nongnu.org; Fri, 06 Feb 2026 08:49:14 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMCt-0003b1-EL
 for qemu-trivial@nongnu.org; Fri, 06 Feb 2026 08:49:12 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-794911acb04so7840447b3.0
 for <qemu-trivial@nongnu.org>; Fri, 06 Feb 2026 05:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770385749; cv=none;
 d=google.com; s=arc-20240605;
 b=BheucL9idQzwD+qKBiEtJNwKIC7Pis0OxhqOBR0UdcEHM3VUYizT/UHKzeAKRNM/jn
 KLOt9Wb7m5GOknSQfOVsF5MYcDaS2nSclYFzcom8h+P3ag4A5aeItFf0vyYxEnLBd5Zy
 7hfb3ca65KRBVGaVaAOdtlTspkFciFHXGjqhbY6n79gj/jnzMcqxiTn3JENS/GbFA4hQ
 ROnliTHKg++kdYhjcxRpddkmUbFHRhM8w94iAbLyxVDc2xjdRKex8SWcNVVFPTFg5yZV
 7KSml66REOepYA9SmkchlZTW1ijUoKkZs3ZOFy0dVjVzhLhyKNohnt/ltK7AwH0hfteQ
 8H1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tAJxh5aYTSnA6OumxotnwqDrAnASnUjEjvi8Z615DvA=;
 fh=XZfIxepCRWnAxVHB71X5eNH+IqO6Vr9H6vUTrbhbIx0=;
 b=WYjlwkA/YwFlcF9FW1kQIvzERUbw2Z+ADuDw9TRSJO/Yj8B149+tcegP/dgrCrpPzR
 bcxCwAOmKrvaG/ntwmnw1xMGHk8f9ACZ+zXBOsZnVWLI6d1OOEPoJu7ljxYaUpaM36Nr
 ywZR02vDmqtlKYyWmb3tCYZ4F6qepnL3P3JD4o9i+cJHnV83dqhWMNDWUP/YP8/iRXKn
 6LolwuL/m6lIX3ACn1wR4JaLv+D4R3t3ia0M1osANb302ALEwgD6vfAvSDW6SWpjMnhx
 uUCWufu6lqRzhjM162FiFOkbuboYt5TD5LmTQqa7HRuHCz51aw8rbeKnHPULeaeJGSvZ
 NvGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385749; x=1770990549; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tAJxh5aYTSnA6OumxotnwqDrAnASnUjEjvi8Z615DvA=;
 b=lgBc51L9FV21Tjb/DwSlgAt8WxPfNFcZjcSSkQY1i+Oa5ZmJr7OAcR2RKeZYtC2YCI
 U3bO+5OyCXxIwxLUSltINoT4DZiViRwMQJKgXFWJmJCuIuLkT+wi8jnCD+ouE0LflzuB
 4FoM3ph1v/123Lw/+Utr7e+skAu4nawmaF2g+QqHIu9gkg44FLdKqQg5i8det+tyyla8
 kdu4VV1kzsbdGzo67v+l4Z4EL+hcYMEc8hZnzd95D7BQhMTvJ6H9/nCe+6EnXJZfFRGb
 EnNU4AZ3zBGRkXGCLhvv/E4HUMUer9F56whOu/bVwTFfAM65PXQvAZX2j+Vwx+9lY72j
 ZNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385749; x=1770990549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAJxh5aYTSnA6OumxotnwqDrAnASnUjEjvi8Z615DvA=;
 b=A2IQyY/5rms+0MmR+F23xOBAbn59i+dGlR7W18TTZOezo3Ptt3q/N0CmeKYA6LltFh
 odzL/U9z8nQmLtIGqALbd+RCeVQ2d9ACHzoJ1u3wLBsXprTlRTmvHiUxd2mRrn0VC0n4
 W8XEODz2WvXtZpArSS4vKLOnk8Vfvp96HaDJVM63JDXMrwBLRNA2B3a3CBeiE10QMebW
 W4bgZzFJ6agEy/nmge518eZMiXgxQxm5M7+Lhh1GCLqXGbDzlvYfc6Qaq8twIxLdy9/V
 RdP/UkRlCjUvPrr7WDd/LiWwBst7wln8VMNeFOwxEuFSvkRyJcP6vuPFBQrXLukiic7g
 lLxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkWXJqUBxS2/LPliOz7SEj0UZv9nDVynSwPfj1Ukv5hzoXi40+LrDzvZHn8U7M+NGxUAdCAFEW28l3ByE=@nongnu.org
X-Gm-Message-State: AOJu0Yx9mmegEgyPk9f2cd+ok21KI4PLnr5iJnJKqPg7iQDA9EfEbxd4
 54TpVroGkm/N2wUxrojoNj2h2M2jrFwkH+AtnQrnl984uXq0lozEVRLnzAgko5spuDwmB/vtfKO
 CPZ8czRVdMFeujT14rF22eNkRPCmS2fhJNwc6dOXLHQ==
X-Gm-Gg: AZuq6aKh1VgqBUy2ncdCm0y/q/IvQoYI/QCXoapBgxoBOkBfFkY79GZX5RScWCcP/w3
 t4a2AKkdvYohs10D19EV1ygK+NSVjZ7oNATAs2MaW5H/jxaRwmg9Z1kdZB42n4EXX2/nxn+NJzy
 xZjCygEma2SChSqwpEm8dPzlRTVjGRLP5MmUHedEKx0VrHZT1XJvDsHPCCWssThV3Hn+A4JI1gz
 qg8Ncb16oMGSVk58ZE3vNqs/cuGTIIS2Kz49/i92eZEdsHXupXFFM6d/WzSo7+ohl0rEM1z3H3C
 bGuYkYT1nAioB+EDqWWtUQHL2SMhXkOIo220JaIBSu5b7QjaECXBdBw=
X-Received: by 2002:a05:690c:89:b0:794:f3df:8343 with SMTP id
 00721157ae682-7952ab6f609mr25881047b3.67.1770385748876; Fri, 06 Feb 2026
 05:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20260204075754.21078-1-heifetz@yandex-team.com>
 <20260204075754.21078-4-heifetz@yandex-team.com>
 <722eb7df-0eb2-49c1-af07-90004ad46a8e@vivier.eu>
 <67851770384370@mail.yandex-team.ru>
In-Reply-To: <67851770384370@mail.yandex-team.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 13:48:56 +0000
X-Gm-Features: AZwV_QgEKmkNY4zBoPMBcwxSvd5bLg_-fLouZnLmEuFw48BUT3MKJMZeri6Ni0Y
Message-ID: <CAFEAcA9TFgGrXx9TfC1jr=VOOJzoAQqirbDOyf2PU3cMXc9iLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] system/physmem.c: reorder usage and assertion of block
To: Sergei Heifetz <heifetz@yandex-team.com>
Cc: Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 6 Feb 2026 at 13:33, Sergei Heifetz <heifetz@yandex-team.com> wrote:
>
>
>
> According to coding style (docs/devel/style.rst):
>
> Mixed declarations (interleaving statements and declarations within
> blocks) are generally not allowed.
>
>
>        newsize = TARGET_PAGE_ALIGN(newsize);
>        newsize = REAL_HOST_PAGE_ALIGN(newsize);
>
>
>
> Hello, Laurent. Please note that I didn't touch these lines.

Laurent's comment is not about those two lines, but about
the ones above, that you don't quote in your reply. (Laurent
is following the usual mailing list style of interleaved commentary,
so his remark follows the part of your email that it is in
response to.)

> @@ -2054,11 +2054,11 @@ static int memory_try_enable_merging(void *addr, size_t len)
>    */
>   int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
>   {
> +    assert(block);
> +
>       const ram_addr_t oldsize = block->used_length;
>       const ram_addr_t unaligned_size = newsize;
>
> -    assert(block);
> -

You've moved a code line (the assert) above the declaration lines, so
the function used to follow this coding style rule, but now it doesn't.

thanks
-- PMM

