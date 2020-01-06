Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioXdD-0007Yk-GG
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 14:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1ioXd9-0007TG-N6
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1ioXd8-00009V-JQ
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35310
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1ioXd2-0008Sr-Cv
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578337286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udr4qNUrHL92V3QPI1xp7SuA0OONQ/iGl2vzlDGLXAo=;
 b=UDyQhKk1TsWmFLaAkc9/qveEfQ5orxRHfbxT1Dn9U6qY8zk7IRwLxqY5sfj232/vd7KBax
 1njwlJXJFHYLBW0l/UQq8coVLASXqmv7N00UmMdiEbr7olC3M2FqhqGIkHMkPRWecsh0Wc
 RRfiO6qzubR4LW9S0JZKYFrb5vG4cqY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Fk-kVV1bPHyAsFrmbXmDDQ-1; Mon, 06 Jan 2020 14:01:19 -0500
Received: by mail-oi1-f198.google.com with SMTP id m127so10914674oig.19
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 11:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=udr4qNUrHL92V3QPI1xp7SuA0OONQ/iGl2vzlDGLXAo=;
 b=XTtR8huVeWRpPT44RV2lRy/iuH2xtFZ5+shbQ3hzhILRFxrcduvYWb2dt2NXKHabKq
 CsFyiPLACCvi14gDR9r1VbHIzkuVwgx+7m09p5Vj0DmQsR57wHWEPKEUb8i2uRWHp1DX
 UI0P6ljl70ZE7Ft2NC+19rqoTpbCSIeGb4GWezV6rZ7rDwPnMngw7d8JW+GuXlAgNdP4
 WcEWlJPVydtcwLUL8oqL9FGY6VSPACAAjg2L24HydJzHY2JFsIH9MPONKNeywWDhjU3m
 NebOvmlqyTBpocAB802JPprqq7qzaudTB20rpNLhwMj3iDVlHgbqyh0hiergGQGEcOFG
 o2Og==
X-Gm-Message-State: APjAAAUPrnqufAauzwflZk8ifMtWMSE0nqSx23E1jEtHiDH3mbvh3xyg
 HrEe0gzPTqJ8ncA62CPT90qNY66xoAVqch3XN0rn0NWbvHWxielJXs4KD4KHecGOpCBiTmQr4jO
 LZtpRKHlCDdeeQWsYVulvBCfhykcxKQqnkQ==
X-Received: by 2002:a9d:4706:: with SMTP id a6mr109017047otf.331.1578337278811; 
 Mon, 06 Jan 2020 11:01:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6hg7r8jOwhDc1l9VjJIUG5XkDT8WG02VjnstOQj4/x7ixMw2kczT/a6yFRqGT6A+K6KhfmSzxzCXNyrCt7D4=
X-Received: by 2002:a9d:4706:: with SMTP id a6mr109017029otf.331.1578337278541; 
 Mon, 06 Jan 2020 11:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-11-danielhb413@gmail.com>
In-Reply-To: <20200106182425.20312-11-danielhb413@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Jan 2020 23:01:06 +0400
Message-ID: <CAMxuvawDuytTS90fBxc95ONkR=w1AxGT8+faSm+Dbd7-U4TJyA@mail.gmail.com>
Subject: Re: [PATCH v1 10/59] chardev/char-win.c: remove 'fail' label in
 win_chr_serial_init()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
X-MC-Unique: Fk-kVV1bPHyAsFrmbXmDDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 19:01:38 -0000

On Mon, Jan 6, 2020 at 10:25 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The 'fail' label is a simply call to 'return -1' on error. Remove
> it and do the return call instead.
>
> CC: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char-win.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/chardev/char-win.c b/chardev/char-win.c
> index 34825f683d..72c232e6d9 100644
> --- a/chardev/char-win.c
> +++ b/chardev/char-win.c
> @@ -85,12 +85,12 @@ int win_chr_serial_init(Chardev *chr, const char *fil=
ename, Error **errp)
>      s->hsend =3D CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hsend) {
>          error_setg(errp, "Failed CreateEvent");
> -        goto fail;
> +        return -1;
>      }
>      s->hrecv =3D CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hrecv) {
>          error_setg(errp, "Failed CreateEvent");
> -        goto fail;
> +        return -1;
>      }
>
>      s->file =3D CreateFile(filename, GENERIC_READ | GENERIC_WRITE, 0, NU=
LL,
> @@ -98,12 +98,12 @@ int win_chr_serial_init(Chardev *chr, const char *fil=
ename, Error **errp)
>      if (s->file =3D=3D INVALID_HANDLE_VALUE) {
>          error_setg(errp, "Failed CreateFile (%lu)", GetLastError());
>          s->file =3D NULL;
> -        goto fail;
> +        return -1;
>      }
>
>      if (!SetupComm(s->file, NRECVBUF, NSENDBUF)) {
>          error_setg(errp, "Failed SetupComm");
> -        goto fail;
> +        return -1;
>      }
>
>      ZeroMemory(&comcfg, sizeof(COMMCONFIG));
> @@ -114,29 +114,26 @@ int win_chr_serial_init(Chardev *chr, const char *f=
ilename, Error **errp)
>
>      if (!SetCommState(s->file, &comcfg.dcb)) {
>          error_setg(errp, "Failed SetCommState");
> -        goto fail;
> +        return -1;
>      }
>
>      if (!SetCommMask(s->file, EV_ERR)) {
>          error_setg(errp, "Failed SetCommMask");
> -        goto fail;
> +        return -1;
>      }
>
>      cto.ReadIntervalTimeout =3D MAXDWORD;
>      if (!SetCommTimeouts(s->file, &cto)) {
>          error_setg(errp, "Failed SetCommTimeouts");
> -        goto fail;
> +        return -1;
>      }
>
>      if (!ClearCommError(s->file, &err, &comstat)) {
>          error_setg(errp, "Failed ClearCommError");
> -        goto fail;
> +        return -1;
>      }
>      qemu_add_polling_cb(win_chr_serial_poll, chr);
>      return 0;
> -
> - fail:
> -    return -1;
>  }
>
>  int win_chr_pipe_poll(void *opaque)
> --
> 2.24.1
>


