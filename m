Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48157CCFA03
	for <qemu-trivial@archiver.kernel.org>; Mon,  3 Nov 2025 08:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vFpTt-0005PS-HL; Mon, 03 Nov 2025 03:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vFpTt-0005OW-12
 for qemu-trivial@nongnu.org; Mon, 03 Nov 2025 03:00:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vFpTn-0001a8-Ck
 for qemu-trivial@nongnu.org; Mon, 03 Nov 2025 03:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762156789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rPeubMt9cuVpmPomBEFyD8XvR8m9RJMjRHyJ0woczmc=;
 b=NUlihfHVRtWOe8eywZGtxn6QzJ3gOyx2q5p3OLV4TebOyOSuD63WNzdkDk/mMUfsHJcZWm
 RBf0yGsQujcDF77jm1p99VyTFcPBq03nGMsF9Js33IZnk8xDToUPaPZpV+MgIA2idx7Qn9
 Wd5iN50N/lSL5kRIGFjlvUrwKFLtswU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-molRjkvtNb6MvTStk7IQFA-1; Mon, 03 Nov 2025 02:59:47 -0500
X-MC-Unique: molRjkvtNb6MvTStk7IQFA-1
X-Mimecast-MFC-AGG-ID: molRjkvtNb6MvTStk7IQFA_1762156787
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88051c72070so27350546d6.1
 for <qemu-trivial@nongnu.org>; Sun, 02 Nov 2025 23:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762156787; x=1762761587;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPeubMt9cuVpmPomBEFyD8XvR8m9RJMjRHyJ0woczmc=;
 b=Kj2g3bW/6FoCMqA3Rk8j3ZxkUed92jdcQjEMNPJW5GrCTdtU7tLtwpOIqiOku8ULZq
 zPjrSyMT4Zub+HRg+M1riYNsLFVKrvjJ+haxztjAyqzwjCALvgVMylg5a+jjNQkJpuuw
 q+TJE17KHd19LPkU9FEkOdWzTzHoFXHkZjPnVQAlrmEu1A0yDAC3T4lwCErWXgEgMPwS
 s2isnEOUUeXr0VNLbKkRXE813OCDG+c7SblRCRryjGjTLuuphnUxyFhG3GlbibEq4gsU
 TA7xY2IzzWHc4VH7YwlQak3oQWaew2uS61WasiZwX1mKO/PgpTHsxXAADqSPxo3iwHIf
 Zg2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWooNkPjlMupcth8uJyqfmHlplGGs0xgpBNCXHpSrD6xdQ6jYyHQsmhG8p9ok2QK9dCa19jaqaGqVPKAyA=@nongnu.org
X-Gm-Message-State: AOJu0YxX9chr0opZUSm1sLdBKRXQ1ES5Pp40fZIuyshbY1id52VVTRMm
 NSnlQbBpN5L1rXg6floOWhJF8F1ZJQdawY8dEcxZVAr6hxd/jGWwaADOkKGsDb5chxEwMl7pVP3
 RMwn+RiFzQHeOUdogLwI8tlOvU3AtToBueum5nNEi3n+/zYDuFsSvd23zBd9zs3mQT+kdK84/Se
 YyYNCGjd5pQaG0R1ptZSdp6SBAzeUU/Ooyql9M9kgCzQ==
X-Gm-Gg: ASbGnctfvwx8c99LY8rLXY6HLxh2Y2L4AlX0ePaN7Imfuo8/NqickIEI2onaVJk9QZ+
 yG70r6qbYXg6/20Y1vXuJx9DTIr0KPJXNDRGorDFFS8mYZOkDH1IdxWkcl/98n/SvDS9kx/vgA1
 lumQE4kl6s7JWvdPdSF/tqjpmJyDKxuE/aKRV9Q2iT6moNoirf04Rf9vVPyg==
X-Received: by 2002:ad4:5c8e:0:b0:880:2519:7b8a with SMTP id
 6a1803df08f44-8802f287db5mr160281126d6.12.1762156787278; 
 Sun, 02 Nov 2025 23:59:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuHd5ZNkWKBp9kIdYRr5FQoLFtuW8fbOLNrZWWutR2xLkrY6GHzjIW3loqh2jHjWa83rklzc6wDmIpwTcoMkY=
