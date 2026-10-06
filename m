Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB1CA5FF1
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Oct 2026 08:46:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xEND3-0001to-7n; Wed, 07 Oct 2026 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIkD-0006rC-3x
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2026 23:55:10 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEIk6-0003GQ-Ha
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2026 23:55:02 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6cfed5dd071so918244eaf.0
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2026 20:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791345293; cv=none;
 d=google.com; s=arc-20260327;
 b=bh/NrNI9cqvzG8f7yM/JCn2vsRCVcBb8bVSXb1X5vV5JZ8wUR1SGfTDlHZONebBFvE
 9ukLQ67mGEJQ7/hludKxd3I1GFiWzDO/7bpsjw8t2gIsx9QnRDrShMBF7NFsBTqLrVKf
 AzGA4+YUdV6MnXL/SjzeRzKzmDwMUMlQwNSr4+8jaE+NL1Kck8ZACC050AItyoqGY6Xe
 S4/2y9HwR1bZCttGkvaS/T7C1q2rmRM40R190QZg9/KUSdZHk6WSFbXcy9Tk955zsi+2
 xIZj59OMwj8PRj0E5OEvCxe1lEFLX/UHZbePrsQ3m9Y7/M2Z1EwQDA17HQnU+b/Zgp2c
 AQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4+Kbw5l1QvEF9nvw7bEAgKI4dhIQ3CcnfTo1SxWTlDU=;
 fh=oYSWI1XwX+YtYImzL1Y2e/6x5zQVySYxmDl6K+nWFVI=;
 b=RgorCWZjFbNX+av9a2lxGmp2G2M0bK8mvjPeI+8gnUFx0dV6T61h+Ktt3KAVyalAKD
 1odre4EiSVPUAK33rkZXnc5O7cTMzV9N2wuRv1TrvmGMiXaIzEzSRGYT2wXg1bB+EmBX
 fJxnVaJMNDbwEkFMnKR7o8H/LhObGEQ6TXbCKrqNUv1H9STKF0GPr16V1E+TjSb6A5tn
 z/17R9e3OGzn7XPKDrpYE/SuKSWc+APwehSbnpp8WJ2QQ8qamrha4BD7sB6eTHMWVrq+
 5wQNzFKMWack/uPSYqsA4haajko8bf0jkIaOtAAKHj6GkuxkB/i3NO9lMNEb9sxoriJQ
 pEnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791345293; x=1791950093; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4+Kbw5l1QvEF9nvw7bEAgKI4dhIQ3CcnfTo1SxWTlDU=;
 b=c5b99huLd/2RLZC4V8mKCpUreRBj4a+zSPyr3lxYCqQO2ts+KPDlzh0VMBOPBjgW8r
 g4wDyXpnkCj17kYtprfkxEOu3Ro6EmvJi9CnLUaFwPxR/2hiWfLJkaycSX9/pNAh5JWV
 BTen9KuPmZcSLqam5YQPHuDBdcNa7l+zO3hg05R2X7X0zEUbj8C2NlW9Ex7fGJqM4p5e
 0Nb1lYZRzw/rTrHGrCycoEQOxRXjkrnco/CYGoAXDqCMFqi3nbwBBJ0u2K4E3LTl5ZSF
 64ucRfEPhcZftHNWkn/yolfmlekuJn/Sxb/hB3U/ntoeS0aP1he34048VbsbCyF8QsYm
 OxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791345293; x=1791950093;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4+Kbw5l1QvEF9nvw7bEAgKI4dhIQ3CcnfTo1SxWTlDU=;
 b=TZEVUKcY0zGf4Ruj6aHG0UH6zW1jdp2iUAAstn1/lVGvf3EE9jDczjukMJ0pS1hfgw
 HvdDBnPxhdFEd7mWUh82Nl4/nWTTAp6PmmghnLCaDf6dDUuxR5HYIVZ59Ecjk/q/ayNz
 hNwRsTOo7T9SU/CAnPJV25K/8vQRigt+SoIVUEwYFQb/z1UGzs9J0KR3c84SdOTn+X54
 4xvInsTg7DVaUVrILEY1MYJFuhOnL6fakz8PxA/JMijQcisIfxuEd8mVfTCImA2XlaVx
 hvRvtipgwNyEEqji8W2bRudWNLJSSPHsCorgNy9V4SqPniSDqHekukfnG/9McKGP0vAN
 6T7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcGMdbtYcYzNaSpCn+erCZ6ku9n6IIERw+80Akd7FM+WfHSI8UZ+2UbaMXqiU2giBCaMXdrdl2V5Ojing=@nongnu.org
X-Gm-Message-State: AFuF++lnx8MFdPa97fAbuAy8P9C7mhJwNjP8tJ+mDIWzFLoI8ZsK2jen
 Q5iqmrlpByPIKOcWOJy98J+RxkI8ATLEWpDLysl0AtgtN+KgZ9wMmDVKGUWEtJ9ac5YxHgCs2hQ
 1m4ZZvk5idoitigg16IrDBFFDLv9zLub0iutIMr2wAh6mP5YdOr2ayyB9Eg==
X-Gm-Gg: AYBFou2z2t4IAbYHTUI6a8ftZ02NyqxI5L+98DFn9VQgzyVSXFmMoMSflUtHaR9NA25
 YQgppzQhqU9qoMzKssWRONExt5OasDbTOZXajgcVBypeK58lxxi9jG8zAG5bcYAAtG47Z0seTfw
 u5O16ScaETivU7oN4UTBI99Zzim57p52c2iIXwHeTyE5qelWvc80kJ4JAdWs0dpFmKdYcVRkEsF
 +7E5JbZfgS139zIMNS5l54m1Ju96MFunN2MsTuiE2y61TAb8LCkajsCeLrfBPMufAwnWSCENl/u
 Ny9tlpnH4My2b1CUIsqtlm65QqnYU9jn2Q9m5Jh7FtYvhB53DLDhDCTlgl02SUhfWkd9yxJ65Mp
 pWCd+ZjPQUtxcnSCU4dXe3M68sGW/9mnHsqB1Mudy
X-Received: by 2002:a05:690c:e650:20b0:8a8:6fac:21af with SMTP id
 00721157ae682-8b04f43b92emr2467587b3.12.1791277589848; Tue, 06 Oct 2026
 02:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
In-Reply-To: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 10:06:18 +0100
X-Gm-Features: AclHuK99Djp35ASDUw3LzRuQ6eR_upCRkvgtxgzmLLmztnNWFp2XYPp_Mj3GsGM
Message-ID: <CAFEAcA_pVpXW+8g1tTY0dyJdXXzffO7sn0gqMZMBsc+SgbPu4Q@mail.gmail.com>
Subject: Re: [PATCH] hw/display/apple: Fix obsolete PGDevice function
To: Yundi Xu <yundi.eric.xu@gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 qemu-trivial@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

On Mon, 5 Oct 2026 at 22:52, Yundi Xu <yundi.eric.xu@gmail.com> wrote:
>
> PGNewDeviceWithDescriptor is obsolete. Replace with
> PGCreateDeviceWIthDescriptor.
>
> Signed-off-by: Yundi Xu<yundi.eric.xu@gmail.com>
> ---
>   hw/display/apple-gfx.m | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)

There's a somewhat more comprehensive set of changes to this
device that include something like this one already on the list:

https://patchew.org/QEMU/20260916100021.73825-1-mohamed@unpredictable.fr/20260916100021.73825-6-mohamed@unpredictable.fr/

thanks
-- PMM

