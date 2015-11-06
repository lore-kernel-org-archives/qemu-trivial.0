Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSn-0005XU-Ah
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSk-0005Rk-FW
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSj-0001YK-Jh
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSa-0001S5-E8; Fri, 06 Nov 2015 07:49:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A4A540DD0;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5842EAD7;
	Fri,  6 Nov 2015 15:44:06 +0300 (MSK)
Received: (nullmailer pid 31705 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:53 +0300
Message-Id: <9f503153c78a23bcd44409cea64442c4ecd82ea5.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 16/24] configure: remove help string for
	'vnc-tls' option
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
X-List-Received-Date: Fri, 06 Nov 2015 12:49:51 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

The '--enable-vnc-tls' option to configure was removed in

  commit 3e305e4a4752f70c0b5c3cf5b43ec957881714f7
  Author: Daniel P. Berrange <berrange@redhat.com>
  Date:   Thu Aug 6 14:39:32 2015 +0100

    ui: convert VNC server to use QCryptoTLSSession

This removes the corresponding help string.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 60cbd84..b687764 100755
--- a/configure
+++ b/configure
@@ -1348,7 +1348,6 @@ disabled with --disable-FEATURE, default is enabled if available:
   vte             vte support for the gtk UI
   curses          curses UI
   vnc             VNC UI support
-  vnc-tls         TLS encryption for VNC server
   vnc-sasl        SASL encryption for VNC server
   vnc-jpeg        JPEG lossy compression for VNC server
   vnc-png         PNG compression for VNC server
-- 
2.1.4


