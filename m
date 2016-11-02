Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1sdt-0008K4-Tz
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 06:19:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1sdo-0008H6-M8
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1sdj-00072Q-8b
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:19:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1sde-0006z6-V6; Wed, 02 Nov 2016 06:19:23 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFD38C001C03;
	Wed,  2 Nov 2016 10:19:21 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA2AJIZu021372; Wed, 2 Nov 2016 06:19:19 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xensource.com, olaf@aepfle.de,
	xuquan8@huawei.com, emilcondrea@gmail.com
Date: Wed,  2 Nov 2016 11:19:18 +0100
Message-Id: <1478081958-5803-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 02 Nov 2016 10:19:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/xen/xen_pvdev: Include qemu/log.h for
 qemu_log_vprintf()
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
X-List-Received-Date: Wed, 02 Nov 2016 10:19:36 -0000

Olaf Hering reported a build failure due to an undefined reference
to 'qemu_log_vprintf'. Explicitely including qemu/log.h seems to
fix the issue.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/xen/xen_pvdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 405e154..5212bc6 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/log.h"
 #include "hw/xen/xen_backend.h"
 #include "hw/xen/xen_pvdev.h"
 
-- 
1.8.3.1


