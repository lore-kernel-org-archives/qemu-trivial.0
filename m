Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvQw-0003Q0-3M
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 16:03:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQq-00037s-9Y
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQo-00011F-2Q
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:40 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvQi-0000zK-Th; Fri, 10 Aug 2012 16:03:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6E7017280031; Fri, 10 Aug 2012 22:03:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id P-tl0Yc982lY; Fri, 10 Aug 2012 22:03:32 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2075872800CC; Fri, 10 Aug 2012 22:03:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 22:03:27 +0200
Message-Id: <1344629007-23311-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] srp: Don't use QEMU_PACKED for single
	elements of a structured type
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
X-List-Received-Date: Fri, 10 Aug 2012 20:03:41 -0000

QEMU_PACKED results in a MinGW compiler warning when it is
used for single structure elements:

warning: 'gcc_struct' attribute ignored

Using QEMU_PACKED for the whole structure avoids the compiler warning
without changing the memory layout.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/srp.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/srp.h b/hw/srp.h
index 3009bd5..5e0cad5 100644
--- a/hw/srp.h
+++ b/hw/srp.h
@@ -177,13 +177,13 @@ struct srp_tsk_mgmt {
     uint8_t    reserved1[6];
     uint64_t   tag;
     uint8_t    reserved2[4];
-    uint64_t   lun QEMU_PACKED;
+    uint64_t   lun;
     uint8_t    reserved3[2];
     uint8_t    tsk_mgmt_func;
     uint8_t    reserved4;
     uint64_t   task_tag;
     uint8_t    reserved5[8];
-};
+} QEMU_PACKED;
 
 /*
  * We need the packed attribute because the SRP spec only aligns the
@@ -198,14 +198,14 @@ struct srp_cmd {
     uint8_t    data_in_desc_cnt;
     uint64_t   tag;
     uint8_t    reserved2[4];
-    uint64_t   lun QEMU_PACKED;
+    uint64_t   lun;
     uint8_t    reserved3;
     uint8_t    task_attr;
     uint8_t    reserved4;
     uint8_t    add_cdb_len;
     uint8_t    cdb[16];
     uint8_t    add_data[0];
-};
+} QEMU_PACKED;
 
 enum {
     SRP_RSP_FLAG_RSPVALID = 1 << 0,
-- 
1.7.0.4


