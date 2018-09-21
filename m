Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g3C1Q-0001HH-UN
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 23:22:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1g3C1O-0001Ed-M2
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 23:22:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1g3C1N-0002km-E8
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 23:22:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39827)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1g3C1D-0002TC-4G; Thu, 20 Sep 2018 23:22:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42Gf6263mZz9sDN; Fri, 21 Sep 2018 13:22:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1537500122;
	bh=09A3QZfQWL71TrCAlXaTwIAgK1UZlFaRMPS659ejNlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShlFVJIg2ekprM+WbRpe+O02v3uq/TC0TGOrAk3QHrSw6SNTKbgr4xSjBkF9TT1dq
	f30LKg9Mk7XC0JlT4txbBdi/6NZHj5aMI0jFrKN8VJ5tM/+J8h16kq9l1r3eSfbFDG
	cYSWl0Jn/VnZ1npICeYLeRgEYcyLTqYTTXgBZDTw=
Date: Fri, 21 Sep 2018 10:49:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	thuth@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	agraf@suse.de, mjc@sifive.com, palmer@sifive.com,
	sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de
Message-ID: <20180921004906.GT30868@umbus.fritz.box>
References: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dLXnlYbDJNCwF3YM"
Content-Disposition: inline
In-Reply-To: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH] Drop the "qemu:" prefix from
 error_report()
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
X-List-Received-Date: Fri, 21 Sep 2018 03:22:24 -0000


