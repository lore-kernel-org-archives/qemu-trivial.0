Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7GO6-0001Cr-2j
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 05:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1j7GO1-00019X-H1
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:27:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1j7GNx-00041o-Dr
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:27:21 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1j7GNx-00040v-8o
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582799236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JuFsm69pCXiFxPSjN/VPT5Lvx6wPoxEwSXUPjnk0jQ=;
 b=GB7orMqVPTtcILLvv5y5CH2OOe3YHDIeRzmMngTXcT5L7x3bLS6kB6yDA22f9OdwqYlUme
 DwYF3XXQCB1PRiAfoNMDyD/mosIrD4FDin5/nP4vkKnaue5O6YJPp185td+7vy2T4sQ3FQ
 NGdpWZ+RsYzyGG90ExtNIRAb+D+nDf8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-Yvo2BStENba54TixXyQhzw-1; Thu, 27 Feb 2020 05:27:15 -0500
X-MC-Unique: Yvo2BStENba54TixXyQhzw-1
Received: by mail-ot1-f71.google.com with SMTP id z15so1329824oto.16
 for <qemu-trivial@nongnu.org>; Thu, 27 Feb 2020 02:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3JuFsm69pCXiFxPSjN/VPT5Lvx6wPoxEwSXUPjnk0jQ=;
 b=SoCU6Cdflc0jPIwG96P4weHvc8fyRDCt/T5IKtLfOBIBlsCVCbGLbAAsPBpar+vGd5
 vYz1hQOBmCwwHbldFpcZHtWXFcYyaxVPtPvwtoeyNnVOYEoKXS01rLSLfsMXPY5kZqkI
 /cVMc68EmMRu112CUk1H5G0ilzC0kVdFRgHls3kqUzY5RVUR6peFdXUJt3MnFxNLkj7v
 Ojev8veo5/sSjNW/15hTrBvntab+1Vc891kL65pwlMIkoZBXq4iWg4TCwqejHPYu/Jss
 BPSbjoVcg/7f3whr2OiersDyWBr5Gf96599tRZDrerHb0mEGXEk8j6p40rBfEjlGP01P
 lrxA==
X-Gm-Message-State: APjAAAUpVU6tsGAtPtB5+NDSpruzTAPkXmyNHdYEoLObLLjNVYFpI641
 zTak9Ej6RB9wybRVUHgP4At7qd9xMCgf6k9HYyWvOLppdgPMIgX6H7/C2ip+orBtGlEzZhpwZvy
 w1zvEETsJaqQuLl1DRPetbn/7lZBgQy1QXA==
X-Received: by 2002:a05:6808:487:: with SMTP id z7mr395153oid.46.1582799234511; 
 Thu, 27 Feb 2020 02:27:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtQ6IcMaU2stJcqkzqCnYweyHKBDRF+h5rrLp+dpqC67WidJrXpyNu39TYvV5YLz0rtfBe+1i1FvaALS/3hFw=
X-Received: by 2002:a05:6808:487:: with SMTP id z7mr395141oid.46.1582799234293; 
 Thu, 27 Feb 2020 02:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20200227100250.20514-1-philmd@redhat.com>
 <20200227100250.20514-2-philmd@redhat.com>
In-Reply-To: <20200227100250.20514-2-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 27 Feb 2020 11:27:03 +0100
Message-ID: <CAMxuvawwy4b2rhkph7x=ifG2GrpRVCogdm1_dYYtXjvz9fwiiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] chardev: Improve error report by calling
 error_setg_win32()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
 Paolo Bonzini <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 27 Feb 2020 10:27:24 -0000

On Thu, Feb 27, 2020 at 11:03 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Use error_setg_win32() which adds a hint similar to strerror(errno)).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  chardev/char-pipe.c | 2 +-
>  chardev/char-win.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 94d714ffcd..fd12c9e63b 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -70,7 +70,7 @@ static int win_chr_pipe_init(Chardev *chr, const char *=
filename,
>                                MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, =
NULL);
>      g_free(openname);
>      if (s->file =3D=3D INVALID_HANDLE_VALUE) {
> -        error_setg(errp, "Failed CreateNamedPipe (%lu)", GetLastError())=
;
> +        error_setg_win32(errp, GetLastError(), "Failed CreateNamedPipe")=
;
>          s->file =3D NULL;
>          goto fail;
>      }
> diff --git a/chardev/char-win.c b/chardev/char-win.c
> index 34825f683d..d4fb44c4dc 100644
> --- a/chardev/char-win.c
> +++ b/chardev/char-win.c
> @@ -96,7 +96,7 @@ int win_chr_serial_init(Chardev *chr, const char *filen=
ame, Error **errp)
>      s->file =3D CreateFile(filename, GENERIC_READ | GENERIC_WRITE, 0, NU=
LL,
>                        OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
>      if (s->file =3D=3D INVALID_HANDLE_VALUE) {
> -        error_setg(errp, "Failed CreateFile (%lu)", GetLastError());
> +        error_setg_win32(errp, GetLastError(), "Failed CreateFile");
>          s->file =3D NULL;
>          goto fail;
>      }
> --
> 2.21.1
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


Daniel, do you mind queuing this with the qio patch?


