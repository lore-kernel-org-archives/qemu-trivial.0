Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1djp4t-00054O-Pv
	for mharc-qemu-trivial@gnu.org; Mon, 21 Aug 2017 11:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1djp4r-00052h-QF
	for qemu-trivial@nongnu.org; Mon, 21 Aug 2017 11:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1djp4r-0005Bp-1C
	for qemu-trivial@nongnu.org; Mon, 21 Aug 2017 11:57:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1djp4l-000590-RH; Mon, 21 Aug 2017 11:57:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26B31356E3;
	Mon, 21 Aug 2017 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 26B31356E3
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-175.ams2.redhat.com [10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A85177BED;
	Mon, 21 Aug 2017 15:50:06 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, zhangchen.fnst@cn.fujitsu.com,
	lizhijian@cn.fujitsu.com, mjt@tls.msk.ru
Date: Mon, 21 Aug 2017 17:50:05 +0200
Message-Id: <20170821155005.16885-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 21 Aug 2017 15:50:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] filter-mirror: segfault when specifying non
 existent device
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
X-List-Received-Date: Mon, 21 Aug 2017 15:57:22 -0000

When using filter-mirror like the example below where the interface
'ndev0' does not exist on the host, QEMU crashes into segmentation
fault.

 $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0

This happens because the function filter_mirror_setup() does not checks
if the device actually exists and still keep on processing calling
qemu_chr_find(). This patch fixes this issue.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 net/filter-mirror.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 90e2c92337..e18a4b16a0 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -213,14 +213,22 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
     MirrorState *s = FILTER_MIRROR(nf);
     Chardev *chr;
 
+    if (s->outdev == NULL) {
+        goto err;
+    }
+
     chr = qemu_chr_find(s->outdev);
+
     if (chr == NULL) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", s->outdev);
-        return;
+        goto err;
     }
 
     qemu_chr_fe_init(&s->chr_out, chr, errp);
+
+err:
+    error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Device '%s' not found",
+              nf->netdev_id);
+    return;
 }
 
 static void redirector_rs_finalize(SocketReadState *rs)
-- 
2.13.5


