Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQwjE-0002q6-Di
	for mharc-qemu-trivial@gnu.org; Sat, 02 Nov 2019 12:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iQwjB-0002pu-RN
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 12:58:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iQwj8-00007G-A8
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 12:58:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iQwj8-0008O0-2w
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 12:58:14 -0400
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AF0E59449
 for <qemu-trivial@nongnu.org>; Sat,  2 Nov 2019 16:58:11 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id x15so7884420oif.19
 for <qemu-trivial@nongnu.org>; Sat, 02 Nov 2019 09:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2jSpwmZaDSMA0WmkwmiZE/EaDVe/p6WyRu3qsrw0Ep8=;
 b=LX/9eDhwxkqrjwt5kJTBpj4GnLUNmYwAywGybpn8tnARScOILaiL4DmCuAKpgquLHJ
 hST0hvEy+MxbNYTKTnD1LIupR+N3ndSITsdAMKfE5PzsgQwjkiE/QBuI7p+/ITxP4y8N
 OayiFDzKGE8RcWfDMq6D23rNCfgIdcRg6Lvw5Oz/v1Eu6yXDwUKqhd7AzdY7VARvjVHW
 Je2g64i2sRF//tYRhaLgNr8J6oDrBlnnW+c48AagmMYdGylg2PvA0sLyTf+kNggO1tmq
 37bmR6VetcDCbbAUmo38SkohbX2/TkT2Z1Q8CohdXoWPV034c48Xv5tcIlwpWHi9aCbT
 LpGw==
X-Gm-Message-State: APjAAAXBDmhpxUxpbMTtIZdvfkYqGKpd6LwzRh6+MsaBUwY/R/ijbfio
 KWjwHIUWOH/4nrIuYXD6rgEpZh8TL1SLeX0vKx1aMGj5dIkeXCVNDJrApX1oAw4SbPZKP16DX/K
 bt05b6iJVVrfTWiiWLx6EBsX2WUOb6yxoWA==
X-Received: by 2002:aca:c7c1:: with SMTP id x184mr8281670oif.158.1572713890778; 
 Sat, 02 Nov 2019 09:58:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTto/GKdgwzddtNyMFaYuvELq/XtAZLhCv0cFVUERODd6QVrdHXA2c8FQM1y4sE6ypOLT5OQLAIKfcLO+bda8=
X-Received: by 2002:aca:c7c1:: with SMTP id x184mr8281652oif.158.1572713890401; 
 Sat, 02 Nov 2019 09:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191102114346.6445-1-philmd@redhat.com>
In-Reply-To: <20191102114346.6445-1-philmd@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Sat, 2 Nov 2019 17:57:59 +0100
Message-ID: <CAGxU2F6TKSwwCBMESc1GoikzwhHbtZwxpUHKAqpSAE=Sk1yyUw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: install bios-microvm like other binary blobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 qemu-trivial@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Bruce Rogers <brogers@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Sat, 02 Nov 2019 16:58:18 -0000

On Sat, Nov 2, 2019 at 12:43 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Bruce Rogers <brogers@suse.com>
>
> Commit 0d5fae3e52e introduced bios-microvm.bin but forgot to add
> it to the list of blobs being installed.
> Add it to the list of BLOBS that get installed.
>
> Fixes: 0d5fae3e52e "roms: add microvm-bios (qboot) as binary"
> Signed-off-by: Bruce Rogers <brogers@suse.com>
> [PMD: Reworded description]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

>
> diff --git a/Makefile b/Makefile
> index bd6376d295..755aa6c5f5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -770,7 +770,7 @@ de-ch  es     fo  fr-ca  hu     ja  mk  pt  sl     tr=
 \
>  bepo    cz
>
>  ifdef INSTALL_BLOBS
> -BLOBS=3Dbios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bi=
n \
> +BLOBS=3Dbios.bin bios-256k.bin bios-microvm.bin sgabios.bin vgabios.bin =
vgabios-cirrus.bin \
>  vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin=
 \
>  vgabios-ramfb.bin vgabios-bochs-display.bin vgabios-ati.bin \
>  ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin =
QEMU,cgthree.bin \
> --
> 2.21.0
>

