Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duyMI-0002Cc-OB
	for mharc-qemu-trivial@gnu.org; Thu, 21 Sep 2017 06:05:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1duyM8-00025K-Jk
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 06:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1duyM7-0007E4-Cu
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 06:05:16 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:57707
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1duyLr-0006Nn-UE; Thu, 21 Sep 2017 06:05:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A56868234D;
	Thu, 21 Sep 2017 12:04:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UuSRIKmLEqm; Thu, 21 Sep 2017 12:04:56 +0200 (CEST)
Received: from wifi-guest-96.act-europe.fr (wifi-guest-96.act-europe.fr
	[10.10.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 27C928232E;
	Thu, 21 Sep 2017 12:04:56 +0200 (CEST)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, frederic.konrad@adacore.com
Date: Thu, 21 Sep 2017 12:04:20 +0200
Message-Id: <1505988260-8483-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: [Qemu-trivial] [PATCH] memory: avoid a name clash with access macro
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
X-List-Received-Date: Thu, 21 Sep 2017 10:05:22 -0000

This avoids a name clash with the access macro on windows 64:

make
	CHK version_gen.h
  CC      aarch64-softmmu/memory.o
/home/konrad/qemu/memory.c: In function 'access_with_adjusted_size':
/home/konrad/qemu/memory.c:591:73: error: macro "access" passed 7 arguments, \
                         but takes just 2
                         (size - access_size - i) * 8, access_mask, attrs);
                                                                         ^

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 memory.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/memory.c b/memory.c
index b9920a6..2b90117 100644
--- a/memory.c
+++ b/memory.c
@@ -560,13 +560,14 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                                       unsigned size,
                                       unsigned access_size_min,
                                       unsigned access_size_max,
-                                      MemTxResult (*access)(MemoryRegion *mr,
-                                                            hwaddr addr,
-                                                            uint64_t *value,
-                                                            unsigned size,
-                                                            unsigned shift,
-                                                            uint64_t mask,
-                                                            MemTxAttrs attrs),
+                                      MemTxResult (*access_fn)
+                                                  (MemoryRegion *mr,
+                                                   hwaddr addr,
+                                                   uint64_t *value,
+                                                   unsigned size,
+                                                   unsigned shift,
+                                                   uint64_t mask,
+                                                   MemTxAttrs attrs),
                                       MemoryRegion *mr,
                                       MemTxAttrs attrs)
 {
@@ -587,12 +588,12 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     access_mask = -1ULL >> (64 - access_size * 8);
     if (memory_region_big_endian(mr)) {
         for (i = 0; i < size; i += access_size) {
-            r |= access(mr, addr + i, value, access_size,
+            r |= access_fn(mr, addr + i, value, access_size,
                         (size - access_size - i) * 8, access_mask, attrs);
         }
     } else {
         for (i = 0; i < size; i += access_size) {
-            r |= access(mr, addr + i, value, access_size, i * 8,
+            r |= access_fn(mr, addr + i, value, access_size, i * 8,
                         access_mask, attrs);
         }
     }
-- 
1.8.3.1


