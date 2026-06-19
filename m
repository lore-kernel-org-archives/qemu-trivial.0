Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3968DCD4F26
	for <qemu-trivial@archiver.kernel.org>; Fri, 19 Jun 2026 13:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1waYwU-0005Ir-Ad; Fri, 19 Jun 2026 09:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYwM-0004wR-8B
 for qemu-trivial@nongnu.org; Fri, 19 Jun 2026 09:07:23 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYwK-0004Ef-BV
 for qemu-trivial@nongnu.org; Fri, 19 Jun 2026 09:07:21 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6603d8697d2so2364874d50.0
 for <qemu-trivial@nongnu.org>; Fri, 19 Jun 2026 06:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874438; cv=none;
 d=google.com; s=arc-20240605;
 b=Jsj1HvKSPeZ3ozxKsjOllWHoTzRSZ50gV1fqI3Z7fPWLPamHV38u3orziATnNGerCX
 SS2Qtajz/yDgRgC8k/1bVc+bihdguonVU1hJwckJ4r1OAmCN/I3vwKz4r7FzNcDehd+W
 mH9fn7S5B/PmT0ISSlMopMLnphXQKK7bR2+OsLecJSnRqMBhf7yka3afwcy+9WD+K8+p
 DRkKZ+5tnmUUdFt1MAAYtUHC1kqqmv/Hj4HVv+O5XHk56GrWHNkkCmQ3+T7JTvePdJJ0
 1Yy/9mfrSWM9uXDeJUR6aIWIoLyTLB7oBWcwV/5X1KdeiGn5QcIwU+qwCDgQ7NGQ1ZF6
 xp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 fh=PoMGtGvOIsgxIvOzIUnHA5jdudCqj1wGRmygAOpLWRo=;
 b=FAO5vRP2ckJLBVCAStM45abxtFsnXShl2nJFfl3VRcQ3sV4j6S3+hUHjFpXiLJRnaP
 dEA7s69tmOsVIfQ4A1nEmlA98Idl+FAcWMXArY8AgdsFhrPN9AOshxX6GFh1hnT+RxOW
 AnSchsxKi5Ob+MqVkmZGO52lUxvzIVcS+pf1mJEZW4zBSHx/Ybqbxq31Wg/Zy//Mb1Cm
 AB2J70K/0l0qo6ZHP+tLMe5GgbXE9sDyKm6LVqLkOPkySJQb7UKGPukQcY4ujDJEqtmb
 kXV0ADNeZ/L6uHDzQPbO/4Gy9YW1RKoKwMDwGGAFmdcLY/R/MOwzRDtAduzKuC9IxAO3
 xQzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874438; x=1782479238; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 b=w0UfmMrSrJrQiszOyJBf7wqn3iHkIk4R2a47eqgumy3FpF5r2AnrSv+HOkzdGCTsGu
 C9i1D+4xplSQTQm1EH5aW2HoWU3MYMSa7hUy1zt4wPdqi1P5xPSnhXEAleXSRyAPTXOj
 Gr109dsikFTfnKsBjcwjidu8GoH9j4HyukThr+WfgTCibJnnf4dtlgs3pJ+xjpK9yr0b
 gIDoNtQ5Cur+CHxXFV6CYrmnjtYqcXg7ITpoIoxMliJYMRshLoDXk9CCHesa1Xc2NitD
 pntjgftJQ9CqEe0aG2DkvfjVU/ZSdLPoU/iRP8Q8GGJ4KGuLWDcDAouXBCOfKRQhyf6L
 Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874438; x=1782479238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rFFKDju4GkbrwpYsMKyIDto5mDULKbew1mWJuXksimI=;
 b=f8XPw1sFE2tLELoRnk1RXgHUXj7cwH4xy4X76b77FiyUMU5guGu+d+9hbocCyI7tPj
 cjWzloQy3R0N8yM6CZk38yubfQFuf7haSRLkVOSdw8b7hWL8xcg9gA7DZpK4p9xiWZdi
 bxEZc4yDDCLK6A7Md6r/CM4YwmeGgrqZo2NG4i1MD3+w6JGsl4VBfr7/6YXS3AxTz0V9
 mSmoWvFOaqY0PcOqu3dHIBmg8lSk13JM89wbSFyMtp0JjpNHcC333dWIC5rlAOffJaeu
 z7Ui3KSZX2wtU1dsPHh0iwEAt6nOofUeabBLhbHgk1b3+kP0BgM3ZZJxmnKu1Wxm3x3Z
 rNUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nO5r6w1lyh8dlCFezv+okAo995zG5nK8jMG+KcO4gIZ1H7wgWqn6lXRJEqPnMpGsYkkd1LjP9kcLLl/k=@nongnu.org
X-Gm-Message-State: AOJu0YydODRCj2TWQLnyWU6JvSZ3stKgUblZ73wR+Zq599b75g0JjYGA
 gW2+0ZcIFMrWHhs5Iirl7VPp4fF7TYbTuOHsWL6qpmhEMduyHVeoNolt7wDaZlNJcDUfjBEao30
 KHvr8tsR+pVu6JYrC5beu5gIOGZXRMSI6jl/hkdroKw==
X-Gm-Gg: AfdE7cme7eTR7yLj9zQAnRLQ0Mvx9FLTepxXAZQNmRVN+LaW21dcXbDp/XvzvvyqmX5
 0jFJd/L7+iBDDxHyxq13v9ywemFFd68p2Bc4qhMS0mDxxvke5ZCNtOSic3hLHmi7sID7aUMbNVr
 57pzX/Kuijc959S4CVVcJmDqfTsQkTGwvDdu0zj8rKxzJr1hG12bTipEp07LRGkO+XsjiY/Y0YI
 Cir9RVBZC07/wwWnBhclrqwAe3HTrfU9lf6x4WCwYUGCFBs0ePI/+wrdVkiUbWOsitd4+olTqF+
 mM423FbliBTTEO2WnuAe31BlDfdO5FM8xMhoYMuFM9UPERErpdg1cMCA
X-Received: by 2002:a05:690e:4410:b0:660:3b18:57ea with SMTP id
 956f58d0204a3-662fc7b2f35mr2523557d50.1.1781874438190; Fri, 19 Jun 2026
 06:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260617161406.14705-1-163wangjack@gmail.com>
In-Reply-To: <20260617161406.14705-1-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:07:07 +0100
X-Gm-Features: AVVi8Cd19gW_Ptqpth0Sf-sYIXQ-4KXjfrcnnDk9wu7Kv-x9w7It7d8g-umcD0o
Message-ID: <CAFEAcA8RGC-1k5B_Ex_YHC+w3sV2hLtWTkimt6dSca_OpXfphQ@mail.gmail.com>
Subject: Re: [PATCH v5] hw/timer/imx_epit: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org, 
 mjt@tls.msk.ru, laurent@vivier.eu, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 17 Jun 2026 at 17:14, jack wang <163wangjack@gmail.com> wrote:
>
> Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
> and DPRINTF macros, replacing them with modern QEMU trace events.
>
> This also removes an empty and meaningless DPRINTF("\n") in the
> imx_epit_realize function.
>
> Signed-off-by: jack wang <163wangjack@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---

Thanks for this patch; I've applied it to target-arm.next, and
it should get into upstream git within a week or so.

-- PMM

