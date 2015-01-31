Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHUMx-0006IY-LJ
	for mharc-qemu-trivial@gnu.org; Sat, 31 Jan 2015 04:29:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YHUMv-0006IP-Kh
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 04:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1YHUMs-0005pQ-C6
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 04:29:33 -0500
Received: from mout.web.de ([212.227.15.4]:64441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1YHUMs-0005pK-2u; Sat, 31 Jan 2015 04:29:30 -0500
Received: from md1f2u6c.ww002.siemens.net ([95.157.58.223]) by smtp.web.de
	(mrweb002) with ESMTPSA (Nemesis) id 0MTgum-1Y8iuO3DkW-00QQcN;
	Sat, 31 Jan 2015 10:29:28 +0100
Message-ID: <54CCA077.7020107@web.de>
Date: Sat, 31 Jan 2015 10:29:27 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <54CCA038.8000704@web.de>
In-Reply-To: <54CCA038.8000704@web.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="RW4DrabutaOk8PA689jFp5QxdweG6213t"
X-Provags-ID: V03:K0:nyegWVobSEnOILDUdAyItblzC844HHz1izSTu8oPz3ifxWbW8rM
	pdE26Ia2B4NSllvXtutcxlS0gOlxmg7fWHwHbTWz7j6vCua7LQe9nd0IWluu/bImZGMUw5A
	awJUIiWIwHlJYbqjcum7kHMqDTcHQYFOkeC1d4sg6C15SeSBQvLdAKJaF9RT2rBtRnBgsbP
	zLEFe4u6jQuGNlrlxxiMA==
X-UI-Out-Filterresults: notjunk:1;
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.4
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 2/2] Revert "gdbstub: Do not kill target in
 system emulation mode"
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
X-List-Received-Date: Sat, 31 Jan 2015 09:29:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RW4DrabutaOk8PA689jFp5QxdweG6213t
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

From: Fabien Chouteau <chouteau@adacore.com>

The requirements described in this patch are implemented by "Add GDB
qAttached support".

This reverts commit 00e94dbc7fd0110b0555d59592b004333adfb4b8.

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 gdbstub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index da3e7cb..14e1f0c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -880,11 +880,9 @@ static int gdb_handle_packet(GDBState *s, const char=
 *line_buf)
             goto unknown_command;
         }
     case 'k':
-#ifdef CONFIG_USER_ONLY
         /* Kill the target */
         fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
         exit(0);
-#endif
     case 'D':
         /* Detach packet */
         gdb_breakpoint_remove_all();
--=20
2.1.4


--RW4DrabutaOk8PA689jFp5QxdweG6213t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTMoHcACgkQitSsb3rl5xT1fwCfXSj1N8PZRVLs1eZ896nvMX2T
3coAnidsdhYlb+C/WXJ6Jqy5/pBtg5D9
=9q1w
-----END PGP SIGNATURE-----

--RW4DrabutaOk8PA689jFp5QxdweG6213t--

