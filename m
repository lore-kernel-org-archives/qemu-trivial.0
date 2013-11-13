Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vga4s-0000WH-RV
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:01:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4l-0000Hp-Ba
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4g-0006wy-I6
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vga4T-0006qZ-N3; Wed, 13 Nov 2013 08:01:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B74A541755;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9E10A528;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: (nullmailer pid 16032 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:05 +0400
Message-Id: <1384347680-15976-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/16] qemu-char: add Czech characters to VNC
	keysyms
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
X-List-Received-Date: Wed, 13 Nov 2013 13:01:48 -0000

From: Jan Krupa <JKrupa@suse.com>

This patch adds missing Czech characters to the VNC keysym table.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc_keysym.h |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ui/vnc_keysym.h b/ui/vnc_keysym.h
index 6250bec..72c01d1 100644
--- a/ui/vnc_keysym.h
+++ b/ui/vnc_keysym.h
@@ -224,6 +224,14 @@ static const name2keysym_t name2keysym[]={
 { "odoubleacute",         0x1f5},
 { "udoubleacute",         0x1fb},
 
+/* Czech national characters */
+{ "ecaron",               0x1ec},
+{ "scaron",               0x1b9},
+{ "ccaron",               0x1e8},
+{ "rcaron",               0x1f8},
+{ "zcaron",               0x1be},
+{ "uring",                0x1f9},
+
     /* modifiers */
 {"ISO_Level3_Shift", 0xfe03}, /* XK_ISO_Level3_Shift */
 {"Control_L", 0xffe3}, /* XK_Control_L */
-- 
1.7.10.4