X-Received: by 2002:ad4:5c8e:0:b0:880:2519:7b8a with SMTP id
 6a1803df08f44-8802f287db5mr160280966d6.12.1762156786808; Sun, 02 Nov 2025
 23:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20251101104230.739075-1-mjt@tls.msk.ru>
In-Reply-To: <20251101104230.739075-1-mjt@tls.msk.ru>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Nov 2025 09:59:35 +0200
X-Gm-Features: AWmQ_bkDnlORG5UpMRMC-SzjbZUjRp4dkDtOXj8agS0HcVXfgJgbA6ZiKmH7lLI
Message-ID: <CAPMcbCqWij-97RoAm=wdwcvWfwc1PymUR74GO6ajrtWDXCgNSw@mail.gmail.com>
Subject: Re: [PATCH trivial] qga: use access(2) to check for command existance
 instead of questionable stat(2)
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Rodrigo Dias Correa <r@drigo.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0ZBwegZLbJ8pm-Q8A3tWTRPrCjGaEmaHTrweMNfIpuQ_1762156787
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000051119e0642ac196e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--00000000000051119e0642ac196e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Best Regards,
Kostiantyn Kostiuk.


On Sat, Nov 1, 2025 at 12:42=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:

> The code checks existance of a command (halt/poweroff/reboot) by using
> stat(2) and immediately checking for S_ISLNK() on the returned stat
> struct.  This check will never be true, because stat(2) always follows
> symbolic links and hence will either return ENOENT (in case of dangling
> symlink) or the properties for the final target file.  It is lstat(2)
> which might return information about the symlink itself.  However, even
> there, we want to check the final file properties, not the first symlink.
>
> This check - S_ISLNK - is harmful but useless in this case.  However, it
> is confusing and it helps the wrong usage of stat(2) to spread, so it is
> better to remove it.
>
> Additionally, the code would better to check for the executable bits
> of the final file, not check if it's a regular file - it's sort of
> dubious to have anything but regular files in /sbin/.
>
> But a POSIX system provides another command which suits the purpose
> perfectly: it is access(2).  And it is so simple that it's not
> necessary to create a separate function when usin it.
>
> Replace stat(2) with access(X_OK) to check for file existance in
> qga/commands-posix.c
>
> Fixes: c5b4afd4d56e "qga: Support guest shutdown of BusyBox-based systems=
"
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qga/commands-posix.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index c7059857e4..0f4d6d96cc 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -213,12 +213,6 @@ out:
>      return retcode;
>  }
>
> -static bool file_exists(const char *path)
> -{
> -    struct stat st;
> -    return stat(path, &st) =3D=3D 0 && (S_ISREG(st.st_mode) ||
> S_ISLNK(st.st_mode));
> -}
> -
>  #define POWEROFF_CMD_PATH "/sbin/poweroff"
>  #define HALT_CMD_PATH "/sbin/halt"
>  #define REBOOT_CMD_PATH "/sbin/reboot"
> @@ -245,17 +239,17 @@ void qmp_guest_shutdown(const char *mode, Error
> **errp)
>
>      slog("guest-shutdown called, mode: %s", mode);
>      if (!mode || strcmp(mode, "powerdown") =3D=3D 0) {
> -        if (file_exists(POWEROFF_CMD_PATH)) {
> +        if (access(POWEROFF_CMD_PATH, X_OK)) {
>              shutdown_cmd =3D POWEROFF_CMD_PATH;
>          }
>          shutdown_flag =3D powerdown_flag;
>      } else if (strcmp(mode, "halt") =3D=3D 0) {
> -        if (file_exists(HALT_CMD_PATH)) {
> +        if (access(HALT_CMD_PATH, X_OK)) {
>              shutdown_cmd =3D HALT_CMD_PATH;
>          }
>          shutdown_flag =3D halt_flag;
>      } else if (strcmp(mode, "reboot") =3D=3D 0) {
> -        if (file_exists(REBOOT_CMD_PATH)) {
> +        if (access(REBOOT_CMD_PATH, X_OK)) {
>              shutdown_cmd =3D REBOOT_CMD_PATH;
>          }
>          shutdown_flag =3D reboot_flag;
> --
> 2.47.3
>
>

--00000000000051119e0642ac196e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto=
:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt;</div><div><br></div><div>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Best Regards,</div><div>Kostiantyn Kostiuk.</div><=
/div></div></div><br></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 1, 2025 at 12:42=E2=
=80=AFPM Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.=
ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The code checks existance of a command (halt/poweroff/reboot) by using<br=
>
stat(2) and immediately checking for S_ISLNK() on the returned stat<br>
struct.=C2=A0 This check will never be true, because stat(2) always follows=
<br>
symbolic links and hence will either return ENOENT (in case of dangling<br>
symlink) or the properties for the final target file.=C2=A0 It is lstat(2)<=
br>
which might return information about the symlink itself.=C2=A0 However, eve=
n<br>
there, we want to check the final file properties, not the first symlink.<b=
r>
<br>
This check - S_ISLNK - is harmful but useless in this case.=C2=A0 However, =
it<br>
is confusing and it helps the wrong usage of stat(2) to spread, so it is<br=
>
better to remove it.<br>
<br>
Additionally, the code would better to check for the executable bits<br>
of the final file, not check if it&#39;s a regular file - it&#39;s sort of<=
br>
dubious to have anything but regular files in /sbin/.<br>
<br>
But a POSIX system provides another command which suits the purpose<br>
perfectly: it is access(2).=C2=A0 And it is so simple that it&#39;s not<br>
necessary to create a separate function when usin it.<br>
<br>
Replace stat(2) with access(X_OK) to check for file existance in<br>
qga/commands-posix.c<br>
<br>
Fixes: c5b4afd4d56e &quot;qga: Support guest shutdown of BusyBox-based syst=
ems&quot;<br>
Signed-off-by: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=
=3D"_blank">mjt@tls.msk.ru</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 12 +++---------<br>
=C2=A01 file changed, 3 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index c7059857e4..0f4d6d96cc 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -213,12 +213,6 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0return retcode;<br>
=C2=A0}<br>
<br>
-static bool file_exists(const char *path)<br>
-{<br>
-=C2=A0 =C2=A0 struct stat st;<br>
-=C2=A0 =C2=A0 return stat(path, &amp;st) =3D=3D 0 &amp;&amp; (S_ISREG(st.s=
t_mode) || S_ISLNK(st.st_mode));<br>
-}<br>
-<br>
=C2=A0#define POWEROFF_CMD_PATH &quot;/sbin/poweroff&quot;<br>
=C2=A0#define HALT_CMD_PATH &quot;/sbin/halt&quot;<br>
=C2=A0#define REBOOT_CMD_PATH &quot;/sbin/reboot&quot;<br>
@@ -245,17 +239,17 @@ void qmp_guest_shutdown(const char *mode, Error **err=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0slog(&quot;guest-shutdown called, mode: %s&quot;, mode)=
;<br>
=C2=A0 =C2=A0 =C2=A0if (!mode || strcmp(mode, &quot;powerdown&quot;) =3D=3D=
 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (file_exists(POWEROFF_CMD_PATH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(POWEROFF_CMD_PATH, X_OK)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_cmd =3D POWEROFF_C=
MD_PATH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_flag =3D powerdown_flag;<br>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(mode, &quot;halt&quot;) =3D=3D 0) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (file_exists(HALT_CMD_PATH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(HALT_CMD_PATH, X_OK)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_cmd =3D HALT_CMD_P=
ATH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_flag =3D halt_flag;<br>
=C2=A0 =C2=A0 =C2=A0} else if (strcmp(mode, &quot;reboot&quot;) =3D=3D 0) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (file_exists(REBOOT_CMD_PATH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(REBOOT_CMD_PATH, X_OK)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_cmd =3D REBOOT_CMD=
_PATH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown_flag =3D reboot_flag;<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div>

--00000000000051119e0642ac196e--


