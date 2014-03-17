Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPm5u-0003uV-K5
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 00:57:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPQ-0007SY-JB
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPL-0000ay-2m
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:24 -0400
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:53805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfP9-0000ZD-Sf; Mon, 17 Mar 2014 17:49:07 -0400
Received: from [149.241.50.80] (helo=kentang.lan)
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfP3-0000rn-8Y; Mon, 17 Mar 2014 21:49:07 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 17 Mar 2014 21:46:26 +0000
Message-Id: <1395092786-12641-3-git-send-email-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
References: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 149.241.50.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
X-Mailman-Approved-At: Tue, 18 Mar 2014 00:57:40 -0400
Subject: [Qemu-trivial] [PATCH 2/2] doc: update default PowerPC framebuffer
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
X-List-Received-Date: Mon, 17 Mar 2014 21:49:30 -0000

Since 1.7, the default framebuffer settings for PowerPC are 800x600x32.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: qemu-ppc@nongnu.org
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


