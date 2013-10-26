Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Kg-0006XX-PP
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:38:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Ka-0006N2-UB
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0KW-0001BK-8s
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:38:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0KM-00014F-Pe; Sat, 26 Oct 2013 05:38:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93DBE4390F;
	Sat, 26 Oct 2013 13:38:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 52E50530;
	Sat, 26 Oct 2013 13:32:28 +0400 (MSK)
Received: (nullmailer pid 19653 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:27 +0400
Message-Id: <1382779887-15971-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>
Subject: [Qemu-trivial] [PULL 7/7] audio/mixeng_template.h: fix inline
	declaration
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
X-List-Received-Date: Sat, 26 Oct 2013 09:38:57 -0000

From: Alex Bligh <alex@alex.org.uk>

Fix error: =E2=80=98inline=E2=80=99 is not at beginning of declaration
[-Werror=3Dold-style-declaration]

Signed-off-by: Alex Bligh <alex@alex.org.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 audio/mixeng_template.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/mixeng_template.h b/audio/mixeng_template.h
index 30849a6..77cc89b 100644
--- a/audio/mixeng_template.h
+++ b/audio/mixeng_template.h
@@ -35,7 +35,7 @@
 #define IN_T glue (glue (ITYPE, BSIZE), _t)
=20
 #ifdef FLOAT_MIXENG
-static mixeng_real inline glue (conv_, ET) (IN_T v)
+static inline mixeng_real glue (conv_, ET) (IN_T v)
 {
     IN_T nv =3D ENDIAN_CONVERT (v);
=20
@@ -54,7 +54,7 @@ static mixeng_real inline glue (conv_, ET) (IN_T v)
 #endif
 }
=20
-static IN_T inline glue (clip_, ET) (mixeng_real v)
+static inline IN_T glue (clip_, ET) (mixeng_real v)
 {
     if (v >=3D 0.5) {
         return IN_MAX;
--=20
1.7.10.4


