Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RtHqW-0003BT-PW
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2012 07:02:28 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RtHqO-0003Ag-JK
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2012 07:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RtHqE-0008Tw-VV
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2012 07:02:20 -0500
Received: from thoth.sbs.de ([192.35.17.2]:31618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RtHqE-0008Tr-EH; Fri, 03 Feb 2012 07:02:10 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id q13C27aw015114;
	Fri, 3 Feb 2012 13:02:07 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q13C25Om021403;
	Fri, 3 Feb 2012 13:02:05 +0100
Message-ID: <4F2BCCBD.8050009@siemens.com>
Date: Fri, 03 Feb 2012 13:02:05 +0100
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
X-Received-From: 192.35.17.2
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
Subject: [Qemu-trivial] [PATCH] memory-region: Report if region is read-only
	on info mtree
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
X-List-Received-Date: Fri, 03 Feb 2012 12:02:27 -0000

Helpful to understand guest configurations of things like the i440FX's
PAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 memory.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/memory.c b/memory.c
index ee4c98a..ea4adda 100644
--- a/memory.c
+++ b/memory.c
@@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function mon_printf, void *f,
             ml->printed = false;
             QTAILQ_INSERT_TAIL(alias_print_queue, ml, queue);
         }
-        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d): alias %s @%s "
+        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d, %s): alias %s @%s "
                    TARGET_FMT_plx "-" TARGET_FMT_plx "\n",
                    base + mr->addr,
                    base + mr->addr
                    + (target_phys_addr_t)int128_get64(mr->size) - 1,
                    mr->priority,
+                   mr->readonly ? "RO" : "RW",
                    mr->name,
                    mr->alias->name,
                    mr->alias_offset,
                    mr->alias_offset
                    + (target_phys_addr_t)int128_get64(mr->size) - 1);
     } else {
-        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d): %s\n",
+        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d, %s): %s\n",
                    base + mr->addr,
                    base + mr->addr
                    + (target_phys_addr_t)int128_get64(mr->size) - 1,
                    mr->priority,
+                   mr->readonly ? "RO" : "RW",
                    mr->name);
     }
 
-- 
1.7.3.4

