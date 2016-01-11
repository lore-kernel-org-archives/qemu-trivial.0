Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYHt-0001wH-Gj
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:57:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHp-0001pn-Pe
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHo-0004Q2-P4
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYHk-0004Ow-MH; Mon, 11 Jan 2016 03:57:08 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 664B6403F7;
	Mon, 11 Jan 2016 11:57:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6B78DADF;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28802 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:57 +0300
Message-Id: <1063477834b5fa86401da00262a92d1f386e49b9.1452501578.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/19] hw/core/qdev: Remove superfluous return
	statement
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
X-List-Received-Date: Mon, 11 Jan 2016 08:57:14 -0000

From: Thomas Huth <thuth@redhat.com>

The "return;" statement at the end of device_set_realized()
does not make much sense, so let's remove it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/qdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b3ad467..4e3173d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1134,7 +1134,6 @@ post_realize_fail:
 
 fail:
     error_propagate(errp, local_err);
-    return;
 }
 
 static bool device_get_hotpluggable(Object *obj, Error **errp)
-- 
2.1.4


