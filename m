Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk6rr-0005SW-4O
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 03:11:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rh-00058h-K8
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rZ-0003O8-AS
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:05 -0400
Received: from g2t2354.austin.hp.com ([15.217.128.53]:37290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1Wk6qy-0002tq-BA; Tue, 13 May 2014 03:10:20 -0400
Received: from g2t2360.austin.hp.com (g2t2360.austin.hp.com [16.197.8.247])
	by g2t2354.austin.hp.com (Postfix) with ESMTP id 81377DE;
	Tue, 13 May 2014 07:10:12 +0000 (UTC)
Received: from piepie.asiapacific.hpqcorp.net (piepie.asiapacific.hpqcorp.net
	[16.187.245.80])
	by g2t2360.austin.hp.com (Postfix) with ESMTP id F0B4C53;
	Tue, 13 May 2014 07:10:10 +0000 (UTC)
From: "Li, Zhen-Hua" <zhen-hual@hp.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<qemu-stable@nongnu.org>
Date: Tue, 13 May 2014 15:09:12 +0800
Message-Id: <1399964954-10842-3-git-send-email-zhen-hual@hp.com>
X-Mailer: git-send-email 2.0.0-rc0
In-Reply-To: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.217.128.53
Cc: "Li, ZhenHua" <zhen-hual@hp.com>
Subject: [Qemu-trivial] [PATCH 2/4] Support more than 255 cpus: max_cpus to
	4096
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
X-List-Received-Date: Tue, 13 May 2014 07:11:14 -0000

From: "Li, ZhenHua" <zhen-hual@hp.com>

max_cpus from 255 to 4096. So the machine types can support up to 4096 cpus.

Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
---
 include/hw/i386/pc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9010246..8183141 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -411,6 +411,6 @@ int e820_add_entry(uint64_t, uint64_t, uint32_t);
 #define PC_DEFAULT_MACHINE_OPTIONS \
     PC_COMMON_MACHINE_OPTIONS, \
     .hot_add_cpu = pc_hot_add_cpu, \
-    .max_cpus = 255
+    .max_cpus = 4096
 
 #endif
-- 
2.0.0-rc0


