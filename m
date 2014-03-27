Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTDTo-0008D3-04
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTh-00081D-Ol
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTb-0006cA-Lx
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTDTI-0006UK-9k; Thu, 27 Mar 2014 12:48:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 48BC643740;
	Thu, 27 Mar 2014 20:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E8114673;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: (nullmailer pid 1781 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:13 +0400
Message-Id: <1395934108-1694-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [Qemu-trivial] [PULL 08/23] doc: update default PowerPC framebuffer
	settings
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
X-List-Received-Date: Thu, 27 Mar 2014 16:48:34 -0000

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since 1.7, the default framebuffer settings for PowerPC are 800x600x32.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: qemu-ppc@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 6d684e2..e6e20eb 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1938,7 +1938,7 @@ The following options are specific to the PowerPC emulation:
 
 @item -g @var{W}x@var{H}[x@var{DEPTH}]
 
-Set the initial VGA graphic mode. The default is 800x600x15.
+Set the initial VGA graphic mode. The default is 800x600x32.
 
 @item -prom-env @var{string}
 
-- 
1.7.10.4


