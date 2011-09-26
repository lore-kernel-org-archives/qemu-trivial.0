Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R87Wf-0000Dt-7z
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 05:31:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R87Wc-0000Dj-O8
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 05:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R87WW-0001zm-T7
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 05:30:58 -0400
Received: from thoth.sbs.de ([192.35.17.2]:18649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1R87WW-0001zZ-AL; Mon, 26 Sep 2011 05:30:52 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p8Q9Un7L030609;
	Mon, 26 Sep 2011 11:30:49 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p8Q9Unw9010380;
	Mon, 26 Sep 2011 11:30:49 +0200
Message-ID: <4E804649.7010100@siemens.com>
Date: Mon, 26 Sep 2011 11:30:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] lsi: Fix tag reference in debug print
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
X-List-Received-Date: Mon, 26 Sep 2011 09:30:59 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/lsi53c895a.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/lsi53c895a.c b/hw/lsi53c895a.c
index 75a03a7..e077ec0 100644
--- a/hw/lsi53c895a.c
+++ b/hw/lsi53c895a.c
@@ -697,7 +697,7 @@ static int lsi_queue_req(LSIState *s, SCSIRequest *req, uint32_t len)
         lsi_reselect(s, p);
         return 0;
     } else {
-        DPRINTF("Queueing IO tag=0x%x\n", tag);
+        DPRINTF("Queueing IO tag=0x%x\n", p->tag);
         p->pending = len;
         return 1;
     }
-- 
1.7.3.4

