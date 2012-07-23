Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StH46-00039o-D2
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 07:44:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1StH44-00039h-7F
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 07:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1StH43-0006v6-8B
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 07:44:40 -0400
Received: from goliath.siemens.de ([192.35.17.28]:25561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1StH42-0006uu-Ux; Mon, 23 Jul 2012 07:44:39 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q6NBiZhD014822;
	Mon, 23 Jul 2012 13:44:36 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q6NBiZ7m019776;
	Mon, 23 Jul 2012 13:44:35 +0200
Message-ID: <500D3923.7060306@siemens.com>
Date: Mon, 23 Jul 2012 13:44:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 1/2] usb: Clean common object and dependency
	files
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
X-List-Received-Date: Mon, 23 Jul 2012 11:44:41 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index ab82ef3..1b3882a 100644
--- a/Makefile
+++ b/Makefile
@@ -218,7 +218,7 @@ clean:
 	rm -Rf .libs
 	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
 	rm -f qom/*.o qom/*.d
-	rm -f usb/*.o usb/*.d hw/*.o hw/*.d
+	rm -f hw/usb/*.o hw/usb/*.d hw/*.o hw/*.d
 	rm -f qemu-img-cmds.h
 	rm -f trace/*.o trace/*.d
 	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
-- 
1.7.3.4

