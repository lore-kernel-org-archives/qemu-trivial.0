Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxu1t-0004VA-9F
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 08:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dxu1p-0004T6-4v
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 08:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dxu1h-0001RT-Hg
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 08:04:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dxu1U-0001N5-Kv; Fri, 29 Sep 2017 08:04:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C951C04AC47;
	Fri, 29 Sep 2017 12:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C951C04AC47
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-152.ams2.redhat.com [10.36.117.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10B7018A44;
	Fri, 29 Sep 2017 12:04:00 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>, lizhijian@cn.fujitsu.com
Date: Fri, 29 Sep 2017 14:03:39 +0200
Message-Id: <20170929120339.14197-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 29 Sep 2017 12:04:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCHv2] filter-mirror: segfault when specifying
 non existent device
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 12:04:28 -0000

v2:
    Removed "err:" label from the end of the function and replaced by
    two separate error messages. One when outdev is not specified and
    one when outdev does not exist.

    Fixed the error message that was referencing nf->netdev_id and not
    s->outdev.

When using filter-mirror like the example below where the interface
'ndev0' does not exist on the host, QEMU crashes into segmentation
fault.

 $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0

This happens because the function filter_mirror_setup() does not checks
if the device actually exists and still keep on processing calling
qemu_chr_find(). This patch fixes this issue.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 net/filter-mirror.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 90e2c92337..ce0dc23c2a 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -213,6 +213,12 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
     MirrorState *s = FILTER_MIRROR(nf);
     Chardev *chr;
 
+    if (s->outdev == NULL) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "filter-mirror parameter"\
+                  " 'outdev' cannot be empty");
+        return;
+    }
+
     chr = qemu_chr_find(s->outdev);
     if (chr == NULL) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-- 
2.13.5


