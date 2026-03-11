Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E814C104C007
	for <qemu-trivial@archiver.kernel.org>; Wed, 11 Mar 2026 10:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w0HAT-0003vp-DO; Wed, 11 Mar 2026 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0HAQ-0003tM-EW
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2026 06:51:55 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0HAO-0001uZ-Lx
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2026 06:51:54 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ad79dfb7cso13883908d50.2
 for <qemu-trivial@nongnu.org>; Wed, 11 Mar 2026 03:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773226311; cv=none;
 d=google.com; s=arc-20240605;
 b=E0tzxzXewmli8arX4er/sIw75kMWRoiREbxZnRo3R5+LSzC3uWarL5dNywzM8/oa/2
 zbsH9/LUJOQqyAFCze/IEN0OHC8GM9Zj0/QCTwZEhapalE/uJwoASLHZ9NnL5txXc8i7
 Lh+KRWoU8vfvMXtb8sfd0VO2rY4MPHInl58frmPuz8+MSbFmPoXG7eR+mSyK4Ab7BZCq
 EiEcmHH4Wzd2FNH0mlr/7Cu8y6lV1DYePy5zcoEjZp3tBiG3hn+9Jf/XJCokX8kKoR+1
 BUKz7YTlP61fWfrKVwYMCNW/cwCvrN7x70BA8JhTyvmozS1XXCYZ8mtEDMJOvDH4t7ZK
 CXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r2BmujFvbpBnkCWDoORslb/gLaWOUVnxTOF7Widx+5A=;
 fh=wu7fr7ANmPQlAMqdHvxOt8KSl8AOZzOcnxs0c+eG2ag=;
 b=h6R7CFcY9h9bvsPb44oBwN+7p0hjRFiCjfwYjuu1JnE3sQXFOabxr/fS2J5pvgfrWy
 ICsqXGHEyZOdg2cFxXXv57V69k8IX0yFhsci5iL0NrPbq5zFCmCPDIfm5fePPLvHEq62
 YT63HCho0I8ktm+1SUJzVWHnrLB7K5t9C7Kik/ElMjP6XC+CEMelBlqognAcektX0FKm
 I5om1bsjvN0alVahtZnRJhX50tBoBymmn80VUWZfM5f0nEM6v9WW7m6BjQ7IS0T3NNNH
 k/fH5Xl3j94ExenAcAjOv320TdCpQ9rA9ZZWDfvVm8/eTPeVyt9rchGApb40g/cNM6Jy
 5ljQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773226311; x=1773831111; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r2BmujFvbpBnkCWDoORslb/gLaWOUVnxTOF7Widx+5A=;
 b=kr34RkdwGj6tlDFZ1JR+VfVovO/cxQg32Gx7fa9ZjFSx837njevrUVKvrQcpsM8Fyp
 W8Lv6HoY8j5vXVHunkRjUrwGtyZGEYGeW4bapmrZ+bZVM6x18BJRnTjgwSgGg/fXcPGM
 svG+KdZKLDZhnJKsBvl8BjITovY94LeDwI65RXyXn32sEWNHoEm/j6a2PBR+ZWcvo7+B
 iq80KmfGERUcxTPl2617pkQ0fClBJ3OIE5ThESZujtCeaLMJKWv8kRD/s2MNLK5Bbaze
 wuXTKynGKHQL2HKs9WbcrmrytvqQ9ZIsJoqbb7myP4dX+aQ0M7cmMoLPzVKmqZeqLtrz
 yf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773226311; x=1773831111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2BmujFvbpBnkCWDoORslb/gLaWOUVnxTOF7Widx+5A=;
 b=ZpBueY11gVAJ+Ty6UbKv77mc12FFX+UhxgyHWZFPccp9IbvwtW1qWXST4Ppdl8u0N7
 S2+NL1Lb7OjtpW+i5i1d1GymH9Hk0+XCkok2UPjkcrxZPZ48Pz0Nif4qd0n7iYulL402
 jLa5HBGJtSBXYbe8Qky+sp++Nzw7rzqPShIHv55E9BD9XUEoURWDfkABEkTfeaeP81p/
 +WFLi7sGOkOWQiPwQA/eA31bpQIPgIb1D9UOOKMxWJcrBLDd84c1EsCDX5lEf4W6nxhI
 U5CbTOiFffOn2fEWyoCelm24P59emdg7LJU4fKgyTrjWSu4DAaeiuGxGOKUAQitvFVPf
 yIng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6JGJwTXw1qPHzSfRYckDnFnZG6gjC4NeNetDgTW+uq7CefpUefRuir5Uj/ks7NCv+zeeHZ9WhgupxckY=@nongnu.org
X-Gm-Message-State: AOJu0Yx4Q1UJWhk9UnvK8cBQZyx0EgFY3zHBBpd+LHes9vEvZb5yRV1f
 DkU6zjOlzuRzwObtYiptX1SCzvU6htMUBt77n3klKjr2kZ+pGs+S6csNGxcHPqky7bRyW0wDhGR
 dSqqhsWMD5lY/GjzKEgpeXikHrP7cd5+AG9lwFWWxKw==
X-Gm-Gg: ATEYQzzNO7+oli/SB4Y4UOzU5TO3qmkdsgtpqJ9h+6nyM89NDEmaVrvtdUQ4O70Ik8a
 mgiH3/Kr/dBUH03/3N8oDPxaILTCZ7TmGmY+4cUct7pXEpWd6fA7hkvKh2oNj8gBKne+x1c+bZY
 1GEYghVMdkSSmm7yyculASrHC1cVcpqap9XJHw0OjtYECSaa8z9WEvv0X78oG5NIIkoaHkPHTRT
 wEsnDuIbR9b974GVc3dG3arTdJOqF44UeGR199aWtSp5dqkFeIpGoYlT8TmC+5zorDfth0cDJBO
 MN7/VISmCsxpAMjsn/6aJv0ss6jcWaq6DuBgJlbk0BV1fdNI1ULYLaZzX06ul77vfGI=
X-Received: by 2002:a53:ee59:0:b0:64c:2128:c34c with SMTP id
 956f58d0204a3-64d657e7fd3mr1321008d50.59.1773226311377; Wed, 11 Mar 2026
 03:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260208103958.121455-1-heifetz@yandex-team.com>
 <20260208103958.121455-4-heifetz@yandex-team.com>
In-Reply-To: <20260208103958.121455-4-heifetz@yandex-team.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2026 10:51:40 +0000
X-Gm-Features: AaiRm53_cDqTDSMBq8d5_d5JelSmhzhDcLK4dmH3PkSHqTIBtlmwnf5N1-SEBlw
Message-ID: <CAFEAcA92MKa1Q1xwamjsFja=-V5ag-JH4kM8xTFiu07RDCBbTQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] system/physmem.c: remove useless assertion of block
To: Sergei Heifetz <heifetz@yandex-team.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Sun, 8 Feb 2026 at 10:41, Sergei Heifetz <heifetz@yandex-team.com> wrote:
>
> It is useless to assert that block is not NULL because
> it is already dereferenced in the first line of the function.
>
> We could split the declaration and initialization of oldsize,
> but then we would need to remove the const qualifier.
> This seems worse, as the assertion would be almost useless anyway.
>
> Signed-off-by: Sergei Heifetz <heifetz@yandex-team.com>

The commit message fails to note the information found during
review of the previous version:
 * this function is called from only two places
 * those places already either assert or assume that the
   block argument is not NULL
So the assertion is not getting us anything.

With the commit message updated:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

