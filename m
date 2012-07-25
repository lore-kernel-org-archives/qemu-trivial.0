Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SuAPt-0003IX-SG
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jul 2012 18:50:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>) id 1SuAPn-0003Gf-UD
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 18:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>) id 1SuAPj-0002HB-Kb
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 18:50:47 -0400
Received: from mail-gg0-f173.google.com ([209.85.161.173]:43577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>)
	id 1SuAPa-00022o-1e; Wed, 25 Jul 2012 18:50:34 -0400
Received: by ggnp1 with SMTP id p1so1295752ggn.4
	for <multiple recipients>; Wed, 25 Jul 2012 15:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EaNv18XOy1GoSzaBESlsqrHYixGtsQKFLAUcFcqFmp0=;
	b=ofgNQ3JM+cLokw7wsUIwl0FwukYEoM69Hsl0Fgc4+03+f3LDreNGfJnAO2WzHc6M0y
	GLhaWMS0yflO0lMV0ECHOCH55FVimoefi6RyBOAyKvJvY5/GdKzxEe/zFlBVRtEKC4gk
	6QNhVrx3gUxtECF97jngqtn323wN6lQ+F3JpuNxxXTAaMxJrYjtXQ9Fvo/7bMf7xDxvs
	1p9f9ODF+/6X1oUUtz7J3/DDE7gVJx9ZfQI+8Lnlh8zIA+PCoSE6BA0SST1x1YWaezGG
	Zl/mxa+Ja9P5iUt1bvxX0s8l33nVxdpGiMfv6fFyNRMgDWCGkjGN50EicWH0V2k1AN34
	661Q==
Received: by 10.101.60.2 with SMTP id n2mr7893842ank.29.1343256633517;
	Wed, 25 Jul 2012 15:50:33 -0700 (PDT)
Received: from localhost.localdomain (cpe-69-23-225-27.natcky.res.rr.com.
	[69.23.225.27])
	by mx.google.com with ESMTPS id i34sm19947662anm.12.2012.07.25.15.50.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 15:50:32 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Jul 2012 18:45:04 -0400
Message-Id: <1343256304-32029-2-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, Tyler Hall <tylerwhall@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] exec.c: Use subpages for large unaligned
	mappings
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
X-List-Received-Date: Wed, 25 Jul 2012 22:50:52 -0000

Registering a multi-page memory region that is non-page-aligned results
in a subpage from the start to the page boundary, some number of full
pages, and possibly another subpage from the last page boundary to the
end. The full pages will have a value for offset_within_region that is
not a multiple of TARGET_PAGE_SIZE. Accesses through softmmu are unable
to handle this and will segfault.

Handling full pages through subpages is not optimal, but only
non-page-aligned mappings take the penalty.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 exec.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 27b100c..e6ac3e7 100644
--- a/exec.c
+++ b/exec.c
@@ -2305,10 +2305,15 @@ void cpu_register_physical_memory_log(MemoryRegionSection *section,
         remain.offset_within_address_space += now.size;
         remain.offset_within_region += now.size;
     }
-    now = remain;
-    now.size &= TARGET_PAGE_MASK;
-    if (now.size) {
-        register_multipage(&now);
+    while (remain.size >= TARGET_PAGE_SIZE) {
+        now = remain;
+        if (remain.offset_within_region & ~TARGET_PAGE_MASK) {
+            now.size = TARGET_PAGE_SIZE;
+            register_subpage(&now);
+        } else {
+            now.size &= TARGET_PAGE_MASK;
+            register_multipage(&now);
+        }
         remain.size -= now.size;
         remain.offset_within_address_space += now.size;
         remain.offset_within_region += now.size;
-- 
1.7.11


