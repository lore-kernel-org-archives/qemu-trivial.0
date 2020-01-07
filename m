Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioijD-0002oS-GD
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 01:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioij7-0002ez-L8
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioij4-0000kJ-Qx
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:52:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34435
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioij4-0000jf-He
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578379945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aykahNjZDwQr6O7Ei0t7rhjNWEhbVqEikab5BCotye8=;
 b=SC2HQJEIpC2pLdbUfkUlQrNn0K5qXFFmPFV/gM3I3fc/eXqN2+srL/5avpWKNps5pbFIya
 4AfrMBFzUGRLaHLFFpguGun8V4m1mP/NkJTvNbiusv2xDqJ5O4Bf309d1Uuq0t3OQvZZnb
 fQNmD52rON7VqjXSg93V7WzqLOwBmUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-S5eUA3npMcmyljBhnJjVQw-1; Tue, 07 Jan 2020 01:52:22 -0500
Received: by mail-wm1-f69.google.com with SMTP id m133so1636928wmf.2
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 22:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JqPgKiAkWEI0E39h5UQ3TMbWYgbg0Sv3OYtBzBdsRIg=;
 b=MtdjIqxTKgV3Wv/hhfGAB4IRwUjkj3oq0HdIpmblhzScdmcuEtE2ySGD8utwzphrD8
 oPyhHxQ+hp7ftUv6Wf2zGkExCBG7zkDAmb8U1qlxrn+S4judHWp39C3Oy3kt7aSTh3OS
 evFMpFAWNeDHt8ObI4KcNx+oQhChf/I/+heXXZNyIWtEsJVbOx2GDWm1mFBhghYjNcnE
 NX2Pn5y9YgNcR05yQ+jA5imEcYFnwJWX1o04TM5+Ky+5Up0nhl3KcPbUvm2lgId40NwG
 aFGPXb8MK6YIfHn4exEVyI/9R5t2KefzeEv2m83hvE7T0Vw7Eyc48fsaIYqfru/bRmcY
 bZuw==
X-Gm-Message-State: APjAAAVRDuf1w5097o7huLRmhfgEBG5VCg63WsIfmWQnsw3hJnJ5zHGe
 m7t2Ui5N2BuvuGMfcLH0iPLZJnL1cpN3hlQrrnuYFQLnebcDz+xZQBOJn8FC/hJWN8kkw3GCUg/
 f/Vk4X60ktQ1AUFQXXw==
X-Received: by 2002:adf:f28c:: with SMTP id
 k12mr105276920wro.360.1578379940924; 
 Mon, 06 Jan 2020 22:52:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVETDi4s+cRglAdPIwST/e4qWPDGyxz1M0ut/YMdEy9mL/3vpmBDMm/CF362y1WY17iRnS9w==
X-Received: by 2002:adf:f28c:: with SMTP id
 k12mr105276887wro.360.1578379940578; 
 Mon, 06 Jan 2020 22:52:20 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id m7sm25343047wma.39.2020.01.06.22.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 22:52:19 -0800 (PST)
Subject: Re: [PATCH v1 10/59] chardev/char-win.c: remove 'fail' label in
 win_chr_serial_init()
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-11-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a8b0b845-88df-f26e-e7e5-d92e7b6327f2@redhat.com>
Date: Tue, 7 Jan 2020 07:52:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106182425.20312-11-danielhb413@gmail.com>
Content-Language: en-US
X-MC-Unique: S5eUA3npMcmyljBhnJjVQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 07 Jan 2020 06:52:33 -0000

On 1/6/20 7:23 PM, Daniel Henrique Barboza wrote:
> The 'fail' label is a simply call to 'return -1' on error. Remove
> it and do the return call instead.
>=20
> CC: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   chardev/char-win.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/chardev/char-win.c b/chardev/char-win.c
> index 34825f683d..72c232e6d9 100644
> --- a/chardev/char-win.c
> +++ b/chardev/char-win.c
> @@ -85,12 +85,12 @@ int win_chr_serial_init(Chardev *chr, const char *fil=
ename, Error **errp)
>       s->hsend =3D CreateEvent(NULL, TRUE, FALSE, NULL);
>       if (!s->hsend) {
>           error_setg(errp, "Failed CreateEvent");
> -        goto fail;
> +        return -1;
>       }
>       s->hrecv =3D CreateEvent(NULL, TRUE, FALSE, NULL);
>       if (!s->hrecv) {
>           error_setg(errp, "Failed CreateEvent");
> -        goto fail;
> +        return -1;
>       }
>  =20
>       s->file =3D CreateFile(filename, GENERIC_READ | GENERIC_WRITE, 0, N=
ULL,
> @@ -98,12 +98,12 @@ int win_chr_serial_init(Chardev *chr, const char *fil=
ename, Error **errp)
>       if (s->file =3D=3D INVALID_HANDLE_VALUE) {
>           error_setg(errp, "Failed CreateFile (%lu)", GetLastError());
>           s->file =3D NULL;
> -        goto fail;
> +        return -1;
>       }
>  =20
>       if (!SetupComm(s->file, NRECVBUF, NSENDBUF)) {
>           error_setg(errp, "Failed SetupComm");
> -        goto fail;
> +        return -1;
>       }
>  =20
>       ZeroMemory(&comcfg, sizeof(COMMCONFIG));
> @@ -114,29 +114,26 @@ int win_chr_serial_init(Chardev *chr, const char *f=
ilename, Error **errp)
>  =20
>       if (!SetCommState(s->file, &comcfg.dcb)) {
>           error_setg(errp, "Failed SetCommState");
> -        goto fail;
> +        return -1;
>       }
>  =20
>       if (!SetCommMask(s->file, EV_ERR)) {
>           error_setg(errp, "Failed SetCommMask");
> -        goto fail;
> +        return -1;
>       }
>  =20
>       cto.ReadIntervalTimeout =3D MAXDWORD;
>       if (!SetCommTimeouts(s->file, &cto)) {
>           error_setg(errp, "Failed SetCommTimeouts");
> -        goto fail;
> +        return -1;
>       }
>  =20
>       if (!ClearCommError(s->file, &err, &comstat)) {
>           error_setg(errp, "Failed ClearCommError");
> -        goto fail;
> +        return -1;
>       }
>       qemu_add_polling_cb(win_chr_serial_poll, chr);
>       return 0;
> -
> - fail:
> -    return -1;
>   }
>  =20
>   int win_chr_pipe_poll(void *opaque)
>=20


