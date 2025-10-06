Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AC3CAC5B8
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Oct 2025 10:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v5if7-0004oU-Kb; Mon, 06 Oct 2025 06:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5if3-0004mw-3p
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 06:41:46 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5iew-0001XZ-Oc
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 06:41:44 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d60528734so52538097b3.2
 for <qemu-trivial@nongnu.org>; Mon, 06 Oct 2025 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759747297; x=1760352097; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vwrQcCJGIbsxvMRi/b1fe24qLHYm9LI3TINLoCmsLMc=;
 b=t4bQSWbS/xP4RpK/V46JyDHY8X0mBi3sdXeeWn0SSwva/1lAKHBD9DCu5JMYgzQXR0
 q/i6+NQMv9sRY9aT9ytP8DhjeT3DiZApEwfV7nJqpB3SbkKDqkp6D534QSksDjBIg6Hq
 LXjh5Gey8b/8smZJi+s86+A5xqrgQsgf3XV4QWkEOMfH2o7BzL/Lq/bmVWBbxUl6XIw2
 IbutdHa2AOiqZEjVdYzcTkXgeDgM4Z0ib/gqrqXlyp6wfp02pxW7+MDdKZ7U3H3Fuowf
 oYWCwj+DArrWE8waChFk17zJACh7TpAT56vu814WPwGxb6KMuP15BvBsD5dSqfKULNKM
 4u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747297; x=1760352097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwrQcCJGIbsxvMRi/b1fe24qLHYm9LI3TINLoCmsLMc=;
 b=csDTv1lHmuY2+VOt01MzM4EhR8u0OpfKSc4xqPKLeYlt502fvHpS5EJ0o1Ltjj+TgL
 zUZwp/S8q7Bjfn8jGroxclwBSJqSEXEI9b/HTF5ynZJ/6I/YmV29ea50yKjO1dcmJbfK
 yAaTL37J7HpUCh1eDc6aJRVVE2Zvc67gbAkXADXMRvxuz8PYp1EFLMGLpnqRSP+03p7y
 ubSN9LVaiUPotCjrxHMkLZ206x+IN7giMIXj9P63Np3SF1Y0I+Cza+d1zZhD1F6/GYbs
 HeTNPH/Li8XjfsFr9BtgzBo+oDS8g/DtOM/64z36SeamK/ww1chQ7IIglHFeLz4zEc0w
 4fDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtHKFvfgVoHukKFpqFxs13IPOTEoYgmQo9Mv9kwLpmSoofqd/kJwE/mtJsY1mJPcdqya/jjoJilwqSdZU=@nongnu.org
X-Gm-Message-State: AOJu0Yx+VTPcFG3xqJLWavrYD2Yx0/n36Ivcv82C5r9635j9O/yblUoB
 fbh0H3hiCNrjxpuauE67im4d2UiK6wkicxfpicX7rRGcuxJMtJTt6fAPQiqd9EtM8xnrXvSpcwx
 l997EIdRPGGjDoG1JiHRzlsJleXSSlM1N1KMeymC4/ElYNZCP/okB
X-Gm-Gg: ASbGncu84fJwL4Ou71KclpfsJgXL9S6kIegg/cQxqzaBTqqAQ5EJQSdhxqy6J+imNdA
 MX3EewaCYUdUGHYvk2iYKZ3s8QkGWZG0h8FJv0Fsumd0C+zkQbiV+qPjIx7f59cfzCSNT1rZ75P
 NUDJ88+Q3FgCPqyNRajf3Ko8pOgM+P7vxLR6iTcoTsjUAAOnvgzZujk/BXHh2vzmtmsdVuKoH4s
 txIccL7fgDoGHLCTCuAY6Hnz591DATXnuq+uAoNXk2GKuo=
X-Google-Smtp-Source: AGHT+IHMERTFx5EYN3CVOYqNP9Lw1HGa0Td0sIWgKn2ytuLOFeid3ejTjZUf5dSxY8/3eAbvuV97bsLfFKiYQrnFcHI=
X-Received: by 2002:a05:690e:686:b0:636:1bb3:2d2d with SMTP id
 956f58d0204a3-63b9a07fdf7mr8736537d50.22.1759747297216; Mon, 06 Oct 2025
 03:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
In-Reply-To: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Oct 2025 11:41:25 +0100
X-Gm-Features: AS18NWB7RZ1o_mn8Z-KGl28zNr88Ka_Hgag4hcQFKeBpYzqAoYX_71A_p7MS-eQ
Message-ID: <CAFEAcA_PbfzTAW2qeFao1MhPG=jn9dtzt0AzwL-aPCEULijsuw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
To: Alexander Gryanko <xpahos@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
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

On Sat, 4 Oct 2025 at 21:19, Alexander Gryanko <xpahos@gmail.com> wrote:
>
> Currently, pvpanic is available in three device types: ISA,
> MMIO, and PCI. For early stages of system initialisation
> before PCI enumeration, only ISA and MMIO are suitable.
> ISA is specific to the x86 platform; only MMIO devices
> can be used for ARM. It is not possible to specify a
> device as on the x86 platform (-device pvpanic); the
> only possible way is to add an MMIO device to the dtb,
> which can be implemented by manually adding new functions
> to the QEMU code, as was done in the VMApple implementation.

No, thank you. I don't want to add more devices to "virt"
than we have to. There is a PCI pvpanic device -- use
that. Yes, you might have to do PCI enumeration in software.

thanks
-- PMM

