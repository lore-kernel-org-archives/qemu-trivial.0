Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3pe-0007Hv-Qc
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:53:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1db3pc-0007GA-Mf
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1db3pb-0005zX-WE
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:53:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1db3pZ-0005xu-ON; Fri, 28 Jul 2017 07:53:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB5DB1487F9;
	Fri, 28 Jul 2017 11:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AB5DB1487F9
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-116-161.ams2.redhat.com [10.36.116.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36ECD707AB;
	Fri, 28 Jul 2017 11:53:19 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	gxt@mprc.pku.edu.cn,
	thuth@redhat.com
Date: Fri, 28 Jul 2017 13:53:18 +0200
Message-Id: <20170728115318.31781-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 28 Jul 2017 11:53:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] fix qemu-system-unicore32 crashing when
 calling without -kernel
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
X-List-Received-Date: Fri, 28 Jul 2017 11:53:25 -0000

Starting qemu-system-unicore32 without the -kernel parameter results in
an assert() returns false and aborts qemu. This patch replaces it with a
proper error message followed by exit(1).

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 hw/unicore32/puv3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index e9d1a60b6f..ff62efb4df 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -92,7 +92,10 @@ static void puv3_load_kernel(const char *kernel_filename)
     if (kernel_filename == NULL && qtest_enabled()) {
         return;
     }
-    assert(kernel_filename != NULL);
+    if (kernel_filename == NULL) {
+        error_report("kernel parameter cannot be empty");
+        exit(1);
+    }
 
     /* only zImage format supported */
     size = load_image_targphys(kernel_filename, KERNEL_LOAD_ADDR,
-- 
2.13.3


