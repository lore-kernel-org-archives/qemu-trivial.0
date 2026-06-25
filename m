Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9BCDE001
	for <qemu-trivial@archiver.kernel.org>; Thu, 25 Jun 2026 15:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wclZZ-0003Fv-SI; Thu, 25 Jun 2026 11:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclZ6-0002m1-7O
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 11:00:28 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclZ4-0004KY-BI
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 11:00:27 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6642887c602so2564558d50.3
 for <qemu-trivial@nongnu.org>; Thu, 25 Jun 2026 08:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399625; cv=none;
 d=google.com; s=arc-20260327;
 b=HCm8Dp1UL3YmcmEPwDIXw0eGiQZvLZxXOwTIDzeZFnhFjS1fm9bMewX02HdWXpNeJ/
 910yN26JHjH2jLqX23rQG9/K5K3hgfRTyTXR0dcZPKyhORxpCxLrso+aKUtuvfNIcHvW
 ZnS5i8f16y5MCm3MmC4RLDHICSwVUsa6Q3+2hcqQFqWup1wTcmRfXTex6bA+OcgFxXJR
 GB2gX1+MM82I7dSnTHK0ZvWnj7J8iXJhRC5xtf2QLX1ppZwSI1dCp1YCghOd4yzAh9aX
 4MLrrxzMCOnCrI83iyhES+YGkhDoxwH0Au3RsdSsipULKRkvTHxpa0O3ir9z0ZC3Epo5
 c+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 fh=3iqICKQIcAPZaOne6mpS/omhieeOCu6k/5G1hgHWGaI=;
 b=IGe69gg7y0JBrr4jUeABmegpnkidFo7zHT3FDtNuBrENYmS2EKOH6wq87ShOO2T+fO
 WEDKKtY7s56ASt3Bb3++vCPE9ltBRjxXtpp4Z1cRlgJkUy3NhxAUL/hKH2lWJyofeYOD
 Z0b6/0+ukg2VOz7Cqh2GX0/RtSs63fwlUqcxsIEdTk70RLkPzV6xMmJrtm7cm3kFVcZu
 VJIGmDwv/k7a5QXfOy5XVaOzBZ1RPv4J3GFLsSlSr6WDe82An7kYT7p3qAEDFcSjVTCB
 pfqH3qlAe5JpOhXO9k1OosY6DNzb7NI28sTSu1/a9EB9LLn/99qRR9sDVBByg527OKZU
 onyA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399625; x=1783004425; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 b=hHtHLtlyY4ZsIiu1OT2SDtn/eti7qbleLD4Xb4b7VfsUtL5Wq00bUkWV4wapGzLCFm
 rZ2apb/xFUG8Ggmq4XqU7JOPPwQl3lR3wetIhfX6UkmqSXGZvyG18Xh9OTCTEQRnGEEi
 Sut+YdKGjH5Yq9KRCZE3VqPz78FlsxSg0FrzfqNnY66xK5TZFiC8sjyaq00gYn3t6kHh
 CWDSV1mdXfaPzvTgtFXkil0k0rwRnnYYlHLJtNev12qSG82O2Zv4RfnlXtggv8l2XdD+
 d26LHdtF058Kuw0vP219quwbSIbdZXvp/TVTSN8zn8DH1VTwqOzY3Bhghy74ka5qbE64
 semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399625; x=1783004425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 b=Knf16TehAQQdKWA3c6vk4/+agLyYxh2TrOsMAVPIIWSHEjkPcL9CgNkC42Yk+HCAKp
 /svERXSUZeKYdUQyfUH3uCda5ppk5fpPlGB7hYOaoDolZeLs0cR0QkmJ9YC4+f8WONgw
 Zg5vT2L7GJJBQsvDXcexhYyQ2InCOFHY1kYL3iT2WeXj8mQS3j/krQRT54az/cmrNhVY
 63/iqD2HBhAU2uh+35Zoi7D41KyZg9wuLbphwp8QTm4YCdZqsk68N8A7lBkfqKyQrqqk
 u6iOTA9BpanplR1n7ky13idvt4MHvJzaF8JpD00qLV6buVnoCsYEECc98LzMSIVpkzWe
 US5Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoiWDDt2Jx0g0L0CVLQdM69Ef8VRfP/Cg6TxEGHw6EIbr2g0JKoY2eoLJd9g/yIdf4viTJhoGBxdQdVmgw=@nongnu.org
X-Gm-Message-State: AOJu0Yx2Rwgbj1hgM1vdAJbxJydeemVjMNb1pT9jSCkPGHcsGqVMB3a6
 AwPKn0AW6GZud10vF1mrfemH8LtpGwgnu4gZChhoY28CbJIKcDlAgbHqe6MNfuL9/1QGElm7yO2
 beGFJ8OvmucSE3j4HF9ehy3IRWPAYpfyqXrQL+YDkIw==
X-Gm-Gg: AfdE7cmrbEONnUFnRMoDWvnRhCFEpjQ8QemsXOtd/ugt39lUvURi2uNrH+5W4pi1rwV
 O7rmaGN+tW5APaJC/TX/bd5eudrJmDiK4lWtKkwRk3AXgR9oq59XperziPCgFCbLEMCEWxjFNMC
 ulC2xWuLoI5vEPCsgwKQEvpBjd9iF63OxqTD9k6LBapWunVvB30e09XiNvU2mGIEAbqPZ9EnaXo
 7l+7MZnqoZEh8L+mEAKw0X07vWtvHXN5psEO0AsPMjUJ/nBWVNom22Ou8RD4CQMoZr5fyzHuZeu
 8GUw35p2hKr3aYr20Zl4wLBJO2wvamYiKnu6JawPsZ5jZ1Ad1l7X2QFu
X-Received: by 2002:a05:690e:12c6:b0:65c:6dbc:39c4 with SMTP id
 956f58d0204a3-664883cf072mr2064803d50.51.1782399624698; Thu, 25 Jun 2026
 08:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-4-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-4-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 16:00:12 +0100
X-Gm-Features: AVVi8Cd-jtKXwO_oqqYC44dGW1pgj8FSZMSOD21cEwgjob0sns7mLlNEW4K18PY
Message-ID: <CAFEAcA-ALs7TtxySitahcYk_P=99uh5078Ux7==Kh4ER+EQPRA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/misc/imx31_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx31_ccm.c  | 33 ++++++++++-----------------------
>  hw/misc/trace-events | 10 ++++++++++
>  2 files changed, 20 insertions(+), 23 deletions(-)

Other than the missing signed-off-by line,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

