Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFDFCD98ED
	for <qemu-trivial@archiver.kernel.org>; Thu, 18 Jun 2026 11:31:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1waAxX-0001lu-DP; Thu, 18 Jun 2026 07:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1waAxW-0001lV-5h
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2026 07:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1waAxU-0007na-MW
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2026 07:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781782255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLifyH9wwKhXmZr0mH4q7xbzpvzt1kDkLGA8uGgC+KI=;
 b=WDJT00+E6Hfo5BSHrcb3eDw0ApkRb13ks9UX1cN0BiVFtc/ByOf3gGSoiZG65bZKgBzQgR
 5nfBNNWg1p/QgLAimv4Qn1JuJSEuZOPpEigkOQMukZmBhorZkG8ZIG5kAz9tFwp+qfUo/b
 CFUHWwucG2YdtsKILmvJHwQpLtx/3qs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-L63SqCNRP9-k5MK0ENsqGQ-1; Thu, 18 Jun 2026 07:30:53 -0400
X-MC-Unique: L63SqCNRP9-k5MK0ENsqGQ-1
X-Mimecast-MFC-AGG-ID: L63SqCNRP9-k5MK0ENsqGQ_1781782253
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c891ed872ddso598406a12.2
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2026 04:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781782253; x=1782387053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GLifyH9wwKhXmZr0mH4q7xbzpvzt1kDkLGA8uGgC+KI=;
 b=IVPWReLKZ4c2W8YAV+1iGQC7Y4VmCaor4rYGyo+IYuW0sazX9WsACB1w9EaUo3ba1r
 PLytxnKa5tK1h29yOXsXFMOI85blr5LZIXXeIKn5fdy230zgKFdh7oXDo28lN+sCqeAk
 QykcfYlX2kvikJ/CvqyXJ+YOQogSkYXlSUjRk2WfAvfXGgH9bsANV5UC00W/nko0Cohk
 /TNzUeqluX3vPac/YjUHhQ7dYxJ17ZUzp8brcbY+8BAd2BJQrTBHH1M2q6ylHkcDSX7N
 FuaWlGXtEnTlxfWWQo0Z8uLTp3OVwsD1O5wj/j4W6tm+PpydzzR7mVDdN1xUgBs9Kl5U
 euzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MbnJmq4UvP8HyAxwIbNkj5Zt3cV4D2duJCwkYXL2AX7VF1Bh8tJ13NEV8hCryMtgH+rasNu4zbou0tHk=@nongnu.org
X-Gm-Message-State: AOJu0YzsbGTdiqV7AuAa523iHNJdk0vbKEzx0IzVOMjIXiv4cWGM66yB
 /6sqe0dLIqVMSrzH6noQ+w5ELVflxx4sxRz1iYDE/KddpfyIA6cnho6Om1dgCE1kjiXYyuVdWDF
 zd1sfPnelF6zj15uGa/ErFo0ckNtDnmnea8cAovQ85L25ABKpXc2jwD9FkgSyfWOe1HfH/rY9BU
 yaRmogtKzO8iO80Q/BdwCZv36O8C7H8wSTlQ==
X-Gm-Gg: AfdE7cm/ZBP9lHs2E67j0wk9+0nJ7m4Y7AgDLGBGlWWl5mIkar+bdlUZ2HBoWkfObeG
 nsXMgc8p1VWvJdOlaMN0jNR8+HPKjo/Hk4K4uUgPPcKnVvBk+3utFoCaaytANM8Mnnpx4FOJXQu
 BSEExM4Gj1/iJ8qToL7TD5hVgDRdxagT4tUphvm0Wu9658Y/kdjqPbAyr1Eo2dzOrLKp+JB4W7K
 Qb6Q/tt16OILuwSpH7d3G8zVTwtt69ZLgCl7vXiBg/3cmwGxG1r2BqlWYiFzOb0i1TdKjzSI4MP
 CTyIwSvGzncG
X-Received: by 2002:a17:902:d542:b0:2be:3434:4e28 with SMTP id
 d9443c01a7336-2c6f3465e4amr24726555ad.19.1781782252538; 
 Thu, 18 Jun 2026 04:30:52 -0700 (PDT)
X-Received: by 2002:a17:902:d542:b0:2be:3434:4e28 with SMTP id
 d9443c01a7336-2c6f3465e4amr24726115ad.19.1781782252063; Thu, 18 Jun 2026
 04:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-char-win-stdio-typo-v1-1-05086b1b326b@gmail.com>
In-Reply-To: <20260618-char-win-stdio-typo-v1-1-05086b1b326b@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 18 Jun 2026 15:30:40 +0400
X-Gm-Features: AVVi8CcbsqQWhcDF1h72udzseGsRD5QOyH8jb0jf1pkg9kQpTTxO0QlCdOydFDQ
Message-ID: <CAMxuvawA-fGRAu25dL9Q=C2jqxTJkhibqrJtu6y8NsDy8P7rrA@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL] char-win-stdio: fix typo in spelling of 'stdio'
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k3_vJCUzXkCsqz15oTQx7XHe8fiDaZip2JdrYBy7lcI_1781782253
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jun 18, 2026 at 3:21=E2=80=AFPM Filip Hejsek <filip.hejsek@gmail.co=
m> wrote:
>
> Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char-win-stdio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
> index bb9c195a8b..0deba3bffb 100644
> --- a/chardev/char-win-stdio.c
> +++ b/chardev/char-win-stdio.c
> @@ -128,7 +128,7 @@ static void win_stdio_thread_wait_func(void *opaque)
>      SetEvent(stdio->hInputDoneEvent);
>  }
>
> -static void win_stiod_chr_set_echo(Chardev *chr, bool echo)
> +static void win_stdio_chr_set_echo(Chardev *chr, bool echo)
>  {
>      WinStdioChardev *stdio =3D WIN_STDIO_CHARDEV(chr);
>      DWORD              dwMode =3D 0;
> @@ -205,7 +205,7 @@ static bool win_stdio_chr_open(Chardev *chr,
>
>      SetConsoleMode(stdio->hStdIn, dwMode);
>
> -    win_stiod_chr_set_echo(chr, false);
> +    win_stdio_chr_set_echo(chr, false);
>
>      qemu_chr_be_event(chr, CHR_EVENT_OPENED);
>      return true;
> @@ -263,7 +263,7 @@ static void char_win_stdio_class_init(ObjectClass *oc=
, const void *data)
>
>      cc->chr_open =3D win_stdio_chr_open;
>      cc->chr_write =3D win_stdio_chr_write;
> -    cc->chr_set_echo =3D win_stiod_chr_set_echo;
> +    cc->chr_set_echo =3D win_stdio_chr_set_echo;
>  }
>
>  static const TypeInfo char_win_stdio_type_info =3D {
>
> ---
> base-commit: c7cf7c810153d6f5f31aa2d5c0dee9087f6b4dff
> change-id: 20260618-char-win-stdio-typo-5abb197de4e2
>
> Best regards,
> --
> Filip Hejsek <filip.hejsek@gmail.com>
>


