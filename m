Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StH4c-00045n-Pt
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 07:45:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1StH4X-00042g-9P
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 07:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1StH4Q-00070x-TH
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 07:45:09 -0400
Received: from goliath.siemens.de ([192.35.17.28]:25760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1StH4Q-00070S-KL; Mon, 23 Jul 2012 07:45:02 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q6NBj10Z015325;
	Mon, 23 Jul 2012 13:45:01 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q6NBj1cY020361;
	Mon, 23 Jul 2012 13:45:01 +0200
Message-ID: <500D393D.9060505@siemens.com>
Date: Mon, 23 Jul 2012 13:45:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <500D3923.7060306@siemens.com>
In-Reply-To: <500D3923.7060306@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 2/2] qom: Clean libuser object and dependency
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
X-List-Received-Date: Mon, 23 Jul 2012 11:45:13 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1b3882a..964e592 100644
--- a/Makefile
+++ b/Makefile
@@ -217,7 +217,7 @@ clean:
 	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
 	rm -Rf .libs
 	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
-	rm -f qom/*.o qom/*.d
+	rm -f qom/*.o qom/*.d libuser/qom/*.o libuser/qom/*.d
 	rm -f hw/usb/*.o hw/usb/*.d hw/*.o hw/*.d
 	rm -f qemu-img-cmds.h
 	rm -f trace/*.o trace/*.d
-- 
1.7.3.4

