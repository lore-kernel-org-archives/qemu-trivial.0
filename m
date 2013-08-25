Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VDctB-0007rx-TZ
	for mharc-qemu-trivial@gnu.org; Sun, 25 Aug 2013 12:10:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1VDct4-0007em-1l
	for qemu-trivial@nongnu.org; Sun, 25 Aug 2013 12:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1VDcsy-0003Mp-Jj
	for qemu-trivial@nongnu.org; Sun, 25 Aug 2013 12:09:57 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49198 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1VDcsn-0003Ll-FY; Sun, 25 Aug 2013 12:09:41 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7B1D5A50DE;
	Sun, 25 Aug 2013 18:09:40 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1377269838-13347-1-git-send-email-yongbok.kim@imgtec.com>
Date: Sun, 25 Aug 2013 17:09:37 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FB888B1-2392-4049-94DC-EB52E50BB633@suse.de>
References: <1377269838-13347-1-git-send-email-yongbok.kim@imgtec.com>
To: Yongbok Kim <yongbok.kim@imgtec.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, leon.alrae@imgtec.com,
	"qemu-devel@nongnu.org qemu-devel" <qemu-devel@nongnu.org>,
	critian.cuna@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] hw: fix to display correct memory size
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
X-List-Received-Date: Sun, 25 Aug 2013 16:10:03 -0000


On 23.08.2013, at 15:57, Yongbok Kim wrote:

> A parenthesis placed inappropriately caused displaying
> wrong memory size bigger than 4GB.
>=20
> Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>

Acked-by: Alexander Graf <agraf@suse.de>

I think this should easily go in through the qemu-trivial queue.


Alex

> ---
> hw/mips/mips_malta.c  |    2 +-
> hw/mips/mips_r4k.c    |    2 +-
> hw/ppc/mac_oldworld.c |    2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index f8d064c..23ac1ca 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -954,7 +954,7 @@ void mips_malta_init(QEMUMachineInitArgs *args)
>     if (ram_size > (256 << 20)) {
>         fprintf(stderr,
>                 "qemu: Too much memory for this machine: %d MB, =
maximum 256 MB\n",
> -                ((unsigned int)ram_size / (1 << 20)));
> +                (unsigned int)(ram_size / (1 << 20)));
>         exit(1);
>     }
>     memory_region_init_ram(ram, NULL, "mips_malta.ram", ram_size);
> diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
> index 044f232..e8108ac 100644
> --- a/hw/mips/mips_r4k.c
> +++ b/hw/mips/mips_r4k.c
> @@ -201,7 +201,7 @@ void mips_r4k_init(QEMUMachineInitArgs *args)
>     if (ram_size > (256 << 20)) {
>         fprintf(stderr,
>                 "qemu: Too much memory for this machine: %d MB, =
maximum 256 MB\n",
> -                ((unsigned int)ram_size / (1 << 20)));
> +                (unsigned int)(ram_size / (1 << 20)));
>         exit(1);
>     }
>     memory_region_init_ram(ram, NULL, "mips_r4k.ram", ram_size);
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 42bb9d5..d7d1758 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -124,7 +124,7 @@ static void ppc_heathrow_init(QEMUMachineInitArgs =
*args)
>     if (ram_size > (2047 << 20)) {
>         fprintf(stderr,
>                 "qemu: Too much memory for this machine: %d MB, =
maximum 2047 MB\n",
> -                ((unsigned int)ram_size / (1 << 20)));
> +                (unsigned int)(ram_size / (1 << 20)));
>         exit(1);
>     }
>=20
> --=20
> 1.7.4
>=20
>=20


