Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sP5op-0002pL-UM
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2024 15:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sP5ol-0002nB-1w
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2024 15:39:03 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sP5oi-0004YY-VZ
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2024 15:39:02 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso8214312e87.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Jul 2024 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720035537; x=1720640337; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0epxMydntOWolgrCPdLLXWE4HBIG9qxSZgFKtGSlgU=;
 b=YasXbhyLuPb396yescQJFt8SdpoNQQI46EGSKQ0VFkR7bb3z1B4QF+OCgjZDr0FwjM
 2B6ATRuTzqUxlq23t25pilVvovgRwes9Tuf8Xo3gTI8LYa9mgsCcNGjwpy8EDCN5NGs0
 3kfF3PLIyZ9b3sfJx3+ayfz2RnkySCn9Jv1ZDuyD4finZ6GXUKBV0/z4m1YEugLVlY2Y
 enDE4b1djKyH5zgEKbRX9MpP2PsplEEexb1mSnkd/64ttexdUKblh3Ol3uRWEyXCqcXC
 2mzNxUf6pgNpGcht6edSRD0hdJsY+qC4qBq2JbFKKgM/RCJUWxoKbHcJS9RcdwS+fjqO
 ua8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720035537; x=1720640337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0epxMydntOWolgrCPdLLXWE4HBIG9qxSZgFKtGSlgU=;
 b=YRrbb/ZZcpepIFwfDwt1EVjcDJqHa8eFsnpgWOt1yfJTimvCF3mkrLBBwRfEgc+jhh
 Uv3+zpUQYgTmf5K6bNLNrmsdE+UIJSwULAqDzgky+qZ4NA/8ls95fZ09bsLwngKH7dwY
 s+HeWwo0NrgHhn/JLV+fWR4Pp+hDp5lhwP8F0EMYpHfcr1Bxh63jksbTzb3fNto3KnLx
 N6a2cnGPOeoyIS93vZMHUOe1+5X/AaYCAMIqxD0L1lkrPamXH4+YAYt3YU+5p9e72aGa
 SNxtMmgZcq4k6rK7J6iA5KcyK0WW8MumV6vcRIXO4zAWjPL5bJDQn9sY/lgWKcOHPQvM
 Gx6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1g4FqbBrgrJgpe5qodrCG5aJymZkCMUThcZq+M0UGLE/v+ykhE7dnI8X1Gg8Dc1tMcHa3U6et3hf+zUD+1vN3zQlL/r6OTA==
X-Gm-Message-State: AOJu0YwJ6wHfq/0iAQwKzDWhDIxaWihRnkTjt5Xicf5bcA1+HkhoUL/5
 fOyWywcdd/7nqVKcOXt04q8qBqcHXY0E1FygEj8fD7992EFY0IpVPoGdBVgD8kKMYFLePRyi4sD
 qEs/5/UXk6zF6qIROZGgTtbb9GyNCJleywz3e8A==
X-Google-Smtp-Source: AGHT+IGX84eTRkM17McAUysKFWFKZro1ah9fPl6hpUZqLbCIbjrgD4bsGB2BdPLrdE3e++rMjFWbz2+KQ6CGp3fZrsA=
X-Received: by 2002:a05:6512:39c5:b0:52c:da18:618c with SMTP id
 2adb3069b0e04-52e826fb768mr9326826e87.45.1720035537580; Wed, 03 Jul 2024
 12:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240703033901.1017-1-dongzhihai@eswincomputing.com>
In-Reply-To: <20240703033901.1017-1-dongzhihai@eswincomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jul 2024 20:38:46 +0100
Message-ID: <CAFEAcA8U8vaixGLy-UG9kt0EYvsqmbU2c=HUPTzCdsYwo-ZYRA@mail.gmail.com>
Subject: Re: [PATCH] README.rst: add the missing punctuations
To: Zhihai Dong <dongzhihai@eswincomputing.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
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
X-List-Received-Date: Wed, 03 Jul 2024 19:39:03 -0000

On Wed, 3 Jul 2024 at 04:40, Zhihai Dong <dongzhihai@eswincomputing.com> wrote:
>
> Make the README more clearly.
>
> Signed-off-by: Zhihai Dong <dongzhihai@eswincomputing.com>
> ---
>  README.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/README.rst b/README.rst
> index 21df79ef43..b120a1f69e 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -82,7 +82,7 @@ guidelines set out in the `style section
>  the Developers Guide.
>
>  Additional information on submitting patches can be found online via
> -the QEMU website
> +the QEMU website:
>
>  * `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
>  * `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
> @@ -102,7 +102,7 @@ requires a working 'git send-email' setup, and by default doesn't
>  automate everything, so you may want to go through the above steps
>  manually for once.
>
> -For installation instructions, please go to
> +For installation instructions, please go to:
>
>  *  `<https://github.com/stefanha/git-publish>`_
>
> @@ -159,7 +159,7 @@ Contact
>  =======
>
>  The QEMU community can be contacted in a number of ways, with the two
> -main methods being email and IRC
> +main methods being email and IRC:
>
>  * `<mailto:qemu-devel@nongnu.org>`_
>  * `<https://lists.nongnu.org/mailman/listinfo/qemu-devel>`_
> --
> 2.34.1

(cc'ing qemu-trivial)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

