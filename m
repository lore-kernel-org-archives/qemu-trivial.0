Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1b9X-0007MK-MG
	for mharc-qemu-trivial@gnu.org; Sat, 02 Feb 2013 06:20:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U1b9V-0007HF-87
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 06:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U1b9U-0005Cl-99
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 06:20:57 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36320 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U1b9S-0005CR-3W; Sat, 02 Feb 2013 06:20:54 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 5814FA3A4A;
	Sat,  2 Feb 2013 12:20:53 +0100 (CET)
Message-ID: <510CF691.6090700@suse.de>
Date: Sat, 02 Feb 2013 12:20:49 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>
References: <510CEE9A.1030207@web.de>
In-Reply-To: <510CEE9A.1030207@web.de>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Create link to
 icon bitmap for out-of-tree builds
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Feb 2013 11:20:58 -0000

Am 02.02.2013 11:46, schrieb Jan Kiszka:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/configure b/configure
> index 0657b1a..cfccec5 100755
> --- a/configure
> +++ b/configure
> @@ -4289,6 +4289,7 @@ FILES=3D"$FILES tests/tcg/lm32/Makefile"
>  FILES=3D"$FILES pc-bios/optionrom/Makefile pc-bios/keymaps"
>  FILES=3D"$FILES pc-bios/spapr-rtas/Makefile"
>  FILES=3D"$FILES roms/seabios/Makefile roms/vgabios/Makefile"
> +FILES=3D"$FILES pc-bios/qemu-icon.bmp"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
>      $source_path/pc-bios/*.aml \

Commit message is missing an explanation why? :)

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

