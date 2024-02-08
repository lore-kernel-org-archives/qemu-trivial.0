Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rY6ZF-0007fm-9z
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2024 10:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY6ZD-0007fS-7i
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 10:43:59 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY6ZB-0005An-Lt
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 10:43:58 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56002e7118dso12128a12.0
 for <qemu-trivial@nongnu.org>; Thu, 08 Feb 2024 07:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707407036; x=1708011836; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MIlgp7c3WkYA2b+aebwwSO7bAEXpR0cjF81qe3HfwNM=;
 b=lScd+v9JHkyOfXKKDco17YWSi5tv1lSao2X8K3EbCd0cXSCi9+XZ199i6FM+zkqwtv
 lIDQQ3LCp4aEFQTJzoSX5Zs6TiMYpkN1goehtQzaL6v19ja8EdOy0fBMDXmNDTAfdo+4
 pvVa2FAf+3TblNPcfUeADVdGszYk7ln+GlhY04BWbFTXm3gxPMdMadYYfQ/fRkO8oBST
 hpBKXkjzeDDtrjV8XD8NC3V/9hm0lyS/x0GlI+1122jaXv/piQBTfP6WX15+ooym9Aij
 dbYWGw1s7RvRiU0rd8nG9hRmEbzBz5mVIrMg2LW9bkIVziUPkpjBPEmMgQy7fRVJ11Co
 IFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707407036; x=1708011836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIlgp7c3WkYA2b+aebwwSO7bAEXpR0cjF81qe3HfwNM=;
 b=tpnlzqwnzFFWX42JJXzi3vTzCL4KWiPSwKXwEwdXfFwQT2TG7HbXmL7VnwnKfkvd3i
 Xbx4lhIPZXgVAxGlJRl+824l/WGHG8ZtgDwriHTOAuMTMLrFfAoonbX8wns+KkOkODfT
 s+OSp/gossOOquj3hwhDcPUChnp7eS6RCaxnobcuJa1hjHLLH/soQZvkTKdaOReJ6mwL
 R/rW7GGo5WE32ivcvk9M7xoHLAbOpV9mKgXYljIIZY5w+0MqNPRqe7nDcChxgpa9Hqu0
 naVNJB1Dsgamf4cck/EeYSZxbH9mBdEUHOQWLfWi/NB8YaOJGs/3umZ0jnRq5lNA8WVB
 m0YA==
X-Gm-Message-State: AOJu0YyrH9EZbnhKp96Vis1bDIMVpiYYoy5PLL2JcOTSIyGi+h6FLcD6
 cVAKSKDO9x1WofcqKaRJJA4DGNZokCGsVjWZSv8mzEKJUundxQsX57/kfxYIhna9OKFF4nS/7ZD
 Ter2XpGKcNrpL9KN0BPMel2Rbx5CrR1h1vQDDLA==
X-Google-Smtp-Source: AGHT+IHFjRhFEA5He7aVoEJGB7GsdXZjWKPmBOfWcJwK3AtImygA8cHnlMXWK+LuqLQ4tb2h4C1ksDCIb2gpiW8TxVg=
X-Received: by 2002:aa7:d646:0:b0:560:590:1044 with SMTP id
 v6-20020aa7d646000000b0056005901044mr6655292edr.6.1707407036121; Thu, 08 Feb
 2024 07:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20240208154038.553385-1-mjt@tls.msk.ru>
In-Reply-To: <20240208154038.553385-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 15:43:44 +0000
Message-ID: <CAFEAcA_x1Rhivkk-mGRavYcNi-hgz+xK6bu_V_Q6rThtGev=HQ@mail.gmail.com>
Subject: Re: [PATCH trivial v2] qemu-options.hx: document that tftp=dir is
 readonly
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Feb 2024 15:43:59 -0000

On Thu, 8 Feb 2024 at 15:40, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1286
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: include suggestion by Peter.
>    Not keeping Reviewed-by tags.
>
>  qemu-options.hx | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5adbed1101..e7f07d8ccf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3100,6 +3100,8 @@ SRST
>          server. The files in dir will be exposed as the root of a TFTP
>          server. The TFTP client on the guest must be configured in
>          binary mode (use the command ``bin`` of the Unix TFTP client).
> +        The built-in TFTP server is read-only, it does not implement any

semicolon, not comma.

> +        command for writing files. QEMU will not write to this directory.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

