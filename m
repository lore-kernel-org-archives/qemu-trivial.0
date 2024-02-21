Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcqiO-0000yj-Fv
	for mharc-qemu-trivial@gnu.org; Wed, 21 Feb 2024 12:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rcqiM-0000wX-Px
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 12:49:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rcqiL-00057m-D4
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 12:49:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33ce8cbf465so3557941f8f.3
 for <qemu-trivial@nongnu.org>; Wed, 21 Feb 2024 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708537739; x=1709142539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBRt+Dcap8Nv9e9jWElvC4/9r+A10VMN88gU2Cxi6Lo=;
 b=PD/rJc8VbQUuZgKOgBL/NGN0+74kuYXwvgoRWZ9lGDhISN1AM7A7eL+EbNeVnZAnb/
 8aEDkO9eaIQVTUtZzS5IDB984pPKjSP6M/u4pb+ZnR2zTd75NnwXHm45y5GfNMYg+osb
 zURIaavahXW9dQ+L4nCNZx14HUbR9XX7WsTRKssWqX9mWm9z6+2NZ1D8u0QkAzY8B+8z
 8T6T3VJ8HaTRaRwTJ2cXpEws4WXpAkDSG2jK+PyFKMkRg3165wB7Y+DdViqRQOp216Ab
 NWX2RkVtYZiOrUaQ8maRlftlOGr9k47O6CkbfVAgRC3jFIa0HB2dalXTnBnJOBMJUHBe
 CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708537739; x=1709142539;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fBRt+Dcap8Nv9e9jWElvC4/9r+A10VMN88gU2Cxi6Lo=;
 b=oj8zSh0pwID/WKtm5TS7wnP2KQ3imjF5GgFJeM1L6G0wdnTg0igATb2/bYzsr5YVWi
 5zCLSZMaxr4UqeVl2pAyoHggvTIoRSEblh/vS5gzm74XuNXzyqZ94rDwtVYL0+HDnScQ
 5eOHpK4ggIismyXAksoN2WanncNp+dZ/gIhiRwtH7kSqHI8UQUr1SMbY+dezC2P/OFdF
 w0CpmK8rsM0HgIv4DaslgygwsaFI4kQv2jEhIodRZhMYGUN9TtvPPsaXNGiMJadV3/DC
 7tMmk1bPEHqKQeBAOwR24oRFHdehRPcRQ9ntZnfLShC7FuvAZZWkj9f0n0ArM2o3o9gl
 t00A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu7bz2Giq9bTbzI/lXUXOPqOeyWcq71O/Yx7cZbw5AF0nw4gt/iREJfRWP6V1FBloGL+HqqqWplAYYIoz6wd9ikZZxOq6h0A==
X-Gm-Message-State: AOJu0YxpTQk88aPjrunYwrKTwkd9jfQ27ZHj23Q45VStd0qKE0se2Qmw
 700Mf9QL53UtWnewyqavqFoGZYAPjUIs9vXVBsXurGT0wO6J2Ns6urJCwWm3Y1P4jGmDx9WkP4K
 8
X-Google-Smtp-Source: AGHT+IFTxmY8+vThDn5wZw8+XsfwNngSf+ojPtP5+U3tZzTB2tatqnK/vaR8yqZuRVeji2CycWM3lQ==
X-Received: by 2002:a5d:544c:0:b0:33d:64a3:9bc8 with SMTP id
 w12-20020a5d544c000000b0033d64a39bc8mr4256141wrv.45.1708537738756; 
 Wed, 21 Feb 2024 09:48:58 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bt27-20020a056000081b00b0033d1b653e4csm18404128wrb.54.2024.02.21.09.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 09:48:58 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 067455F875;
 Wed, 21 Feb 2024 17:48:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Tianlan Zhou <bobby825@126.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/system: Fix key for input grab
In-Reply-To: <20240221131900.2041-1-bobby825@126.com> (Tianlan Zhou's message
 of "Wed, 21 Feb 2024 21:19:01 +0800")
References: <20240221131900.2041-1-bobby825@126.com>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Wed, 21 Feb 2024 17:48:57 +0000
Message-ID: <87ttm1aet2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 Feb 2024 17:49:03 -0000

Tianlan Zhou <bobby825@126.com> writes:

> Key for input grab should be Ctrl-Alt-g, not just Ctrl-Alt.
>
> Signed-off-by: Tianlan Zhou <bobby825@126.com>
> ---
>
> v1:
> - Initial patch
>
> ---
>  docs/system/keys.rst.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/keys.rst.inc b/docs/system/keys.rst.inc
> index 2e2c97aa23..59966a3fe7 100644
> --- a/docs/system/keys.rst.inc
> +++ b/docs/system/keys.rst.inc
> @@ -29,7 +29,7 @@ Ctrl-Alt-n
>     *3*
>        Serial port
>=20=20
> -Ctrl-Alt
> +Ctrl-Alt-g
>     Toggle mouse and keyboard grab.

I think this is correct although I notice we also echo this advice in
the vl help text:

#include "qemu-options.def"

    printf("\nDuring emulation, the following keys are useful:\n"
           "ctrl-alt-f      toggle full screen\n"
           "ctrl-alt-n      switch to virtual console 'n'\n"
           "ctrl-alt        toggle mouse and keyboard grab\n"
           "\n"
           "When using -nographic, press 'ctrl-a h' to get some help.\n"
           "\n"
           QEMU_HELP_BOTTOM "\n");

    exit(exitcode);


>=20=20
>  In the virtual consoles, you can use Ctrl-Up, Ctrl-Down, Ctrl-PageUp and

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