--dLXnlYbDJNCwF3YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 07:08:32AM -0400, Mao Zhongyi wrote:
> error_report and friends already add a "qemu-system-xxx" prefix
> to the string, so a "qemu:" prefix is redundant in the string.
> Just drop it.
>=20
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/i386/multiboot.c | 8 ++++----
>  hw/ppc/e500.c       | 4 ++--
>  hw/ppc/sam460ex.c   | 8 ++++----
>  hw/riscv/sifive_e.c | 2 +-
>  hw/riscv/sifive_u.c | 2 +-
>  hw/riscv/spike.c    | 2 +-
>  hw/riscv/virt.c     | 4 ++--
>  7 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
> index d519e20..91118de 100644
> --- a/hw/i386/multiboot.c
> +++ b/hw/i386/multiboot.c
> @@ -181,12 +181,12 @@ int load_multiboot(FWCfgState *fw_cfg,
>      if (!is_multiboot)
>          return 0; /* no multiboot */
> =20
> -    mb_debug("qemu: I believe we found a multiboot image!");
> +    mb_debug("I believe we found a multiboot image!");
>      memset(bootinfo, 0, sizeof(bootinfo));
>      memset(&mbs, 0, sizeof(mbs));
> =20
>      if (flags & 0x00000004) { /* MULTIBOOT_HEADER_HAS_VBE */
> -        error_report("qemu: multiboot knows VBE. we don't.");
> +        error_report("multiboot knows VBE. we don't.");
>      }
>      if (!(flags & 0x00010000)) { /* MULTIBOOT_HEADER_HAS_ADDR */
>          uint64_t elf_entry;
> @@ -216,7 +216,7 @@ int load_multiboot(FWCfgState *fw_cfg,
>              exit(1);
>          }
> =20
> -        mb_debug("qemu: loading multiboot-elf kernel "
> +        mb_debug("loading multiboot-elf kernel "
>                   "(%#x bytes) with entry %#zx",
>                   mb_kernel_size, (size_t)mh_entry_addr);
>      } else {
> @@ -270,7 +270,7 @@ int load_multiboot(FWCfgState *fw_cfg,
>          mb_debug("multiboot: load_addr =3D %#x", mh_load_addr);
>          mb_debug("multiboot: load_end_addr =3D %#x", mh_load_end_addr);
>          mb_debug("multiboot: bss_end_addr =3D %#x", mh_bss_end_addr);
> -        mb_debug("qemu: loading multiboot kernel (%#x bytes) at %#x",
> +        mb_debug("loading multiboot kernel (%#x bytes) at %#x",
>                   mb_load_size, mh_load_addr);
> =20
>          mbs.mb_buf =3D g_malloc(mb_kernel_size);
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7d19b14..e6747fc 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1000,7 +1000,7 @@ void ppce500_init(MachineState *machine)
>          payload_size =3D load_uimage(filename, &bios_entry, &loadaddr, N=
ULL,
>                                     NULL, NULL);
>          if (payload_size < 0) {
> -            error_report("qemu: could not load firmware '%s'", filename);
> +            error_report("could not load firmware '%s'", filename);
>              exit(1);
>          }
>      }
> @@ -1056,7 +1056,7 @@ void ppce500_init(MachineState *machine)
>       */
>      dt_base =3D (loadaddr + payload_size + DTC_LOAD_PAD) & ~DTC_PAD_MASK;
>      if (dt_base + DTB_MAX_SIZE > ram_size) {
> -            error_report("qemu: not enough memory for device tree");
> +            error_report("not enough memory for device tree");
>              exit(1);
>      }
> =20
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 9c77183..b2455ad 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -234,7 +234,7 @@ static int sam460ex_load_uboot(void)
>      if (!pflash_cfi01_register(base, NULL, "sam460ex.flash", bios_size,
>                                 blk, 64 * KiB, fl_sectors,
>                                 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
> -        error_report("qemu: Error registering flash memory.");
> +        error_report("Error registering flash memory.");
>          /* XXX: return an error instead? */
>          exit(1);
>      }
> @@ -552,7 +552,7 @@ static void sam460ex_init(MachineState *machine)
>      if (!machine->kernel_filename) {
>          success =3D sam460ex_load_uboot();
>          if (success < 0) {
> -            error_report("qemu: could not load firmware");
> +            error_report("could not load firmware");
>              exit(1);
>          }
>      }
> @@ -571,7 +571,7 @@ static void sam460ex_init(MachineState *machine)
>          }
>          /* XXX try again as binary */
>          if (success < 0) {
> -            error_report("qemu: could not load kernel '%s'",
> +            error_report("could not load kernel '%s'",
>                      machine->kernel_filename);
>              exit(1);
>          }
> @@ -583,7 +583,7 @@ static void sam460ex_init(MachineState *machine)
>                                            RAMDISK_ADDR,
>                                            machine->ram_size - RAMDISK_AD=
DR);
>          if (initrd_size < 0) {
> -            error_report("qemu: could not load ram disk '%s' at %x",
> +            error_report("could not load ram disk '%s' at %x",
>                      machine->initrd_filename, RAMDISK_ADDR);
>              exit(1);
>          }
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 4577d72..cb513cc 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -81,7 +81,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename=
);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 59ae1ce..862f8ff 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -72,7 +72,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename=
);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index c8c056c..f0bf0d5 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -60,7 +60,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL,
>              &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0,
>              NULL, true, htif_symbol_callback) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename=
);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 248bbdf..818a537 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -64,7 +64,7 @@ static uint64_t load_kernel(const char *kernel_filename)
>      if (load_elf(kernel_filename, NULL, NULL,
>                   &kernel_entry, NULL, &kernel_high,
>                   0, EM_RISCV, 1, 0) < 0) {
> -        error_report("qemu: could not load kernel '%s'", kernel_filename=
);
> +        error_report("could not load kernel '%s'", kernel_filename);
>          exit(1);
>      }
>      return kernel_entry;
> @@ -91,7 +91,7 @@ static hwaddr load_initrd(const char *filename, uint64_=
t mem_size,
>      if (size =3D=3D -1) {
>          size =3D load_image_targphys(filename, *start, mem_size - *start=
);
>          if (size =3D=3D -1) {
> -            error_report("qemu: could not load ramdisk '%s'", filename);
> +            error_report("could not load ramdisk '%s'", filename);
>              exit(1);
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dLXnlYbDJNCwF3YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlukP/0ACgkQbDjKyiDZ
s5It7xAAv0CJy4TLonK33ygXOr0eCMU5P09WMDlcoGzBLnoKaelpzZCkZmq0GPsR
sxbGMMASwWZC13VbAqgULlOmu5+ZbhH9K166uBxrFmED9DcAPHG3ehe7+0xnyQUm
eyutrRdjATV+W8FRMfIaxy5VW6nSFmyaiB76uw3k2nkzKDfG+1v8A97Oy6jRLqU2
JiuIIGJ4enISyYCQcKEwaucijYpsa1o3iRixMybuZ/Kzis2Lo07N3lpTHVLUeR/A
VYlIeFX2OH4njRbVoQnxDp9YiXiroki7/N+iBDwfx1n1rhsXDPa3mzdQtphIg8Mv
Bqmjh1SGKhGCKOnGcreONRHtLtyVAsaCWd1zIJqCugO26eoCXoZ5cc6rgwDeVNwH
kgNwaI09rq6IOX61Te3kebOgGQbxq3Gmiuon7iZBHMKkVGJgrdmgK7G2lxYhfB2U
Bp0Ql1ux9MKWz1FoNVuXPHCPeBLNXgWy5sa+7y8nasRAcSPMRDdCtV3RWNtTYpVa
9fPiKe+RO2kdqBoKeYYY1MmF2ND36vD114o54hX/kzUC/WN1D8Qil3eNkj62wbWS
w77VMVXt//QxfXSHVgfH5UmnA6TL6q0Etx1VC7NjpWhUbJG9jub+vSBWWIUY94Q4
eReDNSsS7kJF7BCcpBqN+6l1VFQ3vZ7M2TWRJjvXR7yId/F4aRg=
=rvgt
-----END PGP SIGNATURE-----

--dLXnlYbDJNCwF3YM--

