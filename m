Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r19LT-0004y2-MF
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2023 13:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r19LM-0004we-3Z
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 13:01:28 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r19LK-0001Fu-IM
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 13:01:27 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso1836791a12.1
 for <qemu-trivial@nongnu.org>; Thu, 09 Nov 2023 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699552884; x=1700157684; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rIlNApzXrb8e5wRpfNh4qEA6gI1Xn0LpbJPDKaRcJTk=;
 b=l3YBtsItETBuc1ZFAuH2ONaaev9wC594793ilHr2cb9H+yvvcmApMzfXRkQraU6rMb
 RJCcQbQCoU/ucPCu//J0xjz3xSKI2Ua/yi+P1L7ek5/gyGW8cFuINPfuGgqsxHuoIt5G
 YXnbNx7AVlbv/RqeGbGHlkaRdeohQp5aNyDDIkAcLzH/seEZRUd/HinYRh2Jb5M9JFNF
 mEnwGKBFRDV65B6pKw92yvmjqxInlXn6MJvoNbVXBw+rSy0yJzMRbTrpGV9nH5meMRTU
 PdcEHs1oaYag4N6CDhq0mPLVTKq2RTvy0d5xhppDBuVVg4npQ8aT9EFOHFSvburPvP5K
 kJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699552884; x=1700157684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rIlNApzXrb8e5wRpfNh4qEA6gI1Xn0LpbJPDKaRcJTk=;
 b=T5Vv4wNhD5gCCdqO/I4fsvYGZ8ETsxGB8cox0tJ65S52n+qOz0W8VHJbVVs8z7iNJp
 sXEZIndijusUkb/D1Wi7465gbLtcssWN76IurocgJ+wivvJ/je0xVhC0qQpuWVqgk2a9
 VHFzabDMJmIMEFke0axSeYFJCFhgW0B62OV4cwL1lf4855c4AvB6El4owYY4YmCsbFm3
 nXm/hFZIwTKxrytHBJ37plByJ7Z13FMV1N1QG3k5Yk9njTmRfNS0uN+T7Vrk4TTLPEAb
 7G+iQ+A2Lkph6KpS1M285FeEe9LMa7ImDiXzlC6po4xsGq/II5YIQNyZsHfm1NFpvv34
 /4UA==
X-Gm-Message-State: AOJu0YzbhwBSVAijOBm0Z0VVrIoEpG9eYHGpZO/4TD65TQ1osY54OWhu
 LMW3cXhx8Wh4Bz0WuEywe0SzRPaOPJDvsA62/bI4tEGSBOkbskLb
X-Google-Smtp-Source: AGHT+IE0G8TCFNaNpPdCbXZS5fN8JNyUxrvhrx901jbYf58mDtg/h+jOGNVRarmHr0NWlQEY70VnpbseNKK12qS2cPk=
X-Received: by 2002:a50:cc8a:0:b0:543:5d2e:a9c3 with SMTP id
 q10-20020a50cc8a000000b005435d2ea9c3mr5306640edi.20.1699552884331; Thu, 09
 Nov 2023 10:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20231109173544.375129-1-thuth@redhat.com>
In-Reply-To: <20231109173544.375129-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 18:01:13 +0000
Message-ID: <CAFEAcA_MK9-jzQx-po06-CnLLBHQSA2_VB3g7UFVCCiJskyCeg@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/es1370: Avoid four-letter word
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Thu, 09 Nov 2023 18:01:31 -0000

On Thu, 9 Nov 2023 at 17:36, Thomas Huth <thuth@redhat.com> wrote:
>
> Using certain four-letter words is not good style in source code,
> so let's avoid that.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/audio/es1370.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
> index 91c47330ad..bd460c810e 100644
> --- a/hw/audio/es1370.c
> +++ b/hw/audio/es1370.c
> @@ -670,8 +670,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
>      cnt += (transferred + d->leftover) >> 2;
>
>      if (s->sctl & loop_sel) {
> -        /* Bah, how stupid is that having a 0 represent true value?
> -           i just spent few hours on this shit */
> +        /* Bah, how stupid is that having a 0 represent true value? */
>          AUD_log ("es1370: warning", "non looping mode\n");
>      } else {
>          d->frame_cnt = size;
> --
> 2.41.0

We could be more usefully clear here anyway:

/*
 * loop_sel tells us which bit in the SCTL register to look at
 * (either P1_LOOP_SEL, P2_LOOP_SEL or R1_LOOP_SEL). The sense
 * of these bits is 0 for loop mode (set interrupt and keep recording
 * when the sample count reaches zero) or 1 for stop mode (set
 * interrupt and stop recording).
 */

PS: while we are cleaning up comments in this source file,
how about the bit marked /* Start blatant GPL violation */ ?

I think what that comment is trying to say is "most of this
source file is under the MIT license per the comment at the top
of the file, but these register constants are from the Linux
kernel sources and so they are GPL2". Both these licenses are
fine for QEMU, but we should have the commentary at the top
say "file is this license except for the GPL2-only macros etc"
rather than misleadingly claiming this is a GPL violation...

thanks
-- PMM

