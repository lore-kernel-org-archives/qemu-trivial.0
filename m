Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioXdP-0007pT-NJ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 14:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1ioXdM-0007l1-ID
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1ioXdK-0000P2-CS
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46848
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1ioXdK-0000N8-9S
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 14:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578337305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZYMq6rkclQC8eMi6qcmCvHpL50F8Ty50/ctqNiKoSM=;
 b=RZGCZWaJ3pLdtrF6DFnrEW1x4a3M8nOKBucqiWtIND0kB9oX78HewbO3s76MavNyEfU8p9
 ScE2v/Paobd0mXaHBCgz1UUUPuRQle0Gc4hXNIuzQZkvovsOTYJe2CnTt+6z+TMDyZax4U
 sIfCq4WScn7L/xyZ6N7ErWSAwcltoVw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-oQEKAYNEP1CpwzxrQpTKCQ-1; Mon, 06 Jan 2020 14:01:44 -0500
Received: by mail-ot1-f70.google.com with SMTP id d36so2091990otb.16
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 11:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jZYMq6rkclQC8eMi6qcmCvHpL50F8Ty50/ctqNiKoSM=;
 b=Tg4oDUE4LH4vkXvBVvTJOry+UnqV+OE164rbfw3lzad5qKQeKidgIzgBwlaiHvMV+0
 h+US7jaC+QXEfZzu++3okBMx3kMiAgnEBrA9SmOvWDf7Cyw7TNySYoY/eU3Dsd8OOjIf
 T9yzUUuUG4RL6zBRUIgQGwvKdnoO9VXVyaiCZscZLE0f0XbADPA2An2BcuHPOQiiUqW/
 XFc8pi4eGcaKLFCYLthsf0lZKbvi7i7UusG+VdJxs9+ZdA6FneO8D/h/wp3iImKPzcVj
 +5IykUx+f29odRV9yKZoltJ8dWIMmk8Bs+XWkUbiv9nUFD72kn5dklybdysynZFVaIka
 WYOQ==
X-Gm-Message-State: APjAAAVNnfKMVl7DAs9rqL6aFfRLtxKoRAIKtvo3EM8clItONIdq4kaH
 LVEURAtS55YsA3eXscryd3OtZwUk3xSir4qtfdeA+BzT6BEAqDE0BSywTMWU6dT+RyK7aghXcR+
 Yj2EKpvoPzpy972aiqblqczHA3Xu/UnOH1A==
X-Received: by 2002:a9d:60c4:: with SMTP id b4mr94936864otk.166.1578337303960; 
 Mon, 06 Jan 2020 11:01:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxE7iYyaQtBsvuxtSKh/zmmpmdZfvLPHwENXoxR/9WkQcmEG38PQlOfRMCLmkbLq5DtA/VlLoYSCqO6/JkZJ+k=
X-Received: by 2002:a9d:60c4:: with SMTP id b4mr94936845otk.166.1578337303778; 
 Mon, 06 Jan 2020 11:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-10-danielhb413@gmail.com>
In-Reply-To: <20200106182425.20312-10-danielhb413@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Jan 2020 23:01:31 +0400
Message-ID: <CAMxuvawvybuW20r2UOT_Eke2YXRwk5o2wi-OnAvaiXEM8iSkAg@mail.gmail.com>
Subject: Re: [PATCH v1 09/59] chardev/char-pipe.c: remove 'fail' label in
 win_chr_pipe_init()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
X-MC-Unique: oQEKAYNEP1CpwzxrQpTKCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 06 Jan 2020 19:01:50 -0000

On Mon, Jan 6, 2020 at 10:25 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The 'fail' label is simply doing a 'return -1'.
>
> CC: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/char-pipe.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 94d714ffcd..65d52beb0d 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -54,12 +54,12 @@ static int win_chr_pipe_init(Chardev *chr, const char=
 *filename,
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
>      openname =3D g_strdup_printf("\\\\.\\pipe\\%s", filename);
> @@ -72,7 +72,7 @@ static int win_chr_pipe_init(Chardev *chr, const char *=
filename,
>      if (s->file =3D=3D INVALID_HANDLE_VALUE) {
>          error_setg(errp, "Failed CreateNamedPipe (%lu)", GetLastError())=
;
>          s->file =3D NULL;
> -        goto fail;
> +        return -1;
>      }
>
>      ZeroMemory(&ov, sizeof(ov));
> @@ -80,7 +80,7 @@ static int win_chr_pipe_init(Chardev *chr, const char *=
filename,
>      ret =3D ConnectNamedPipe(s->file, &ov);
>      if (ret) {
>          error_setg(errp, "Failed ConnectNamedPipe");
> -        goto fail;
> +        return -1;
>      }
>
>      ret =3D GetOverlappedResult(s->file, &ov, &size, TRUE);
> @@ -90,7 +90,7 @@ static int win_chr_pipe_init(Chardev *chr, const char *=
filename,
>              CloseHandle(ov.hEvent);
>              ov.hEvent =3D NULL;
>          }
> -        goto fail;
> +        return -1;
>      }
>
>      if (ov.hEvent) {
> @@ -99,9 +99,6 @@ static int win_chr_pipe_init(Chardev *chr, const char *=
filename,
>      }
>      qemu_add_polling_cb(win_chr_pipe_poll, chr);
>      return 0;
> -
> - fail:
> -    return -1;
>  }
>
>  static void qemu_chr_open_pipe(Chardev *chr,
> --
> 2.24.1
>


