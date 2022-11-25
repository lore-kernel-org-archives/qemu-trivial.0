Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oybOn-00056U-Ok
	for mharc-qemu-trivial@gnu.org; Fri, 25 Nov 2022 11:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oybOD-00050O-52
 for qemu-trivial@nongnu.org; Fri, 25 Nov 2022 11:17:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oybO6-0003yG-6o
 for qemu-trivial@nongnu.org; Fri, 25 Nov 2022 11:17:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso1820392pjb.1
 for <qemu-trivial@nongnu.org>; Fri, 25 Nov 2022 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kpgfuKcMQQBvAsgvb4w86nfpcoKs8KK0mIriIaiWxDM=;
 b=sB9LQD1TUqOPp9EqS/lYcfYycK8/KRsjlASbkw15dulk21cRRko9bMW6Gkqvi/YFl4
 h1/mhb/VfToUiV3ENcanmoEIFtPstLRXZhPv9fI3S/MKs/wd7IFyA4WB3rQyETH8QWsR
 qis+dUPcJAQygpzGK++NtGmKKvhwF61VkV8oCpHCsH4CBUJq1yGTxqrN1VqyiZ4+aN0v
 fa9GpB0Y2tRMH2HSlyuigW1dhEe/yQVZxPbhrUfHLFAIl768rMBj4KdT1RXS/xXq2wH5
 nb2GCv3ValhJKy7gEGBu2rVrpuDQpL6G9QSxS9C0Kht6Al5836SAdn9iWoQNin0j4zrG
 Uy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpgfuKcMQQBvAsgvb4w86nfpcoKs8KK0mIriIaiWxDM=;
 b=zUQmKgOat5gohTp4FbiPLa7uszxa28CpYKKBW69aOAly15akr+Ka1+SblfoJdJZr+9
 zqS2+pddySXN6sLSdL4ImBZyEac7mzfahMl00lrVfc+jBusaRTQS6kYNnGCkw3GK3wDd
 gCJSk4zjvIaxNkyQUvS7VOJY4UpOvpC3jODqpX1dHPUNLp5hId55en5smV0pPuCmT5It
 /ncRnYRMacWB9V8tK/6/30uKZ0eZ7SBfYjp+/d3b7aUFuawoYBBcIkRicaAtdtzW7LWR
 U63B/yI3wf1FcZvf7z/tsCzlqvhaqSalDbSln9j6cyHFOpH8Gt6uMkgpX0YCcHf+8Ux4
 4jPw==
X-Gm-Message-State: ANoB5pnTUCUW+CB6unB4HfvRK0QFbygyGV5fYw5NSi/pxSf8z/G8JqEZ
 NWGtHXTq/txkRnkkzNJNLaFIt8B2xX3vTSCWwRvNHg==
X-Google-Smtp-Source: AA0mqf7Eaneq2yK8m++DT4097ny4YBF42bAxV8fDTz8MERv3l7Zf+L7Qnk61Xv+vWgY88cOouVcu1mtcyWAOp70F4uk=
X-Received: by 2002:a17:902:e149:b0:186:9295:2012 with SMTP id
 d9-20020a170902e14900b0018692952012mr24002642pla.19.1669393029559; Fri, 25
 Nov 2022 08:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
In-Reply-To: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 16:16:55 +0000
Message-ID: <CAFEAcA_Za5r6a7dNoGh-nS9tXKvGYzeWWyNsFxNsbXgsE4DozQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/next-fb: Fix comment typo
To: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, huth@tuxfamily.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 16:17:26 -0000

On Fri, 25 Nov 2022 at 16:10, Evgeny Ermakov <evgeny.v.ermakov@gmail.com> wrote:
>
> Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> ---
>  hw/display/next-fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
> index dd6a1aa8ae..8446ff3c00 100644
> --- a/hw/display/next-fb.c
> +++ b/hw/display/next-fb.c
> @@ -126,7 +126,7 @@ static void nextfb_class_init(ObjectClass *oc, void *data)
>      set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>      dc->realize = nextfb_realize;
>
> -    /* Note: This device does not any state that we have to reset or migrate */
> +    /* Note: This device does not have any state that we have to reset or migrate */
>  }
>
>  static const TypeInfo nextfb_info = {
> --
> 2.38.1
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

