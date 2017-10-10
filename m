Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1i1J-0003Yy-VA
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 20:03:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1i1I-0003Yp-1H
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 20:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1i1H-0003uw-2Y
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 20:03:36 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e1i1G-0003re-S7; Mon, 09 Oct 2017 20:03:35 -0400
Received: by mail-wm0-x241.google.com with SMTP id l10so20189812wmg.1;
	Mon, 09 Oct 2017 17:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=lV/tLPG8WkrEcE2CB3DmvNm0/YzrQsv1Hd53f6dv4h0=;
	b=Hnw/5y40BwD3UoKaX7SkAgJreVAMb+LDgtU3NItBkaTzkDjYAL5qeOLRBjP+RHcicr
	KAbIxGXF5ocfmkSm6ehPhVIQ1To6mhr88tfHxv/EUFj1sxPF0Vizasq82eYdh0Sk5QnP
	HN/lUiJ6SjkHyDNN3i65HkAptipT7qMn6Yj2LDkpcGAHN1JZ41MAhGE/JSfG/2jPiyeO
	aithXoZB/4I4CB8r4rYcgJAGCKwa6MsD2mFKV85uJ3Fwe4VCC6iDejEnWOq7R/YSnem8
	OfHJiOslCMu1pJvzuV8DPRbPFtiySnVDjzvpY3kKvyh/90pikGi7G+yoVIHIZ86U9aGs
	miDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=lV/tLPG8WkrEcE2CB3DmvNm0/YzrQsv1Hd53f6dv4h0=;
	b=ub6Ls7nr7AqV1Ekk+57N1PdtwMSiBz74bkrFlcl49ExTgSzg4JwPY9cvJdMDTaw2nw
	uuiGAPMgYMaiiVspp4n2ku/LPG78Ln8h81it6NOuTUb4CaCxFvM5eSwyAAWGJW7FkF81
	Y0nSIn3TPJ+z6RxGGqLJ/DGhGFF4nAVbq1QRDmeYwcSUkywigvirpkheYsO91H51Dv1W
	vehNEOzlMM+k6yZ1RHsBOgc3IVuM/LnFkqABEVoRsUAQ8XeTojnObIEgbpT3cjd59Upz
	xOMTqKhwpWK9XDd6KbHZSOnbcxZoyUaYU3iuA+aNM8zzVFwC4zHl1mtz2rqk0rVX6d0Q
	OXuw==
X-Gm-Message-State: AMCzsaXJhhDS9iMjxtkTR3Fo4o+V/F9pxJ8CbiodBmM6TIQAo3+cX9Ch
	aGoWF2EsvWfnhryt7H16tG7Q4e3VozCMYbjLO+8=
X-Google-Smtp-Source: AOwi7QAx9VC4Xl54SXW5UV1vebe5wsMFdesLoGJaGHadpHRtGgHx7tkYYISmDbZILz3IkUHKF0djvhbe6WEY8ONrLNw=
X-Received: by 10.223.144.71 with SMTP id h65mr10914972wrh.41.1507593812157;
	Mon, 09 Oct 2017 17:03:32 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.157.2 with HTTP; Mon, 9 Oct 2017 17:03:01 -0700 (PDT)
In-Reply-To: <20171006235023.11952-45-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-45-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 9 Oct 2017 17:03:01 -0700
X-Google-Sender-Auth: h14yc19M-izXyw32WOeVYa-jFQM
Message-ID: <CAKmqyKOYNUQnUeLhrTWOQprsDaQxo=0RGpNnCwS5bswTZBSZ4Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin Wolf <kwolf@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu trival <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 44/88] hw/core/loader: use
 g_new() family of functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 00:03:37 -0000

On Fri, Oct 6, 2017 at 4:49 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  hw/core/loader.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 4593061445..def4766dbb 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -899,7 +899,7 @@ int rom_add_file(const char *file, const char *fw_dir=
,
>          return -1;
>      }
>
> -    rom =3D g_malloc0(sizeof(*rom));
> +    rom =3D g_new0(Rom, 1);
>      rom->name =3D g_strdup(file);
>      rom->path =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, rom->name);
>      rom->as =3D as;
> @@ -996,7 +996,7 @@ MemoryRegion *rom_add_blob(const char *name, const vo=
id *blob, size_t len,
>      Rom *rom;
>      MemoryRegion *mr =3D NULL;
>
> -    rom           =3D g_malloc0(sizeof(*rom));
> +    rom           =3D g_new0(Rom, 1);
>      rom->name     =3D g_strdup(name);
>      rom->as       =3D as;
>      rom->addr     =3D addr;
> @@ -1039,7 +1039,7 @@ int rom_add_elf_program(const char *name, void *dat=
a, size_t datasize,
>  {
>      Rom *rom;
>
> -    rom           =3D g_malloc0(sizeof(*rom));
> +    rom =3D g_new0(Rom, 1);
>      rom->name     =3D g_strdup(name);
>      rom->addr     =3D addr;
>      rom->datasize =3D datasize;
> --
> 2.14.2
>
>

