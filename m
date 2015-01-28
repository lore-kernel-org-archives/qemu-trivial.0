Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGU0Z-0007s2-Td
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 09:54:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0X-0007nG-LW
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0W-0006Ii-Ur
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YGU0O-0006GC-3E; Wed, 28 Jan 2015 09:54:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SEs7xD028915
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 09:54:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SEs5Ds019283
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Jan 2015 09:54:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1A93D3008AD5; Wed, 28 Jan 2015 15:54:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Jan 2015 15:54:03 +0100
Message-Id: <1422456844-13043-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-1-git-send-email-armbru@redhat.com>
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/4] spapr_vio: Pair g_malloc() with g_free(),
	not free()
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
X-List-Received-Date: Wed, 28 Jan 2015 14:54:18 -0000

Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
and my "coverity: Model g_free() isn't necessarily free()" model patch
applied.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ppc/spapr_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index dc9e46a..032ee1a 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -648,7 +648,7 @@ int spapr_populate_vdevice(VIOsPAPRBus *bus, void *fdt)
 
     ret = 0;
 out:
-    free(qdevs);
+    g_free(qdevs);
 
     return ret;
 }
-- 
1.9.3


