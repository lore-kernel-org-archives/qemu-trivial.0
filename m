Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRf-00080F-OD
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRZ-0007nV-5D
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRU-0001Y7-1V
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRH-0001Ot-9B; Tue, 24 Jun 2014 12:19:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1643D44088;
	Tue, 24 Jun 2014 20:19:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9E7DF6BE;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15636 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:19 +0400
Message-Id: <1403626160-15546-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@vr-web.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/14] Increase maximum number of session of
	the internal TFTP server.
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:42 -0000

From: Bernhard =C3=9Cbelacker <bernhardu@vr-web.de>

Grub fails to boot from internal TFTP server when loading more than
3 initrd files.

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/tftp.h |    2 +-
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
 #define TFTP_SERVER	69
=20
--=20
1.7.10.4


