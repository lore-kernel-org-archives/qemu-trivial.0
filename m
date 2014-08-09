Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XG7Hk-0002q9-NC
	for mharc-qemu-trivial@gnu.org; Sat, 09 Aug 2014 10:06:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1XG7Hd-0002oM-I7
	for qemu-trivial@nongnu.org; Sat, 09 Aug 2014 10:06:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1XG7HX-0005nK-Ke
	for qemu-trivial@nongnu.org; Sat, 09 Aug 2014 10:06:09 -0400
Received: from mout.web.de ([212.227.15.14]:58369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1XG7HX-0005kD-B9; Sat, 09 Aug 2014 10:06:03 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb003) with ESMTPSA (Nemesis) id 0LkPmd-1WiyFs2izb-00cNa6;
	Sat, 09 Aug 2014 16:05:55 +0200
Message-ID: <53E62ABF.2000104@web.de>
Date: Sat, 09 Aug 2014 16:05:51 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WeraHd6ANJIduMc7W9VG8rK288X96xxp4"
X-Provags-ID: V03:K0:91uXJRxLtm6VtejdZQy804vXzvyraTjSzj9+rI7pCQv2UftnVY2
	mnqK+YNQ5VKd50K2jCL6Htaq2Ty2stxgBncZv6O6hQAOscJPSaAL8HEPOwSZZRrqeOpdgW8
	ub9ye0luCPbfT2xXzVAwqgLxm10Ij706+++N3TmLmoLwnjWA71vYMNbFfgsQ/ZhP1Iipf0J
	yW5u1UN0Z8UVfs2e95Etw==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.14
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] apic: Fix reported DFR content
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
X-List-Received-Date: Sat, 09 Aug 2014 14:06:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WeraHd6ANJIduMc7W9VG8rK288X96xxp4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

From: Jan Kiszka <jan.kiszka@siemens.com>

IA-32 SDM, Figure 10-14: Bits 27:0 are reserved as 1.

Fixes Jailhouse hypervisor start with in-kernel irqchips off.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/intc/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index ef19e55..03ff9e9 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -698,7 +698,7 @@ static uint32_t apic_mem_readl(void *opaque, hwaddr a=
ddr)
         val =3D s->log_dest << 24;
         break;
     case 0x0e:
-        val =3D s->dest_mode << 28;
+        val =3D (s->dest_mode << 28) | 0xfffffff;
         break;
     case 0x0f:
         val =3D s->spurious_vec;
--=20
1.8.1.1.298.ge7eed54


--WeraHd6ANJIduMc7W9VG8rK288X96xxp4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlPmKsIACgkQitSsb3rl5xTNIACeJyC6t41bcG1ubnS04XhaR4Hx
wUQAoNBi2nuKkHCvgsatlXnIPMBlOZfP
=SRgw
-----END PGP SIGNATURE-----

--WeraHd6ANJIduMc7W9VG8rK288X96xxp4--

