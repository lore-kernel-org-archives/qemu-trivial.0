Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R4s5c-0000q2-BF
	for mharc-qemu-trivial@gnu.org; Sat, 17 Sep 2011 06:25:40 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R4s5Z-0000h0-Mw
	for qemu-trivial@nongnu.org; Sat, 17 Sep 2011 06:25:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R4s5Y-0005Zb-Eu
	for qemu-trivial@nongnu.org; Sat, 17 Sep 2011 06:25:37 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R4s5W-0005Yk-4G; Sat, 17 Sep 2011 06:25:34 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6EDB77281BE8; Sat, 17 Sep 2011 12:25:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id c8qmI6SZ2ww1; Sat, 17 Sep 2011 12:25:31 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9E4F87281BF2; Sat, 17 Sep 2011 12:25:31 +0200 (CEST)
From: Stefan Weil <weil@mail.berlios.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Sep 2011 12:25:30 +0200
Message-Id: <1316255130-31646-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Remove qemu_host_page_bits
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
X-List-Received-Date: Sat, 17 Sep 2011 10:25:38 -0000

It was introduced with commit 54936004fddc52c321cb3f9a9a51140e782bed5d
as host_page_bits but never used.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 cpu-all.h |    1 -
 exec.c    |    4 ----
 2 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/cpu-all.h b/cpu-all.h
index 3532026..e8143cd 100644
--- a/cpu-all.h
+++ b/cpu-all.h
@@ -290,7 +290,6 @@ extern unsigned long reserved_va;
 
 /* ??? These should be the larger of unsigned long and target_ulong.  */
 extern unsigned long qemu_real_host_page_size;
-extern unsigned long qemu_host_page_bits;
 extern unsigned long qemu_host_page_size;
 extern unsigned long qemu_host_page_mask;
 
diff --git a/exec.c b/exec.c
index 3df6b23..639deae 100644
--- a/exec.c
+++ b/exec.c
@@ -183,7 +183,6 @@ typedef struct PageDesc {
 #define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_BITS)
 
 unsigned long qemu_real_host_page_size;
-unsigned long qemu_host_page_bits;
 unsigned long qemu_host_page_size;
 unsigned long qemu_host_page_mask;
 
@@ -275,9 +274,6 @@ static void page_init(void)
         qemu_host_page_size = qemu_real_host_page_size;
     if (qemu_host_page_size < TARGET_PAGE_SIZE)
         qemu_host_page_size = TARGET_PAGE_SIZE;
-    qemu_host_page_bits = 0;
-    while ((1 << qemu_host_page_bits) < qemu_host_page_size)
-        qemu_host_page_bits++;
     qemu_host_page_mask = ~(qemu_host_page_size - 1);
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
-- 
1.7.2.5


