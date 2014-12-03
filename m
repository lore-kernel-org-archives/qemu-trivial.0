Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xw7Ad-0003Ez-Mu
	for mharc-qemu-trivial@gnu.org; Wed, 03 Dec 2014 05:28:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xw7AV-00033p-Tz
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:28:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xw7AP-0003zL-QN
	for qemu-trivial@nongnu.org; Wed, 03 Dec 2014 05:28:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Xw7AD-0003yW-7a; Wed, 03 Dec 2014 05:28:05 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB3AS48a003613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 3 Dec 2014 05:28:04 -0500
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB3AS2G1012802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Dec 2014 05:28:04 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E4B730403B2; Wed,  3 Dec 2014 11:28:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Dec 2014 11:28:02 +0100
Message-Id: <1417602482-8832-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] Drop superfluous conditionals around
	qemu_opts_del()
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
X-List-Received-Date: Wed, 03 Dec 2014 10:28:30 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c | 4 +---
 qemu-char.c    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 35fd00d..901f289 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1141,9 +1141,7 @@ static void device_finalize(Object *obj)
     NamedGPIOList *ngl, *next;
 
     DeviceState *dev = DEVICE(obj);
-    if (dev->opts) {
-        qemu_opts_del(dev->opts);
-    }
+    qemu_opts_del(dev->opts);
 
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
diff --git a/qemu-char.c b/qemu-char.c
index a8b01da..ef84b53 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3825,9 +3825,7 @@ void qemu_chr_delete(CharDriverState *chr)
     }
     g_free(chr->filename);
     g_free(chr->label);
-    if (chr->opts) {
-        qemu_opts_del(chr->opts);
-    }
+    qemu_opts_del(chr->opts);
     g_free(chr);
 }
 
-- 
1.9.3


