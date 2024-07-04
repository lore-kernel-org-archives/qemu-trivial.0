Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPIse-0001r8-W0
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2024 05:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIsc-0001pL-PF
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:35:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIsX-00036z-Px
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:35:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso596603a12.0
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2024 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720085748; x=1720690548; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U03veFQenI/Utth8gnAPVCdRcWiHwgvsqN6ytuwipU0=;
 b=vAbGfGebxKLLthr8qzX+fXXDdXI5ZjHzvzhIh8LR9YOn3X2S2Axx9hwSSRbcdILjDe
 QaQJyrG4XIvOlQCgBd2s2Fff1/1MOJi2D2g1XQt9iGiHdbuO7ngpbznQ2jMyRdUC4B4C
 +Kt2ya66bY9yPYb5y6pt4RkuAG43E2uh2wchSR3ZI5SOanoVSovUSM5DpCnj1HCTbAA9
 +38KoysyscVyA/1Ttd1AQQJZXdiLp0KoFjh9zFWXFQ4ZZk0WXfP7H0ds39HqktA8/HNY
 0ij3yNbjI52c1++46D/lzUDIBTebIGL6SIinP6/0PlNN/loLSv7GS/k3ps5B45KmQVIv
 QxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720085748; x=1720690548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U03veFQenI/Utth8gnAPVCdRcWiHwgvsqN6ytuwipU0=;
 b=XTnhiza7k6m1Z2QV2upCQqlrkerpqynb6EaesJ4n/aMnQIlhb28iXgD3HXJ+cD1f9X
 +c7S7T/1Ddj6UpCj6JsuaNLI3zZWl3+0lzRFOTJSXC9XiRF3zTk9IHRBmnkvHyzWyRA8
 Ns+TKB/7N0LKiwYG1rVef4/1wyc8XACmcAchWK1AZwh866ipvZUjAMJWJ8fR3o86GiQQ
 0JKZ4enPhUkHFsudYyEUfYGr6vdo0TntSi/I/RRciaa0YVImrlPp61qrLKJ3DeUshcWu
 DE9YzYgmno9j+prnkHTa4VEsGNZ8VIAaPLYB9gHaogDExZSfWudmBIftcud0ulTBNqrB
 /7ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr3cD9bJrqAaTcgaPkmM97iV+HuPZW/CGp4jlPo3DtUhsDTSLjijqowfvqWnyTlOI67aCMu8qI0VGyzu2+zE1zNcS2jQAuUA==
X-Gm-Message-State: AOJu0Yzl6LxWZvmSHQ4bi+uEDV+Vr1a7b5YkOvyY9pxiSyAcZrmSKwrk
 /wc+Pa2R0Fh6unJszGy4sMnyejBwNIV79NPVdduO36zfrgl6ofNzRNQIQ2VXpnXVPcobPcUnock
 pu8Vh2nJmECF2MF9eBxg7D6tocvhsoOAy1LJ0cQ==
X-Google-Smtp-Source: AGHT+IHiDLwFohbLMfdykNOns5eO0chkk+sAjL47R3R0AibStB3FYkrUSI23NG5RIx3kTVScr/rG5M/m69WmYpn0WOs=
X-Received: by 2002:a05:6402:11d0:b0:57c:5ec6:1466 with SMTP id
 4fb4d7f45d1cf-58e5b2b0643mr913509a12.25.1720085748120; Thu, 04 Jul 2024
 02:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240704084759.1824420-1-zhao1.liu@intel.com>
 <20240704084759.1824420-4-zhao1.liu@intel.com>
In-Reply-To: <20240704084759.1824420-4-zhao1.liu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 10:35:36 +0100
Message-ID: <CAFEAcA8BAwjLo_4M_U6ucbM9at9ko28mXJPq7yEByjG1fr3o=A@mail.gmail.com>
Subject: Re: [PATCH 3/4] util/oslib-posix: Fix superfluous trailing semicolon
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 Jul 2024 09:35:55 -0000

On Thu, 4 Jul 2024 at 09:33, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  util/oslib-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index e76441695bdc..b090fe0eed0d 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -263,7 +263,7 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2])
>          return ret;
>      }
>  #endif
> -    ret = socketpair(domain, type, protocol, sv);;
> +    ret = socketpair(domain, type, protocol, sv);
>      if (ret == 0) {
>          qemu_set_cloexec(sv[0]);
>          qemu_set_cloexec(sv[1]);
> --
> 2.34.1
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

