Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCJiu-0006AR-KH
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 04:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iCJis-00067V-3o
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 04:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iCJiq-0007Yf-Ng
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 04:29:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iCJio-0007XS-Oq
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 04:29:27 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C5DB12A09A1
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 08:29:23 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id o188so6319903wmo.5
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 01:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kikYKHfL3Ck2fN5906iWkH6+cgjWSLcj4UEJt3nusl4=;
 b=lKrR2vREmuLgxoc8TIrSfTvAtzcCTBZNBCsfDRZD5kvP/NTJgJ16mcHEOvC1r48wg9
 hq8WF+aPWCAl7yxtr24UYk8XD111C2rTs7qkV8bwGcjgn5UGuxcmu9wPXGs5mmpqJTA1
 J8smvz5pMxmZQZC3cmy7yJlLhx8LTC8o+g8At7MCaKKaqqNhgVDni9YXcN4FTAUsrF/U
 UqULSEwITe5lgxL6UOYtp4MIoxGPksKWdYpY1knyvKXvYMJdM1rpfgQDvdCPCW3XmAcC
 kAxuCh6P+DrjdVt1cmiKAyJrBRJ5QrY8Xon0jBJbIqxtGG5P275sDCwInCM50G7zwfRt
 4O5w==
X-Gm-Message-State: APjAAAVZ/ptc3l427M1aKF96wZMYjCtS31SjC/guV7jQZeObEoYf8BWN
 I/NhN62fBNciTpl0Dwb4gt3qFZbJIEe29imKA33LJysGD7/PA7GAN//1Rutajk7cnLqUb56Oqk3
 afAoMGI8iPfT2dMv7Vg==
X-Received: by 2002:a1c:7ed7:: with SMTP id
 z206mr13700943wmc.124.1569227362480; 
 Mon, 23 Sep 2019 01:29:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKX0HB9ZtvLtoSuZ2BX1CVOs4/0nzjuxdglPCbtiFmBe8VaHKy/UJBrfY1PW5dU113hHXcdQ==
X-Received: by 2002:a1c:7ed7:: with SMTP id
 z206mr13700926wmc.124.1569227362235; 
 Mon, 23 Sep 2019 01:29:22 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
 [79.36.61.170])
 by smtp.gmail.com with ESMTPSA id e6sm10312791wrp.91.2019.09.23.01.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 01:29:21 -0700 (PDT)
Date: Mon, 23 Sep 2019 10:29:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
Message-ID: <20190923082919.y2fjn2y6t7lire3z@steredhat>
References: <20190921103405.19623-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 23 Sep 2019 08:29:31 -0000

On Sat, Sep 21, 2019 at 12:34:04PM +0200, Philippe Mathieu-Daud=E9 wrote:
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index bf97ef3e33..59bb2fa0d3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c

Very appreciated!

What about fixing also this other line?

@@ -575,7 +575,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
         goto fail;
     }
=20
-    if (scells < 2 && binfo->ram_size >=3D (1ULL << 32)) {
+    if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide


> @@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>       * we might still make a bad choice here.
>       */
>      info->initrd_start =3D info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> +        MIN(info->ram_size / 2, 128 * MiB);
>      if (image_high_addr) {
>          info->initrd_start =3D MAX(info->initrd_start, image_high_addr=
);
>      }
> @@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARMCPU=
 *cpu,
>                   *
>                   * Let's play safe and prealign it to 2MB to give us s=
ome space.
>                   */
> -                align =3D 2 * 1024 * 1024;
> +                align =3D 2 * MiB;
>              } else {
>                  /*
>                   * Some 32bit kernels will trash anything in the 4K pa=
ge the
>                   * initrd ends in, so make sure the DTB isn't caught u=
p in that.
>                   */
> -                align =3D 4096;
> +                align =3D 4 * KiB;
>              }
> =20
>              /* Place the DTB after the initrd in memory with alignment=
. */
> @@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>                  info->loader_start + KERNEL_ARGS_ADDR;
>              fixupcontext[FIXUP_ARGPTR_HI] =3D
>                  (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
> -            if (info->ram_size >=3D (1ULL << 32)) {
> +            if (info->ram_size >=3D 4 * GiB) {
>                  error_report("RAM size must be less than 4GB to boot"
>                               " Linux kernel using ATAGS (try passing a=
 device tree"
>                               " using -dtb)");

With or without the new line fix:

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

