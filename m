Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URJgG-0005Zl-7a
	for mharc-qemu-trivial@gnu.org; Sun, 14 Apr 2013 05:57:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1URJgD-0005W8-LJ
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1URJgC-0006Xl-Nz
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 05:57:01 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48230 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1URJgA-0006HR-9U; Sun, 14 Apr 2013 05:56:58 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8FE5AA3CEE;
	Sun, 14 Apr 2013 11:56:15 +0200 (CEST)
Message-ID: <516A7D3D.5000500@suse.de>
Date: Sun, 14 Apr 2013 11:56:13 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1365792838-13621-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1365792838-13621-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove unneeded type casts
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
X-List-Received-Date: Sun, 14 Apr 2013 09:57:02 -0000

Am 12.04.2013 20:53, schrieb Stefan Weil:
> cpu_physical_memory_read, cpu_physical_memory_write take any pointer
> as 2nd argument without needing a type cast.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/armv7m.c            |   12 ++++++------
>  hw/arm/boot.c              |    4 ++--
>  hw/arm/musicpal.c          |    8 ++++----
>  hw/arm/nseries.c           |    4 ++--
>  hw/arm/omap1.c             |   12 ++++++------
>  hw/audio/marvell_88w8618.c |    3 +--
>  hw/display/pxa2xx_lcd.c    |    2 +-
>  hw/dma/pxa2xx_dma.c        |    2 +-
>  hw/dma/xilinx_axidma.c     |    4 ++--
>  hw/gpio/zaurus.c           |    2 +-
>  hw/microblaze/boot.c       |    2 +-
>  hw/misc/macio/mac_dbdma.c  |    8 ++++----
>  hw/misc/milkymist-pfpu.c   |    4 ++--
>  hw/net/mcf_fec.c           |    4 ++--
>  hw/ppc/ppc405_boards.c     |    2 +-
>  hw/ppc/virtex_ml507.c      |    2 +-
>  16 files changed, 37 insertions(+), 38 deletions(-)

Looks okay,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

