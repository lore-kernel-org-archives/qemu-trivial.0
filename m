Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3r7l-0003SI-4Y
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r7e-0003KO-QW
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:52:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r7Z-0004ef-Nz
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:52:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3r7P-0004Zv-0m; Thu, 16 Jan 2014 12:52:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CECEB415C1;
	Thu, 16 Jan 2014 21:52:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E59E1634;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16399 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:14 +0400
Message-Id: <1389893719-16336-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	David du Colombier <0intro@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/11] ide: cmd_exec_dev_diagnostic() always
	set error register to 0x01
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
X-List-Received-Date: Thu, 16 Jan 2014 17:52:59 -0000

From: David du Colombier <0intro@gmail.com>

This notably fix IDE CD probing on the Plan 9 operating system,
which rely on the error register set by the Execute Device
Diagnostic command to detect drive configurations.

Thanks to R=C3=A9mi Pommarel for reporting this issue.

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/core.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index e1f4c33..7783d58 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1321,6 +1321,7 @@ static bool cmd_exec_dev_diagnostic(IDEState *s, ui=
nt8_t cmd)
         s->status =3D 0; /* ATAPI spec (v6) section 9.10 defines packet
                         * devices to return a clear status register
                         * with READY_STAT *not* set. */
+        s->error =3D 0x01;
     } else {
         s->status =3D READY_STAT | SEEK_STAT;
         /* The bits of the error register are not as usual for this comm=
and!
--=20
1.7.10.4


