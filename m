Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6776CAC5A7
	for <qemu-trivial@archiver.kernel.org>; Mon, 22 Sep 2025 06:40:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v0aDT-00015Z-Q5; Mon, 22 Sep 2025 02:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v0aDR-00014X-7G
 for qemu-trivial@nongnu.org; Mon, 22 Sep 2025 02:40:01 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v0aDP-0004t2-OG
 for qemu-trivial@nongnu.org; Mon, 22 Sep 2025 02:40:00 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4b58b1b17d7so40582591cf.1
 for <qemu-trivial@nongnu.org>; Sun, 21 Sep 2025 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758523196; x=1759127996; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UC/u2HdUxdalAWs64EknGbmZ8biYzi/zu7aMbaW1X7A=;
 b=Q1ZDjEBMhHQ24vNGV/OGmdoxeXQ+0yubVH7vUm7/y6dj0Y8lVn0dI+Ouyhx3BBg/oy
 kxtToUlRLflsZj1h8m3oVBFEjFSLdvNf0K44pa7etJTcfNbrscqfWz1rr5ViO1aax2eP
 z+QAwLsaJ3g/tE3zm0AeSiPzlcyqyLJTAvJcz4jFi4F9AoUdFqQxZYX6I3z88kduiiSy
 Y+5kdx5MMLI1tRbADBqSWoXzj2XCXxqNjh3p9x1lzuA6tsamBiDmGED8Pd49FGxLUgz/
 n3F3eJk5+yGEb0ica8cM9dt5S4DEE/rdCxojc1P8J6M7aXoiLlCHD9NO3dRTbJAlXaUN
 zn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758523196; x=1759127996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UC/u2HdUxdalAWs64EknGbmZ8biYzi/zu7aMbaW1X7A=;
 b=PECB3pc1COz+MXHsQj2rHwZ4wMyWwr3NEngnOlX2eZhtRGe9u+Dy5lew63twn1FQB/
 x2/G5ltClJWN1LnA4B0BPjv5TZMkmAdF+yuSupAtDjX1+UHZfSCLbUeSoI/TQdhfQs7m
 InjSUE+a9uz/3DFps+9gJGzXyn7UXjRYfs4CmmyFLwh31ErLrZ/bvkhh18zpGWcAijNY
 4OPmlxRij620tje6cgh71BgFz0Blmecjlnnq7oti0vGtECBcLtp7q/NxvYKhPU/X3tAz
 eVW/xbtf0ng1L36tPRcJgFR71U26gYS3OkKBBijNJoT8s/CRMpc5wp3dZThg8Vzqfoub
 gsMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+XR3qGPLUcYVIbJkykd0HpstnxahUC80a4AtXHeXlimn2aLn3YshxwW7E7JcNe9iRZFXQob60scMqRPQ=@nongnu.org
X-Gm-Message-State: AOJu0YzjJSeJStGKgCTJUD+nJn3h1BCpQIu5aOQU49B6N/HfZ4JyDGMR
 lZu2aGibTKa7m/vifYBX1Js3fC++HCPXw/d8q7ZujyQ5eiGmoY1+kmF7mk+yXXcLFZBwcQoXnCz
 yyhdbu9Km9R8D6kRdNzi84HjY+oEo/t0=
X-Gm-Gg: ASbGnctGPAmVUxSFd4/FR9tj+PQCxO0O4UfzbEXtKDnz091JDNC0Rdbi3eEdaWcDECb
 UHwPYhHQqzXTxjjfH63ZTagJybFXts18nFob+7PpIdwPAPu6QcDByNJ+/AFi7taX2eehlgEcUB+
 LdMNeKCLHlfbeqZT6nHDrc3cbGPsdlTKMEskntqTZYZeAZd2G0g0zSXLkzWC+CYsj96brxt5t3N
 BqKvQBn9duUEBGKZ2xCBVu7
X-Google-Smtp-Source: AGHT+IGQn1NnfZ6AamDMUEA/kLzAuv6zXUPuwS+XuZWaAg6oeW1a3kRSXUpOn74+h3VR49IaaS9tdThi7xV9HuQZ+eQ=
X-Received: by 2002:a05:622a:a0f:b0:4b1:1fe:dcfc with SMTP id
 d75a77b69052e-4c03d7af72dmr186443861cf.16.1758523195965; Sun, 21 Sep 2025
 23:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <A759ECC2-6B53-4B3E-A005-7D06BA403FCB@outlook.com>
In-Reply-To: <A759ECC2-6B53-4B3E-A005-7D06BA403FCB@outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Sep 2025 10:39:44 +0400
X-Gm-Features: AS18NWBkfDFHzwPyHKqrbDxXGu25WK9Bzckntv6DHpRkh_rwKM6Bg5DX7Sj4YF8
Message-ID: <CAJ+F1CJg9wjcs9SuNfA-gyfUCSs2w9j9kZ-fRuO=tLLwVMY=7w@mail.gmail.com>
Subject: Re: [PATCH] ui/spice: Fix abort on SPICE client connect
To: Mohamed Akram <mohd.akram@outlook.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82d.google.com
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

On Sun, Sep 21, 2025 at 1:04=E2=80=AFAM Mohamed Akram <mohd.akram@outlook.c=
om> wrote:
>
> The BQL is already locked by the main loop, so avoid locking again
> unless needed to not trigger an assertion failure.
>
> Signed-off-by: Mohamed Akram <mohd.akram@outlook.com>
> ---
>  ui/spice-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 5992f9d..31c31f2 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -222,7 +222,7 @@ static void channel_event(int event, SpiceChannelEven=
tInfo *info)
>       * thread and grab the BQL if so before calling qemu
>       * functions.
>       */
> -    bool need_lock =3D !qemu_thread_is_self(&me);
> +    bool need_lock =3D !bql_locked();

Looks good. Do you have a reproducer or a backtrace of the assertion
or is it theoretical?

>      if (need_lock) {
>          bql_lock();
>      }
> --
> 2.51.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

