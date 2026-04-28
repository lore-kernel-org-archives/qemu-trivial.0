Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE5FF885D
	for <qemu-trivial@archiver.kernel.org>; Tue, 28 Apr 2026 09:47:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHf1R-00012k-IK; Tue, 28 Apr 2026 05:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf1P-00011s-Gr
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 05:46:27 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf1N-0004dw-Af
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 05:46:27 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-79db5e18ac6so129735397b3.1
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 02:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369584; cv=none;
 d=google.com; s=arc-20240605;
 b=OYyEHsAFVd5Af1B8uy0gUraXZZG+Gmf8RnatgAnukSj//hcRql2LD+o1YntQcIEFVT
 u6e9kPHf7jFnOWQPlfAlHg+Ww8EO4mbHbRmbwbt4MmB2Kw1nYKgOKzP7y1DthwQFuJo4
 FrdsI1p85/xDIOKaDPrQiJSH9u6+8UcFgpQFBE2fbJPiowMaRKF6sBVXJExksD6ewrbq
 hbbhdBPcCAtsyX0su5ecjMVCKBOu1E/3qsFSiAqKd3qkPvO06kLP4jfbXHL2vOaozzAm
 j8Dntfr//pDG3fbNhRgwwwRhfkE+sY6lnwy8dijeDSUnojCsUzmFu8A5XHHkBWK6Gt+v
 DW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 fh=D8T84Kwn6AXwm5XOesq+5WX6oZ93xR2vaWeC70ZOYEw=;
 b=Sq4coKSmNs6cUQgj3hjskDvXeYGGqDlVqEeRXb4ygSTBZ3DCVRwxNs7cb/9jbVZDNg
 Rfm3ZSO3USEPk3sSDDPwHoZZubbXLk1/WB8eLpwVlZ60tdjWV/rcZLUNP4U5LB/EPLEH
 Knmlh97JCnrE6Ax0BA0QIwZFUk2DqZNC3ux5r3LzeaYAj7Y++Af53PRwdJgR3kkTFzG4
 nCG5jXfsjvAhfvCczxyYXMqEad0cdfGjITysd7m7b+teCFsEcy7MXgKrroNtflsB8Mrx
 8MbOsTKMUne2BWMQ/puzcEuixrvPLPg/UQPDFZRkaMl7XRSKn459hnQhT+/A+rPdhe5b
 TjrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777369584; x=1777974384; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 b=PDxo7T4ZvJ1I1d8yg9i/oswde+NIVjkqjGiF5zorI4hY3IF7b9aYwIZM8Eqy8QgDFQ
 Cm4xTxdC0ShflmDEI3rn0ykqGooYZUCeAya/5NXdFBASbTqRqNiGbXX0i6at6hxXSh+B
 DhWhcKU5KShE1sV6I3XzZxYe1XWvVVko9TR/5M7kzBzKP91kXDVtR+tVeXSO9saW+uYB
 OxOj8xup25/Wm4ft4ga41jmn6CFOV3Lbmy02INdXNDNorbt00hjHxyE7UCsQWz8j0nQ9
 BbBr9O8JKLn4UiPHQbKs6UlAYsUPQbW6WjB/NlDQYB9EFjYNpVigteXNDVlPUzYkWoZA
 /PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777369584; x=1777974384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnOTyoBONZL5lUhxgLh9D6qE6LWii5d0WK1ENz5fK6w=;
 b=c6V08C+rBwQQMOsF4R7vxd0erh5W7xFtSVLaDsVfTZLFYPmmNMIU0l6cHpxiJLBJOg
 SOVA3bWkxwi+JWITJd+Xt30GE1PEp+MlZjv9OIjR+nycQt7aZvDV0j1vJy++8uPRkN6Q
 TpdGNh6Nf+5+15yF6fKSO0CMmLrsu895QveNBFJRFlhQc9Y3Zj6PS6upaSJpABU5K268
 sS4tBqpfMQFWuG0yw6Q3rz9MuSo7Z0RhVfFbtJs0bk+CPFtGiTK32LAGzFK4yrxMylUZ
 obkoMl0TBZAnI5vB1g0bF27w9CB+U5LRih9xpUMaNOm0roflYIFiqGTZi8muZRv66rcp
 iLmQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ84oMDv07ejszIY/ZyTmL+YcYbeDb/xpKcDktZN25Y4MjbMZP9i0KcWgHrh3GuwzhB6OdKph1sRpwJutfs=@nongnu.org
X-Gm-Message-State: AOJu0YwE6yzJRPMdhk2/2Fr2kn1+WNt3I8Lz2R1HzqIoNYCWVWROFW4/
 OUvFTqO+zXkaltoQcwkAqE6PwXBxB8bVbm2dEpwdp2PYvL9bIINSIrlfc8c/YXd7yl+PKaJpo/W
 qKAyG1jsyP/oWps3vhxDU1VffJrByJ3gz8wTsfJSmyA==
X-Gm-Gg: AeBDiesIQpyXFMZV1uzpu7tH2hV8GRG1MWWKKHQ6INiAbogQB7GbU9xtQ7kuPfDHvCE
 JZZejOvNls+SmEIqlbnx2iubLcMyVGwMJQygVJ4VCfyZyuRh8FK9duNQzh0TpivfmEYL7ShOC34
 YHBzBysEBjGra5ZreeJm02rx/+DckA9ukhpf6pBiownvWzMKFvoTri8Bzq11yzB1UHd0N2DqtEb
 /eRuiALyF5jvF/rbTOAdh8lrZPH0tslwUfhpQJ9BuT88oSjXLQaw6DI9laLQKL1QJVz7ZgQpVzT
 KwAlGfYHBtWcAft5yN/v0XfOqzzI0Pf3FG83s1MP6efxbzopkqVeX6SsrbCKT06RspxYH2X18gN
 m6A==
X-Received: by 2002:a05:690e:b89:b0:654:99fd:4a1e with SMTP id
 956f58d0204a3-65bee6e075bmr1723676d50.5.1777369583702; Tue, 28 Apr 2026
 02:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-2-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 10:46:11 +0100
X-Gm-Features: AVHnY4Lp4-tZHtm8EalkPK5wy_ymIxgoTBUzDEEHaaA0m03tg5Dofjowu1o-E5U
Message-ID: <CAFEAcA_o9_j05GmXT79TF2z_BqwxmTWeqaaapUOv+E4=P-hh-Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm/fsl-imx8mp: Do not create redundant
 unimplemented devices
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The GPT devices are implemented. No need to create redundant
> unimplemented devices.
>
> Fixes: f8b26121762c ("hw/arm/fsl-imx8mp: Implement general purpose
> timers")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

