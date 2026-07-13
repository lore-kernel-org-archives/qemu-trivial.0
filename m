Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4116BC43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjDim-0002C9-VF; Mon, 13 Jul 2026 06:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDij-0002Be-M0
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:17:05 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDii-0007eB-6l
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:17:05 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81eb41c1f1aso2156777b3.2
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783937823; cv=none;
 d=google.com; s=arc-20260327;
 b=TFIU2bcC5oUDVNATYCiGFeFp7hzMe1Y+hqa5RsEdhWzqQameLrGGCl/x88k5LOpNyI
 K11Mx8rSlRPIXa+Kz0CbL0TmsNRU53A+QCnR3++jBmsCobMmzFT8EMRbNhs5TNyHtKHQ
 4Fm5YBWKQKikKhtub2nDDrA8Y4fSC2HshVSuhUeI7jzJ3gFwEqIRdxC9zy1McISTFWg4
 QwyJcBOwZ9YeHCaNnpcF0wkpxrl+jVk/+gDGJM3Kue0vThAJFIRuywrB+/fuYvk5vBjV
 t7/ohjkePVLYTURf1bRD97LUp+2DvHwKlXfVLdwgGc5Mgx4B9t2rqaTY3oiZ/gg8I7u3
 Rjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/nbOlOJ8IGlEjqeujQrvz7Y18z1id+1QTtzIe7MkwAU=;
 fh=5Roc3tT0zMddeQBgql4adHifz8I/GjhXBgp356FrSjU=;
 b=bTiqQhQm8cmJDg0uUBmgnfSf/sOm2cL+p9zHNh2RCRoVNXL0GiG5sITYKo3FYOqUQ5
 JNa2B59chmJQTihMmG4jHwqY8lxSgfHwlsqE8BuZwdMbFLR9zSYM9a9mTDekqsA57fFa
 YoWqgpUyioImQdWKRS7ETHmO6xXcZeVPYp7ggS26mJ4jQOPxS+THJTeffkSnlT1LMiC3
 lg9Lk43EbwMnsw93YkKXPc2GWx7t+X37G8WUU6C9hxLHqUeoAq5C5EqiHNGZO0BNElgs
 Uqk7BJkdu+BTesuYkEKhJr8zJkvk6lD2FJyS/1A2fhzhz0snfLcG6qDQPzeVJSEFUXVO
 fzIg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783937823; x=1784542623; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/nbOlOJ8IGlEjqeujQrvz7Y18z1id+1QTtzIe7MkwAU=;
 b=U91QYyN/MGpmymRgqRhOXTO9eX9jAIhOcH336/uDx1600+C3HbeFGg1vZ9d/8vkddC
 /k4AcecLwTYEp2Aqw4oiSPmsqwi4S8eJnEly6VUDFyNycbp+SdwEUCgVxUCw72rqKS4R
 JMX5OhXOU8/1xoMmUQztWjc1ltwlBq4gI3AJzcn366E2obnL5SCPSKnmI2OaJFFltPkQ
 aouFSuSuMvN+o5ZWzpT7v24Bc4XA4r20/fAw4SbCYrw8zWYHpcSZDIxPlYDZYg9e9BZj
 CbOb8LRyltsj8prFZJusfW+tdaIKYlBlXsN4r5HhFx/ih7cEnqhSU9Umd8D9IlZhKNqf
 0aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783937823; x=1784542623;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/nbOlOJ8IGlEjqeujQrvz7Y18z1id+1QTtzIe7MkwAU=;
 b=ZJtfBU7lnDPtBe1lUWC3Z+EKicPIvlHtJGaVcV4hTEHoqR05liizJGakOolPDNbquy
 Cfmb5Dd75YgM8Y8bW8n9hzJOYARfWrfJKEspPxZ8kbSa/NnopC/OqCTdFx7ncWvsBbFr
 kV8DRIowaztbvLDepsslDbt18Ai4elfUrFul26m9wlFmSnl/vei05/iUMFMxXbE65uqe
 AJQit06wL2mzfiVzP4IP4lTiO0vBogq3h66gkKD8emm8GDqunyfDMvhBXZNK+0FypImY
 qX2uabu7j9+AGiz1r7pVlAhJIk7XVrxur2eDuYk5xQ8DLaMfl4NrcHrwcqAftUPUEzGK
 sBwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSWxSnfdMaBkwKoFEnu5MoG0XFOIGtMWae8ZE//4+XINp+V4+9do9epQ0vL4h7TIQ+60KCigZaEYVn4V0=@nongnu.org
X-Gm-Message-State: AOJu0YyQxot3yVqIe6YPp2XHKlxA7yhievseF4DTaikQViVFT79eX5e7
 lI3CIaTmhjvykTfZEJQnN3+rJhw0WtSuDbKwUTbjt7egzsI/lsdRS2l03vFq+iG4RDaUTPw7S5d
 P8ei9dcdujdt/EMZFJnoJhiqDv/m3DaCptLoq5YIEww==
X-Gm-Gg: AfdE7cnEqP2OC5U/4taq5WUeyFtnYj9Ayj7STdfo+RfgULbjY8WZsD1yKx7f8zMBo7c
 l6hRpKoZo3QNFpAo2oywM3BcZjQYQNlBm7SMgn09WclGEITNNshbB4V+2oyEaxwP7P7fqCMC+lc
 WspCsADb2NOBVVZYLRXvorqPVwNWZPPkKU1fo8iFxPn+dKcL7UGRCZMn3vX5ar/FAKyfKIFd7Ji
 kvgQERrp3FfMP9W58t/pmW0YHggLJ+HFwvCCW63DYB1LUbEyzbcfXls0Jv2hXThxf29wz6B8lLB
 OHDGCmEJkV/PYMz5aWEcytqSc5SAnCiS1rjByzr4M7T31l4BkvAtMSzy
X-Received: by 2002:a05:690e:1514:b0:664:f064:f668 with SMTP id
 956f58d0204a3-667d7aec6e7mr4749443d50.20.1783937822756; Mon, 13 Jul 2026
 03:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-3-thuth@redhat.com>
In-Reply-To: <20260713100508.123623-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 11:16:51 +0100
X-Gm-Features: AVVi8CfNLqzHzF41g8i5mpL1jzQOEecWrd9jN076uUF8LUHD55cJ9_5DcWXzAMU
Message-ID: <CAFEAcA-n-9YVVRr2G3wP0a7sp6arZS4Vmqt35TJY40iGM=DCSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/usb/hcd-xhci: Remove the FIXME macro
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The FIXME macro is only used in one case, which should hopefully
> never trigger: The containing function handles all the USB_RET_*
> values except for USB_RET_ADD_TO_QUEUE and USB_RET_REMOVE_FROM_QUEUE,
> which are both internal return values for when an async packet needs
> to be queued or dequeued, and which shouldn't still be the status by
> the time we get to this function. Thus let's simplify this spot
> and use a g_assert_not_reached() instead.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Not sure if some compilers/analyzers would complain about the
DPRINTF followed by g_assert_not_reached().

thanks
-- PMM

