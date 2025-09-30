Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A11CCA468
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Sep 2025 10:39:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3Xl7-0008J5-Tt; Tue, 30 Sep 2025 06:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v3Xl5-0008II-P4
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 06:38:59 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v3Xl2-0006ER-4e
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 06:38:58 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-8275237837fso650114085a.2
 for <qemu-trivial@nongnu.org>; Tue, 30 Sep 2025 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759228732; x=1759833532; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoYiJPU4TPKpxug2gwmjqJ0efOalFzIZ4kRYARDeKgo=;
 b=Roc4HjpyFWwje6AtYORWb0JMiNUUG9BGCw7Mh6e7S5PlGHsxPcoTkD7WhVbJiF6PHN
 zKoicFvwrG84PAJFy1ABjSSQOX7nqk8gXSWLIs+IkHDTM2fw6trfBNnj8/jrdPNWnIbm
 CDZxAm4FlSqlfsVqkK9zAYNFaJMKpE7vHY62bcmwKsF3lnSqbbkSk2N8JaFvvlEuyrU9
 91nJiw98zlmEtxuGGhUmB7wx8IXzfx+b2KPYgZCebriAxuFJqJp/IMCPzzkUEMUV6Ifw
 8invPk/0m8OogZo8myE0VFhIGzC7/STyLn06CeRfBGchPHo9/Z7po3JLmKS3a+CdGrSg
 JzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759228732; x=1759833532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WoYiJPU4TPKpxug2gwmjqJ0efOalFzIZ4kRYARDeKgo=;
 b=kvFK47MRZQbDGVPgX0ShvIupJk2h+bzhiq8/gbCWd/OOt8r6gAH8y8sq5q0/qzyIzZ
 OrCNhgAANW10J0zkBXqZdaaJH7NvYQWZvHIquUex+DycveFElL7E4+QC2GfKL0LJBfBW
 3cSV7ikvxcIG5ZL0LybaJyQ3+Z5B1X0Wb/DxZpuXI1Uxs641g8CXwDsV4gtjCV2d9Spf
 hCewd2sRg4C6WTtnbI2uHWbh/gij0KDr3D2/qIm8l77EF/yNlQKSRklsSdILbvvMiwce
 fwnC+lHa2FIB3NmhzaoFj9sj6B4saO00YsitaeG5cim8q/rS00cr6IQkwMua2dNOFlbt
 AwTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDrJjyN87hvTaHo7Gs6dZSEpGGpo0eP6/bDJCXfpXORh7Fx/dBwKC+OBEb0OutHygA+S9/j7HS3MF/t1w=@nongnu.org
X-Gm-Message-State: AOJu0YywGRI0T6PnOKwcwEaKRhSlTvtkgdXgPiDuZUHfu1QQKk2Fimqa
 ZUyZ1nVTu+78H5ntNmvQSoeuEP2TCuScx5664T8v3D2/jQuMLrbiEwmqt2k3TjWPsVWSiAPZV84
 XIIKPIhkY32LhEqtUTllD1z6/yajlC5A=
X-Gm-Gg: ASbGncvZ8L1ER2DoqY7Wr+nCYxk85NdW2DG17yOC0QHw/ox02ZWBFYi3sW9MpIraUkm
 sE/J5HFam5HJGGW+wL3LAJFrlABe37aVnYSRQK/SphWW22XLLJiOinJ6qiPEt93T76kxHumMYRz
 s5qngjwNS4gd/Aw+B6s6UJqZQejtlXhqII4mgRuZ6sjt/TYC/c68BLbwUbnVZIDnxlmOwzPmVLP
 dd4PDwn8O9GLUt6HMgTuvqmh2pfHVjO7yRj0VNHE6Ah6ToaVOwXF+IK32hLzK76Erk8yiu27Fs=
X-Google-Smtp-Source: AGHT+IGqVlBA4S6ajqk63LfWy0YKV+ZJwPmCZSwXNJ+VB61KpNkq3p4+3KtflxfrERKGqJI6pr3mzXvO1XcweLw8MLE=
X-Received: by 2002:a05:620a:2988:b0:806:484e:7c39 with SMTP id
 af79cd13be357-85ade962990mr2851355485a.14.1759228732085; Tue, 30 Sep 2025
 03:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <CANdvy3dH9bBdopj_KUqaLD0Viq7uKn0jPObjqz6H7XvMgRnPrw@mail.gmail.com>
In-Reply-To: <CANdvy3dH9bBdopj_KUqaLD0Viq7uKn0jPObjqz6H7XvMgRnPrw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Sep 2025 14:38:40 +0400
X-Gm-Features: AS18NWBkj84Ls0TqYsuAS5etJx3QPDD9H68q_jzn016t7oCJbGG1VAqOLh-BsD4
Message-ID: <CAJ+F1CJwGZ-+dder5+icmuqSvtQ=fjce1zfrGKamYuYxVxOX9w@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc: Fix NULL pointer dereference in
 vnc_disconnect_start
To: "Grant Millar | Cylo" <rid@cylo.io>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi

On Tue, Sep 30, 2025 at 1:59=E2=80=AFPM Grant Millar | Cylo <rid@cylo.io> w=
rote:
>
> From 0d1c4ac000a66ef22b4a0cd0c4bedd840192096a Mon Sep 17 00:00:00 2001
> From: Rid <rid@cylo.io>
> Date: Tue, 30 Sep 2025 10:23:58 +0100
> Subject: [PATCH] ui/vnc: Fix NULL pointer dereference in vnc_disconnect_s=
tart
>
> When a WebSocket connection fails during the handshake, vs->ioc can be
> NULL when vnc_disconnect_start() is called, leading to a segmentation
> fault when qio_channel_close() tries to dereference it.
>
> This can be reproduced by sending incomplete HTTP requests to the
> WebSocket port:
>
>   for i in {1..100}; do
>     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 <IP> <PORT> &
>   done
>

I tried to reproduce without success.

Could you provide a backtrace?

> Add a NULL check before calling qio_channel_close() to prevent the crash.
>
> Signed-off-by: Rid <rid@cylo.io>

Your mail is not properly formatted. git am fails.
https://www.qemu.org/docs/master/devel/submitting-a-patch.html


thanks

> ---
>  ui/vnc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 77c823bf2e..1669ed1b80 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -1301,7 +1301,9 @@ static void vnc_disconnect_start(VncState *vs)
>          g_source_remove(vs->ioc_tag);
>          vs->ioc_tag =3D 0;
>      }
> -    qio_channel_close(vs->ioc, NULL);
> +    if (vs->ioc) {
> +        qio_channel_close(vs->ioc, NULL);
> +    }
>      vs->disconnecting =3D TRUE;
>  }
>
> --
> 2.39.5
>


--=20
Marc-Andr=C3=A9 Lureau

