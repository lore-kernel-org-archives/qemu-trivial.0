Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E44F483CC
	for <qemu-trivial@archiver.kernel.org>; Mon, 23 Mar 2026 16:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w4iTc-0007z1-B3; Mon, 23 Mar 2026 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4iTb-0007xF-9o
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 12:50:03 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4iTY-0008S5-Su
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2026 12:50:02 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-79a46ebe2beso38743377b3.2
 for <qemu-trivial@nongnu.org>; Mon, 23 Mar 2026 09:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774284599; cv=none;
 d=google.com; s=arc-20240605;
 b=Gp0hvMrXutgLjiHRW1g017Borpv37mdpgIDjWaiiXSTjghkOwt5nFgl9LvfjSHxL5n
 rzAqickBGLawEPR1RsH1LxCdw+6YSNJJKYRSrjWXpbJqV4bUdhg/gRWmDHt5vf5geN57
 /yrcsmmm84dxuPbv0z7hHHYMTgr2u6zlsW6/OblpQBB7JCaWXn29HXt+j9WvuyPAHcGr
 +LqvvRETpbX98W1NsT7YWLzE4jVCcLnvWO/VsAVoQ5vaAQl+VXazss9h6gLqvqf1gnOr
 M6pGn5f/epC7KgcZd65M3M9cZV4Y0UJYUE6ve4YaO4qdU78oZ2OZKzqYwmIXcVY6pnqU
 4NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+NTKtBdRiB/NIe8g1z3Q4L5ewXm7sCohkUuH17ncHck=;
 fh=3S4x/48/fTtkNmuheqlGmy/7ugua8Fef3tcQDqd8UKc=;
 b=L4sg3Sb92o9k4vY2CCdol+cKMl0rkuVMFvAxRVyqgoLuaYXI7WEEnvwQMDc6Cl1tZP
 WiZZo7VNa2IaDweWh81ocPMAz/OqUNoim89n7n2N0/Z9SiHPKB7IBBjwmENTEwF2cuG0
 j60N83LOo4ONGJd8MULGb7mEpSdAGAz3xJla/KDD8vT9QJWS3thFbQVN5JtWSrKRT1bz
 gTFKpyM95ZEQA0VQy4AyAcS9RhSSPESxHo3vo6gLMZYGYLFUUPcZN3vN7KC/lfvaObtW
 irglHXhWiB30qgrYtCX7+P6ssQ6ebPspOI1GyDNLzbng2O6DoCjTxeQUW08Ec9HMWNmF
 DpVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774284599; x=1774889399; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+NTKtBdRiB/NIe8g1z3Q4L5ewXm7sCohkUuH17ncHck=;
 b=q6d8myzopXfp0FhNpdFpP5NBcrx4braVagIsdl0BkmwqQtwdnDhpCl20wwtPbVpox0
 9fplP/Vt0VOQzskT/fJ9vysUEtu2JNz3RsCOZr+gBqiDE8uHUApMSRtZjPQD+9a9z1/4
 2BhNi9qrvbF1cxwkwP4N+Nhblk/jbig32oZyW1zsgJyIY8beq5fckLsXQgkUC+aDN+bb
 LDtvm/A1/wDYIgqBwQiayxZG7JDwdnNPaLCHoy0L+COq8DTADiB2L4nPdN+K9YFszKNg
 1CIIW6D8c5/cKjMVMSZKbp6V5mutYF6eWORRsA9c7gKaDrpFB9jHi5/BHTRthtJinpxX
 mvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774284599; x=1774889399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+NTKtBdRiB/NIe8g1z3Q4L5ewXm7sCohkUuH17ncHck=;
 b=WT1SISknXEFmrvGwBxoinZpcqPplNb0uUZglNhaZ3KlSeDhQXO1wbc0zaDX3n+MbvM
 5unTJ9eZbyk0u77d+y/Q79Ne9lF8ouNpFd6Tb9Dh8bVlJ4rMHSg4d6ReadpM78a+gZWj
 qmV2RPWIod85vcYJWXgAFJe469hw+lN92RbM2nILUiChq6BoHnTyCg9tcXx3Ah8yeE7b
 fS2k9B/+r8lVPwx2IBqCNjOn+mRCqoyNO7VBnyASYnDawfk9VJL3VN3hWAwcXM3Ts/E1
 6JTaR+fPx/JudRXP1+3s5oay4fb6HjDKRzMEWImRedP1X8/K1DtWzzj1YsQ2zOT3K87Z
 h9gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLF8/QhFPsCJFUpwOdpyPNvvseRjbFa1I1UBxF0KQ++7Aa5lj0UhomeIxY5eef2RrndOGskeNxTvxhILM=@nongnu.org
X-Gm-Message-State: AOJu0YxWCQm9qXLXDCv9sokANtfXzcIRkHoker1rmrzwA5ECY28TF0CU
 LGF/nHLQYjuFaNIitnDn8tiQWE/ATAautLQBVEql0xJ89wsnemxW1t8P2M+DFoPsKw0nxEkob8r
 P1E3ZJvLFyetFRY0MBwTaOE/sCLZuvd37Dwy5Hw2QKhsgQ8jO0DimyU8xZQ==
X-Gm-Gg: ATEYQzxOVoXjERIdm1uVbfU/PAwLLQCWj6JrfktsCEE9TKTPo9Y4yPS8WXZbfcdiJeW
 r2tmqel+YJ4A9ewXO3NlEPo8ML6/sh1gPLAJAfRL+9njcvdgqSBiof2mJzAaUxPh43ys4cUMpUk
 4m2G1qCn8yNOwVm0ZewskUpz5qM/IbRS9GZP6kZocNRrQZHkf40wLQMtNiuaRG3zlh2IVYHTYQM
 pLMd0pvBUnYCChlf6DPBq1f3scDZ7QnS1sGxlW+EnwUwXBECLP/82GtvSW4SQlT/SbYtM+03kA+
 0IJ42f3Xu//Zg2Wr+a0E7JFg2AWWCnIuPAOzTA+wb66YgMoc4pl2gULlBfMsbzGUHnU=
X-Received: by 2002:a05:690c:c4e8:b0:79a:349e:9548 with SMTP id
 00721157ae682-79a90aa06famr132032577b3.3.1774284599162; Mon, 23 Mar 2026
 09:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260323130021.376393-1-mjt@tls.msk.ru>
In-Reply-To: <20260323130021.376393-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 16:49:47 +0000
X-Gm-Features: AaiRm53QNJFZrgIJRavRivKwFy8aCFyqP6xji-6XVuREtgnoYRQOSj54Ee71cNA
Message-ID: <CAFEAcA-aiqsMZv4-8ULC9YtN0uhDGLAtEO7donf-a-txE4i3CA@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial patches for 2026-03-23
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Mon, 23 Mar 2026 at 13:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit eb153d8fd3be325a5aa7e1a6a73be8854eeaaf27:
>
>   Merge tag 'pull-target-arm-20260323' of https://gitlab.com/pm215/qemu into staging (2026-03-23 10:55:20 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 8ef2576d32dcabc3cfe9abfde7c23c1587444584:
>
>   Fix several typos in documentation (found by codespell) (2026-03-23 15:14:34 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2026-03-23
>
> minor u2f tweaks ny Stefan, and small docs/comments updates
>
> ----------------------------------------------------------------

ERROR: pull request includes commits attributed to list

$ git log --no-mailmap
[...]
commit 8ef2576d32dcabc3cfe9abfde7c23c1587444584
Author: Stefan Weil via <qemu-trivial@nongnu.org>

and similarly for the others by Stefan.

Could you fix and respin, please?

thanks
-- PMM

