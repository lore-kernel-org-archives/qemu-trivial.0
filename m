Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtjbE-0005la-94
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 20:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Sandra_Loosemore@mentor.com>) id 1gtfuF-0005ZR-FW
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 16:47:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Sandra_Loosemore@mentor.com>) id 1gtfuD-0004dj-AU
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 16:47:55 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:63008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Sandra_Loosemore@mentor.com>)
	id 1gtfu9-00047A-Es; Tue, 12 Feb 2019 16:47:53 -0500
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gtftk-0004R3-1J from Sandra_Loosemore@mentor.com ;
	Tue, 12 Feb 2019 13:47:24 -0800
Received: from anura.Home (147.34.91.1) by svr-orw-mbx-03.mgc.mentorg.com
	(147.34.90.203) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Tue, 12 Feb 2019 13:47:21 -0800
From: Sandra Loosemore <sandra@codesourcery.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>
Date: Tue, 12 Feb 2019 14:47:13 -0700
Message-ID: <1550008033-26540-1-git-send-email-sandra@codesourcery.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
X-Mailman-Approved-At: Tue, 12 Feb 2019 20:44:31 -0500
Subject: [Qemu-trivial] [PATCH] gdbstub: Send a reply to the vKill packet.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2019 21:47:56 -0000

Per the GDB remote protocol documentation

https://sourceware.org/gdb/current/onlinedocs/gdb/Packets.html#index-vKill-packet

the debug stub is expected to send a reply to the 'vKill' packet.  At
least some versions of GDB crash if the gdb stub simply exits without
sending a reply.  This patch fixes QEMU's gdb stub to conform to the
expected behavior.

Note that QEMU's existing handling of the legacy 'k' packet is
correct: in that case GDB does not expect a reply, and QEMU does not
send one.

Signed-off-by: Sandra Loosemore <sandra@codesourcery.com>
---
 gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub.c b/gdbstub.c
index 70cf330..eb129f6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1363,6 +1363,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             break;
         } else if (strncmp(p, "Kill;", 5) == 0) {
             /* Kill the target */
+            put_packet(s, "OK");
             error_report("QEMU: Terminated via GDBstub");
             exit(0);
         } else {
-- 
2.8.1


