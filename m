Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDMXy-00032u-SM
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2015 20:52:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMXw-00031s-Hb
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMXt-00051R-B3
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:08 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:51020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZDMXs-00051M-Ok; Thu, 09 Jul 2015 20:52:05 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CQZ76960; Fri, 10 Jul 2015 08:51:59 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jul 2015 08:51:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 10 Jul 2015 08:51:27 +0800
Message-ID: <1436489490-236-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 1/4] cpu: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 00:52:09 -0000

From: Gonglei <arei.gonglei@huawei.com>

Failing to save or free storage allocated
by "g_strdup(names[0])" leaks it. Actually,
we can pass names[0] directly.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 target-i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index f9b1788..1e49a14 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -3021,7 +3021,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU *cpu,
 
     for (i = 1; names[i]; i++) {
         feat2prop(names[i]);
-        object_property_add_alias(obj, names[i], obj, g_strdup(names[0]),
+        object_property_add_alias(obj, names[i], obj, names[0],
                                   &error_abort);
     }
 
-- 
1.7.12.4



