Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnjk3-0004wM-6x
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2017 07:04:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dnjk0-0004tY-Am
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dnjjv-0003PN-Em
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:04:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dnjji-0003L1-Q7; Fri, 01 Sep 2017 07:03:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA4EF3A246;
	Fri,  1 Sep 2017 11:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA4EF3A246
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-156.ams2.redhat.com [10.36.117.156])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC7571C48;
	Fri,  1 Sep 2017 11:03:37 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
	ehabkost@redhat.com
Date: Fri,  1 Sep 2017 13:03:32 +0200
Message-Id: <20170901110332.32650-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 01 Sep 2017 11:03:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of i82374
 device
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
X-List-Received-Date: Fri, 01 Sep 2017 11:04:01 -0000

When used with the following command line:

 ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374

QEMU with machine type 40p already creates the device i82374. If
specified in the command line, it will try to create it again, hence
generating the error. One way to avoid this problem is to set
user_creatable=false.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 hw/dma/i82374.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6c0f975df0..5275d822e0 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -139,6 +139,7 @@ static void i82374_class_init(ObjectClass *klass, void *data)
     dc->realize = i82374_realize;
     dc->vmsd = &vmstate_i82374;
     dc->props = i82374_properties;
+    dc->user_creatable = false;
 }
 
 static const TypeInfo i82374_info = {
-- 
2.13.5


