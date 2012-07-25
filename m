Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SuAPS-0003Dl-Mt
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jul 2012 18:50:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>) id 1SuAPQ-0003C0-69
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 18:50:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>) id 1SuAPP-00020c-9O
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 18:50:24 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:51270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tylerwhall@gmail.com>)
	id 1SuAPN-00020N-Ge; Wed, 25 Jul 2012 18:50:21 -0400
Received: by yhpp34 with SMTP id p34so1295260yhp.4
	for <multiple recipients>; Wed, 25 Jul 2012 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=32IJ9I1bRCpCqtd3eVYO8M5tikEhnzGcRrZwDZqeSpY=;
	b=ZjiDRunSEyjepvh5yRw7LQPbHBMb8qdgQVGtf0gOS5wpHmo548w5b+ZNiEbLaxgnXW
	7VooJ4Albj7wK1bdYd97S0bbDFt4L86/k/1dsNX53np9pIQc4uIw9ZPQWHMquh572gE1
	/RCa6rR+frtRATAn/FeSOKu904YRiQ/yL1TDRcNHKC6c93NVd3blHAOWVtWLwsbNtKNP
	pQPBgiBgPRJcNJEe4+llfeGgj94aJEIkIMXofLks9UUJQ328rqQ+HX3RELee6L2Qrv9e
	MqgSIL0GFfVz/0b2rDhcmj/RDCA4AiNP0RS/jEywsZj9BETcWR0/NwXOk/1u4gf6gkeP
	jT9g==
Received: by 10.236.191.42 with SMTP id f30mr25244219yhn.123.1343256620498;
	Wed, 25 Jul 2012 15:50:20 -0700 (PDT)
Received: from localhost.localdomain (cpe-69-23-225-27.natcky.res.rr.com.
	[69.23.225.27])
	by mx.google.com with ESMTPS id i34sm19947662anm.12.2012.07.25.15.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 15:50:19 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Jul 2012 18:45:03 -0400
Message-Id: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.7.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, Tyler Hall <tylerwhall@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] exec.c: Fix off-by-one error in
	register_subpage
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
X-List-Received-Date: Wed, 25 Jul 2012 22:50:25 -0000

subpage_register() expects "end" to be the last byte in the mapping.
Registering a non-page-aligned memory region that extends up to or
beyond a page boundary causes subpage_register() to silently fail
through the (end >= PAGE_SIZE) check.

This bug does not cause noticeable problems for mappings that do not
extend to a page boundary, though they do register an extra byte.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index feb4795..27b100c 100644
--- a/exec.c
+++ b/exec.c
@@ -2271,7 +2271,7 @@ static void register_subpage(MemoryRegionSection *section)
         subpage = container_of(existing->mr, subpage_t, iomem);
     }
     start = section->offset_within_address_space & ~TARGET_PAGE_MASK;
-    end = start + section->size;
+    end = start + section->size - 1;
     subpage_register(subpage, start, end, phys_section_add(section));
 }
 
-- 
1.7.11


