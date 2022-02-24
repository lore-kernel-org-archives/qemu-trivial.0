Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nNDVv-0000if-Hd
	for mharc-qemu-trivial@gnu.org; Thu, 24 Feb 2022 07:46:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDVs-0000eR-OQ
 for qemu-trivial@nongnu.org; Thu, 24 Feb 2022 07:46:29 -0500
Received: from [2607:f8b0:4864:20::b35] (port=42905
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDVl-0000XZ-UT
 for qemu-trivial@nongnu.org; Thu, 24 Feb 2022 07:46:23 -0500
Received: by mail-yb1-xb35.google.com with SMTP id e140so3516811ybh.9
 for <qemu-trivial@nongnu.org>; Thu, 24 Feb 2022 04:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRvqrjX4ZRWm4mUgejKatfS+fFK/f3WxgZediqF9/jA=;
 b=OV6rMx9sCTnqMBhLIdtI2R18yJV8d7hu2gIfNDqa7CZ+PAxuvj2Whs7LsAsmfIgNg0
 Zs0sYG8dehW4jJpr1eEacBD8j0senUFkK2gcvDVwqctudThXIYaqEegfR3ZqXP1B+wFk
 5VCjgrFKHHsAqGcvtLuUccRkyziWx3ldIovPGwunG5g5oMjxeh8RVcQrs/IJWDxnYboc
 1vcNa0ACAg7iHkLUNGqz5oy/Nga2sEAVdhdGsMPf9gwztlCfvvbe5GnM2B5brwUdiafH
 0j5nocV/bMiSVWtMEcAjTOB471u2XNVx9DwqHCpIqRcXZMxPHNEU44hc1HlspsXIHvUu
 6vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRvqrjX4ZRWm4mUgejKatfS+fFK/f3WxgZediqF9/jA=;
 b=SSWOkqKLxaWAoIa9+cvI1Ai+9BFCjrCBm3CskZROSRyMGjP/DtLcMJvSE+DLv04VBO
 1WXxWb5Px/KqtekBRh89mUBC2xWOrXATXdfiz/FUoWUZsFG/mztbcVNHqhbVQBbnuZsw
 yinqoGD3wsZwkciuGt3+rLTcF8sq7O/+9a26m7DxIub5q14yXPddP3zuc6+8cmruIXJT
 qjVUayeKEy40HENBHyFfvkpmUpg7FIf/04szjXNndzY1eikRgXTuNgMcK/+zGtOw+BFB
 gfSqcXbhdAp1D1jxubOw7LkeYeETjII3HOYzV6iqXde9seodY+ZNPnklcNcqircSnO82
 WGbg==
X-Gm-Message-State: AOAM533lGYu4NWcanTmf4MzVawqasCrEmFKL3YLf8lp6DlGRTQBbl/lH
 XvRQXFxTudsx4spMjb8mqCTDyqO+Z3B6GHhLaeEoqQ==
X-Google-Smtp-Source: ABdhPJwJ/R4TOEOfOyKi1a0cGIs/oBPcWH6rDoXyNnLDDFyIXDFk73rJP2bnzW0HEUMXDlKlqvbZqEtJJU5osteTCxw=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr2223776ybe.67.1645706779496; Thu, 24
 Feb 2022 04:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
In-Reply-To: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 12:46:08 +0000
Message-ID: <CAFEAcA8zKcZ7=gRmKX0fygpdmYfEf-HEodfH+SXwS_fT+rt2Ag@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Fix typo in comment
To: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 24 Feb 2022 12:46:30 -0000

On Thu, 24 Feb 2022 at 12:22, Evgeny Ermakov <evgeny.v.ermakov@gmail.com> wrote:
>
> Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 13df002ce4..a08a0fdc50 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -97,7 +97,7 @@ static int nvic_pending_prio(NVICState *s)
>   * this is only different in the obscure corner case where guest
>   * code has manually deactivated an exception and is about
>   * to fail an exception-return integrity check. The definition
> - * above is the one from the v8M ARM ARM and is also in line
> + * above is the one from the v8M ARM and is also in line
>   * with the behaviour documented for the Cortex-M3.
>   */

This is not a typo. The "ARM ARM" (or "Arm ARM" these days if
you want to follow the official corporate name capitalization)
is the standard abbreviated way to refer to the
Arm Architecture Reference Manual. "git grep -i 'arm arm'"
finds over 50 uses of it in various comments.

thanks
-- PMM

