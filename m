Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99310F9969
	for <qemu-trivial@archiver.kernel.org>; Wed,  8 Apr 2026 19:35:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wAYc2-0004YW-VQ; Wed, 08 Apr 2026 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAYA0-0000en-Cn
 for qemu-trivial@nongnu.org; Wed, 08 Apr 2026 15:01:56 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAXTh-00016R-Qe
 for qemu-trivial@nongnu.org; Wed, 08 Apr 2026 14:18:16 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6500040ef83so33999d50.2
 for <qemu-trivial@nongnu.org>; Wed, 08 Apr 2026 11:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775672171; cv=none;
 d=google.com; s=arc-20240605;
 b=Q9iCsIwiqWtdITUCFMTXSjbdCft/awfKQmech0R5k+/1gu00I8GtRNy2ygZNzRgC9R
 6qEXsDUTxIe6ssutnbKfowXKw0Qu3RmgGoP/PBZmGmesBTmeXD+r5mU284OucYzJKGV3
 WV8pFT5fLBfBdy7YOUbScMQ2CHgvUp2cqgXs+s7lDM8iFGjInyTvIB6OCR8ykkwBbhqu
 kZAc/ZNIddwK7HjEFH7uc8QsxKmJqlgwc6N8u07W386mMyFFkREUaz9Trn/66Xac7UYr
 xlaTirdlcHHQnJsIg5/Yv124K2z0p4r8wJPCDwI22IzngAkjan4hSX8mvfAvSUGWgkFL
 AAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pKLfQ33XiCRiNlynAN/2fOlxoo0Fd+Z9Xj6+c8ipyzw=;
 fh=YbvyozZc5esCY9JadyYDf4V3/5/85geuFxJnb3GkJJM=;
 b=LOkOwqxByEplk+s+d4VplBNYTt3xYy+gCtKOXk9FkrMmYiArdSQbnl/Aru5kJKB03U
 Q/IW0wRebs41UaA35sz3nAXsNtPhYu8C90pnm8498go0wwprZulDTSX+fYiinEEqXX/G
 Kh0q5E7etl+qCA+mAy7XZCLpcMjwiWEfHVJVXBjzEYK5FbdV+GRLxA9EkRjtUFbw9ffN
 Sy+bb3Rht8pZ4PUKZDTpmenoHrtFdRui4dghEAuwqj9ycItWh5soXY0/G+I3O07knkD6
 U0Br92JuhrWa1Eonjs40onl5ywhIqljpCeQi+ev7ZsFSEmzvnXJXQizJgErtSwuNspP2
 LicQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775672171; x=1776276971; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pKLfQ33XiCRiNlynAN/2fOlxoo0Fd+Z9Xj6+c8ipyzw=;
 b=lOAObgOYnn5Kl0d5SV8QAbisy435WfIYWl2eKQLa8p+lng9UF0LEmlHVK38bl3uzII
 r+OAkQ/XGeYd9JCbUD2I5/AJ9LTK10d6rtBkyi0DzKtbBR9RFbnaYhQPU+R3sp67M5li
 vWJ7HULjh/UdzjgwY9P1NeFg1J9TMRZnvNN2TKc6Q5DTlIkcUyVFQcXrOCxA+2AbxyFi
 QfLybK0yiVMTNBYwvKr63KPGBPWRQ0F2CnCDnGYj3bT+DivHpsRfotzKutGDogf25jML
 J9bhC6oedMwnw3b510ceXTpDlqrUYD4tn5CTOM0WQIWZno27+f7dyj5N+dVg6NuDv4wf
 mF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775672171; x=1776276971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKLfQ33XiCRiNlynAN/2fOlxoo0Fd+Z9Xj6+c8ipyzw=;
 b=ImYm73N/4YgpBX2p6YmsNpkSnWMcPIXJPL/bFJcKZMJhplNBssCJ1ij+t+ZriFCPhH
 A19w3Z4s9kaQASDqfGWECZ3E3cBObdvLdLSKPRHNetM6YyZYXl1AXffltfHSlFUxPrGr
 5HcSOu6e4A0DoZdeEJUGrLQHS2bwIiozi3k1zDqh6ecCpQbAAVacwMlwYPTc56uzkr4n
 ujPfFtabB9yCjAygguN8G/MJaXaFzjzBVMjscvfdSwxOSKjXIwzaZr0uDzQij2E1CyMl
 p00+Rqysf85Dl45cDt7OHannu06VFgr+ckAIhuZtl53R/Ly5KlUbWtGnZK59Rk5hcYS3
 wWng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsresmDA9wt7eKr3Hc0TJbjXq2Wn1QBSx0Btkqfp6uhaZhPo0zIfOt6Wp4EpRnsPIGmeseHIscxX/VT+I=@nongnu.org
X-Gm-Message-State: AOJu0Yz2s8nmVguqtr5W3mm1Ro0baMAFdKcclN1IqhCtHwcUkV1e/nwq
 yU+MRSRKR5ShW+nTanlv5Gck1CEjXa2LkBAN3zBwhMsXX+T9DtvEHtW+/GM8sufrcGz+G3ubU/I
 Ztqb28RLUikZB79qpSJJQbSIfYyM4BP/GVY3FRLlQ+w==
X-Gm-Gg: AeBDiev4kktguSgj3zF8LrxxH7bj651Ro3IJxCsKU75TP1PCibTB70yP+Gik+7eDf1L
 2+jCzbn+NB+BTwrj7ILDNE/yM8hObXYZrF8xUslxXtzg51jbuiodNb71mD6+MPLbd7dCQo+xnzi
 77gC18r7OfQNzWtCPC0J0apn1ISkftFpInc3HYfdqdDF8LRvP5irVbob5/qqxPxpLGcbCzIjDHB
 WCAc4VNFt9SkyaI5o1jO+u8FyTnjanvNhWmfPp1Dt2AaEAQM6nPg7JbkSoMCNmypD5L9OYCYJ0s
 GYdupDSTrC+dlAl0I1XOKongiUjavvgoxEpgk41cMFhc+Dw542DV8v0dDSstz6Z0dkM=
X-Received: by 2002:a53:e8cc:0:b0:64e:e553:d788 with SMTP id
 956f58d0204a3-6504880fbeamr15709937d50.43.1775672171043; Wed, 08 Apr 2026
 11:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260408105605.172465-1-mjt@tls.msk.ru>
In-Reply-To: <20260408105605.172465-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Apr 2026 19:15:59 +0100
X-Gm-Features: AQROBzB3c7wft6KLxafDDsTZSV5Zlw23_RdknzdNROhvWBfy6MKaeN6ucRD7v-M
Message-ID: <CAFEAcA-JLmahDa329ycaVY_t7LsceLa2X6wDgXZG6Z8mbYH__Q@mail.gmail.com>
Subject: Re: [PULL 0/3] Trivial build-system patches for 2026-04-08
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Wed, 8 Apr 2026 at 11:56, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit b6a7d06213e5d2f7d124d16418bc289c4a8a4b82:
>
>   Update version for v11.0.0-rc2 release (2026-04-01 20:48:02 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 17fbf3e18c3dbc32ec07cfc24853d6654a813e90:
>
>   util: fix missing aio_wait sym in qemu guest agent only build (2026-04-08 13:48:50 +0300)
>
> ----------------------------------------------------------------
> trivial build-system patches for 2026-04-08
>
> bugfixes, and making possible to build some minimal stuff
> on 32bit platforms - pending more permanent solution in 11.1.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

