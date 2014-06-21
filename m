Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyVe6-0006jm-4m
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 20:28:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bernhardu@vr-web.de>) id 1WyLLs-0001De-UN
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 09:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bernhardu@vr-web.de>) id 1WyLLn-0000ve-Ig
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 09:29:04 -0400
Received: from mx0.vr-web.de ([195.200.35.198]:52001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bernhardu@vr-web.de>)
	id 1WyLLb-0000rn-6I; Sat, 21 Jun 2014 09:28:47 -0400
Received: from [192.168.178.25] (p54BED5C8.dip0.t-ipconnect.de
	[::ffff:84.190.213.200])
	(QVVUSDogUExBSU4gYmVybmhhcmR1LCBUTFM6IFRMU3YxL1NTTHYzLDEyOGJpdHMsREhFLVJTQS1B)
	by mx0.vr-web.de with ESMTPSA; Sat, 21 Jun 2014 15:28:19 +0200
	id 000000000000089E.0000000053A58878.00004F98
Message-ID: <53A58863.7040004@vr-web.de>
Date: Sat, 21 Jun 2014 15:28:03 +0200
From: =?ISO-8859-15?Q?Bernhard_=DCbelacker?= <bernhardu@vr-web.de>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_vrw-f-02-21149-1403357327-0001-2"
To: qemu-devel@nongnu.org
X-Enigmail-Version: 1.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.200.35.198
X-Mailman-Approved-At: Sat, 21 Jun 2014 20:28:32 -0400
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [Qemu-trivial] [PATCH-trivial] Grub fails to boot from internal
 TFTP server when loading more than 3 initrd files.
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
X-List-Received-Date: Sat, 21 Jun 2014 13:29:10 -0000

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_vrw-f-02-21149-1403357327-0001-2
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-Mime-Autoconverted: from 8bit to quoted-printable by courier 0.69.0

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- From a5c3977f133faa8d7e403005325014f114234307 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Bernhard=3D20=3DC3=3D9Cbelacker?=3D <bernhardu@vr-web.d=
e>
Date: Sat, 21 Jun 2014 15:26:05 +0200
Subject: Increase maximum number of session of the internal TFTP server.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Grub fails to boot from internal TFTP server when loading more than 3 ini=
trd files.

Grub first opens a session to the TFTP server for every initrd file and
retrieves only the file size for all.
Then it wants to download the content using the old sessions which are
already expired.

Increasing the maximum number of session of the internal TFTP
server avoids this issue.

The error message reads as following:
error: timeout reading
`/boot/ISO.ROOT/BOOTMGR'.

Press any key to continue...

Signed-off-by: Bernhard =DCbelacker <bernhardu@vr-web.de>
- ---
 slirp/tftp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp/tftp.h b/slirp/tftp.h
index 87adeb5..e1cc24b 100644
- --- a/slirp/tftp.h
+++ b/slirp/tftp.h
@@ -2,7 +2,7 @@
 #ifndef SLIRP_TFTP_H
 #define SLIRP_TFTP_H 1
=20
- -#define TFTP_SESSIONS_MAX 3
+#define TFTP_SESSIONS_MAX 20
=20
 #define TFTP_SERVER=0969
=20
- --=20
2.0.0

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTpYhaAAoJEOlvol+DpkHmm7gH/RLFNo4Xmkyj160C9lmOs9t3
rsAoyk0RA3ao+36xQZKBZ9yIuvRdVh3vHSIROpMm88ZP/0ZFOqDbU+rLMKkZNHTz
E0iNk+zqco64yp2Ar7dtGnyLHcH4H9Xwc4w6herPYj4sU4NDl3OAIZdF5+h+0HVk
JgiR+ZtLrGMBamAzF36rnc8n8SWnLszV2CvkvVoBjzCqs9Ix+Bx2oByTkqBC6W9J
k9byJn72O4PrBzEXdBc4NgOoHQLyEWQd55sYobowignvXhMvH5fQNsnXDZEXl5vB
GmctMesy5kymSf+0qwElx8eNGyF8suGRwhQKppxEcqsC+WaR3AUGjzXCPGXvjp4=3D
=3DCY5R
-----END PGP SIGNATURE-----

--=_vrw-f-02-21149-1403357327-0001-2
Content-Type: text/x-patch; name="0001-Increase-maximum-number-of-session-of-the-internal-T.patch"; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-Increase-maximum-number-of-session-of-the-internal-T.pa";
 filename*1="tch"
X-Mime-Autoconverted: from 8bit to quoted-printable by courier 0.69.0

From a5c3977f133faa8d7e403005325014f114234307 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Bernhard=3D20=3DC3=3D9Cbelacker?=3D <bernhardu@vr-web.d=
e>
Date: Sat, 21 Jun 2014 15:26:05 +0200
Subject: Increase maximum number of session of the internal TFTP server.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Grub fails to boot from internal TFTP server when loading more than 3 ini=
trd files.

Grub first opens a session to the TFTP server for every initrd file and
retrieves only the file size for all.
Then it wants to download the content using the old sessions which are
already expired.

Increasing the maximum number of session of the internal TFTP
server avoids this issue.

The error message reads as following:
error: timeout reading
`/boot/ISO.ROOT/BOOTMGR'.

Press any key to continue...

Signed-off-by: Bernhard =C3=9Cbelacker <bernhardu@vr-web.de>
---
 slirp/tftp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp/tftp.h b/slirp/tftp.h
index 87adeb5..e1cc24b 100644
--- a/slirp/tftp.h
+++ b/slirp/tftp.h
@@ -2,7 +2,7 @@
 #ifndef SLIRP_TFTP_H
 #define SLIRP_TFTP_H 1
=20
-#define TFTP_SESSIONS_MAX 3
+#define TFTP_SESSIONS_MAX 20
=20
 #define TFTP_SERVER=0969
=20
--=20
2.0.0


--=_vrw-f-02-21149-1403357327-0001-2
Content-Type: application/pgp-signature; name="0001-Increase-maximum-number-of-session-of-the-internal-T.patch.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="0001-Increase-maximum-number-of-session-of-the-internal-T.pa";
 filename*1="tch.sig"

iQEcBAABAgAGBQJTpYhjAAoJEOlvol+DpkHmCV4IAMSAgRGZpF43DdpBSBQYjgv9t68nxrK+
feaqPqU2VdXNxKucWWk+LCiPZ+BQK6vFulvmrMlxC9/YYYH41CcXfw9kKukA26H5q3ZEVMgN
VoNE+6U9/0vpl3v6PchNLL7QqWI1DIcAu7VoaUDRLlj40HLrAVu71BVuS+dGqW015vA38WQ0
uuh++Hn6LeMCKZAkAwEd5uSvGBt5X1VNOMhqOzr2tevMs9Tp/oNlDDaOEjn3hSF31ur0qbk0
6H2lusHM25agtiIqjomWyS+Ked8MHP7YpltUlG6qoTnBO8mjiH237HRmfoMtMhIvTCnxeARm
Q3LugKMQIgNN66jGEKn7k8E=
--=_vrw-f-02-21149-1403357327-0001-2--

