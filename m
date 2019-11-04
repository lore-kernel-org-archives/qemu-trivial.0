Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iRckM-0006MJ-J9
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2019 08:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iRc5w-0006Wj-2o
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:08:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iRc5s-00006P-J6
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:08:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iRc5s-000060-D4
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:08:28 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4084A85360
 for <qemu-trivial@nongnu.org>; Mon,  4 Nov 2019 13:08:27 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id e25so10417322wra.9
 for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2019 05:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Um2Ztr2YBhEJiVusdUoQcbZYOWPFHybSR/VslVGr4y0=;
 b=SIKSD92jtdMMAHJ5AurATQHuacH39DbdInC4Lwml6CCJgEHisogg8En26hlT114LjN
 4wMoOnasQ7+WGD32ORjSKF3K9K/NNC5Cus32nzzbeAGukXx8Z/EV/pkBPImraAV+sLw5
 1nfziKWaEZ7w09PElHRmR6Ke/5RlqbJ2tVTqr/u1SDe1ANosc5Cd/dc9CA7sbKQF2K1R
 avGMT1wpU9mVTZTz4+GuqP7YCQ0gdlKWlnSCV6v3XsRKsmrO/9mUxbl3Lnsb0Kp5PN4Y
 kPx6HZFAUYJlbQhKdJ3INkSKQVFuo95BHIEJdDufAM0d617yfvyYNHWi/sRg7GFbKlIo
 0k0g==
X-Gm-Message-State: APjAAAXiwkcMkDRlejMQCxF22aTYlJvv88cL+1LaIf1D8ZpZIMpYLMoK
 0tqH6nd7j28Vum5QdxDVK5zSmpSezTigTCVzs8rWdPPFYw/O84K6Ltz6cEKdNNk5pP9im/lW+hH
 E3JtndAy1yDFvajM4TQ==
X-Received: by 2002:adf:9f47:: with SMTP id f7mr3355852wrg.186.1572872906024; 
 Mon, 04 Nov 2019 05:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuxswPzrNnGVn+akMaku0rmINia4mAD/xc1OKw7ZRjl8rCAOafu/ksoZ/qdYWKSoBb0aDCLQ==
X-Received: by 2002:adf:9f47:: with SMTP id f7mr3355829wrg.186.1572872905852; 
 Mon, 04 Nov 2019 05:08:25 -0800 (PST)
Received: from dritchie.redhat.com (139.red-95-120-215.dynamicip.rima-tde.net.
 [95.120.215.139])
 by smtp.gmail.com with ESMTPSA id v16sm18061325wrc.84.2019.11.04.05.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 05:08:25 -0800 (PST)
References: <20191102114346.6445-1-philmd@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Sergio Lopez <slp@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Bruce Rogers <brogers@suse.com>
Subject: Re: [PATCH] Makefile: install bios-microvm like other binary blobs
In-reply-to: <20191102114346.6445-1-philmd@redhat.com>
Date: Mon, 04 Nov 2019 14:08:23 +0100
Message-ID: <87tv7jssag.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 04 Nov 2019 08:50:17 -0500
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
X-List-Received-Date: Mon, 04 Nov 2019 13:08:33 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

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
>
> diff --git a/Makefile b/Makefile
> index bd6376d295..755aa6c5f5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -770,7 +770,7 @@ de-ch  es     fo  fr-ca  hu     ja  mk  pt  sl     tr=
 \
>  bepo    cz
>=20=20
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

Thanks.

Reviewed-by: Sergio Lopez <slp@redhat.com>

