Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449A3D2ED0F
	for <qemu-trivial@archiver.kernel.org>; Tue, 20 Jan 2026 09:39:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vi8D4-0006RS-1G; Tue, 20 Jan 2026 04:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vi8D2-0006Mu-7b
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 04:39:36 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vi8D0-00072l-SC
 for qemu-trivial@nongnu.org; Tue, 20 Jan 2026 04:39:35 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-793ee375a23so16540707b3.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Jan 2026 01:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768901972; cv=none;
 d=google.com; s=arc-20240605;
 b=DwfhR+9K1kLIlqPUyb/vW5QwEbd6YwCafQJDY1mjX48+wdl/IeDDomkVh8Mk0Qe+i0
 ukXvrTNGl4p0/Tinc6uluFI/bf+9pqWxbRduW/q7kk39In44YEsMceqwOm39Ibc2vhWy
 B7G0rG3n3XgtgKqfF4xbIDMLGPnixwUtb3rz/oQExsOMgOX/tPlhwC2+ZDuSTBvwvvv2
 BJwpxULqu29b5wMRDGDBItZiORNT8NFL5R5SQs4rzbDKMDXew2ijKzSTBBdvJ9US6yu5
 ryC3kp0018OqxZ+0xMHwFS0Tku8Rry3NhdBQ/UegMkYIou3c2s1XF+ssgUppybBmdfrd
 o96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 fh=zQhBxpqXS43BQekkopw2zxE78tKY5kFd+HPpzqKdFok=;
 b=lS0Sbx82T/JQFAAzDnOZRocNibRc8vzODogYPXXLECwfu8CQFD8Qvxmbtn+Wy5DZeX
 NcHVfV8MsYWdf/9mvbnDu8BQuaVYE4w397z6np0CVQQnnyZId7mZ43BXGnNpP2W82ib1
 qqUK/9oiwlkhMP8mbfZFPSbJMIPO+rL+C+OAkgVGhDWvClpyzFU6EXabMtpeSEKixqJq
 fhBNWxGR6OBgigM19Gyqm4FQFoABndjJ0il30Pm4I9UirNgLYeZ5Y1WPzEYrJwnEsdcZ
 W3h/i4m3wl+Zn79+FuOiWAHeNP45+DR/PSHS5WhvUg0LaYjrVYhtKQqGTo0MCDhlQwV8
 9PCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768901972; x=1769506772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 b=iBFflFDN8Ya0kb5Q0hEc5bXosY1Qeb5nC50W9b0mLitZMm5bvgaSA+vZnuIxfOaCYH
 Cl6Edqx7B9hmoKoN0kQ1G6yBQn2RJ4BQKAudhrgU326+RtAYCtqXWhG8Ujt2PdjMCyS3
 qFQJyP6S3XZnrYbNvL3oMMVZupVZAxIYy0pqlX75IrNzjIhMxXVYtoMXw+y7mHV4lKlO
 H4zz58+8WM4GJcpLhfG+B6+pjkkZDE1WvV/twi0Hui2hL1EfMcw2WudjCfZAOb+TPYs1
 GkYvY3o9GuU6RGpqel8ffuJecCnQSOz2nqNHBi29OgpiIkrFaH2wX1sdygCIDSAsAvQP
 Ro9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768901972; x=1769506772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8F9xJC5CefwY0Abxs8+Wa9Hku769lMVUPA+ypcmtJo=;
 b=T5x7OtKMGvfH7cY/Nv0sbUyiklO505OpF0j2eCgP4k7dBCR4qHFl7fa1aNrXVVorNK
 M99HuMuesn1mxBxjzkXnlnTOZeLp29w+Z+SkJK/hcqAxJkXfA/tQYQrerLmMJ55kx7Ro
 w8ye2UT1yZa2NXDfSmG+NT4E9XN96EYwAE9o2IotH+pR7m1jqbTm1vNZTu1XQVKrBqGg
 C1NxvLoqKfUFP2PnWbYx4R+UeM+V9JbpqvINbYsAcSHRw74PsMLLbE9gbyakVacZXY/j
 SoCU8aPFc7vEyKqVOVMpKLa0NtYleDartlraTNrRgpYxpRFojIUG3qMdQS2YGdiWgfIK
 OCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6jqP0L+FTpGTMI92p0IGE20Sy+2gbKO/Qkad2ZwR8cmnK5cT0aazmdJddK+26A3wW0tUYsx4/gnNEpeo=@nongnu.org
X-Gm-Message-State: AOJu0Yw8QaiGbjTZhNKXg0skm1EJZn4DUcg/35PzfuEq4ufpuQi7Doi8
 h0o87gAgZEnoJydu6hg03A3dgGXiq5UKwqVjcM3dg4gQULpr97p/tBV0DxIMnd3h7RrJNMcRtV9
 A1yVgY2raJ2VFnQ08+GqGoZYkDsOM6sU/1P2a7WOZeQ==
X-Gm-Gg: AZuq6aKQfBYTlinOnMm0vLhVwGaiEqJltLddEwkJxJIC13s54H0rp0COHE4YQDSNLzl
 +mjgBGDSi9tamTsLd0TkTHsp7zLTdQAtdgmxIIQ1CX5FJ9vAgOXviJ9+spBCEDt6UypJdpM7oo0
 rGW9B4JniHCyw3M8rYGwIC3/BIXRPBVrDG+lz/xa6ejDL4kSzxgp2/bub35vHEoMFv8/m0CS0wG
 Gu/UvrUWx535s6Z2QFb3PYpJS51JaOu4N8E6WJKb25AIZQfsQtd5zckHN32+JGKK3WU7Q==
X-Received: by 2002:a05:690c:6d84:b0:794:3a7:e4a0 with SMTP id
 00721157ae682-79403a7e838mr20070107b3.23.1768901971519; Tue, 20 Jan 2026
 01:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20260114213227.3812-1-shentey@gmail.com>
In-Reply-To: <20260114213227.3812-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2026 09:39:19 +0000
X-Gm-Features: AZwV_Qh7ikiAl9qlyWImqqvG1ssVxx8uwfWiZnqXgpeH4Hcv9Wuqb0U6HOmZiTY
Message-ID: <CAFEAcA_t_-Xj=5VExfHk8mNDqa8DB4oxGRy89fgTZ2y1U6HU5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] imx8mp-evk trivial patches
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 14 Jan 2026 at 21:32, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series contains just some quality of life improvements for imx8mp-evk
> machine's CLI usage. The first patch removes the need to pass "-smp 4 -m 6G"
> and the second one does not suggest passing redundant "-cpu host" when using
> KVM.
>
> Bernhard Beschow (2):
>   hw/arm/imx8mp-evk: Provide some defaults matching real hardware
>   docs/system/arm/imx8mp-evk: Avoid suggesting redundant CLI parameters
>
>  docs/system/arm/imx8mp-evk.rst | 4 ++--
>  hw/arm/imx8mp-evk.c            | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

