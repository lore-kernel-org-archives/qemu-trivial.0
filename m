Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHyX-0006ss-64
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyU-0006p4-0p
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyT-0003V9-6j
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHyL-0003Nw-4I; Wed, 12 Jul 2017 09:46:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 280CD40F66;
	Wed, 12 Jul 2017 16:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 582A5AD0;
	Wed, 12 Jul 2017 16:38:14 +0300 (MSK)
Received: (nullmailer pid 29057 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:09 +0300
Message-Id: <10cb4ec41734243b2798bd1d53919827eaccd673.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/13] qobject: Update coccinelle script to
 catch Q{INC, DEC}REF
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
X-List-Received-Date: Wed, 12 Jul 2017 13:46:43 -0000

From: Eric Blake <eblake@redhat.com>

A recent patch submission was about to use qobject_decref(QOBJECT(E)),
even though we already have QDECREF(E) for that purpose.  While our
tree is currently free from the longhand form, we might as well update
our coccinelle script to catch any future relapses.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/coccinelle/qobject.cocci | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/coccinelle/qobject.cocci b/scripts/coccinelle/qobject.cocci
index c3253deb1b..c518caf7b1 100644
--- a/scripts/coccinelle/qobject.cocci
+++ b/scripts/coccinelle/qobject.cocci
@@ -3,6 +3,12 @@
 expression Obj, Key, E;
 @@
 (
+- qobject_incref(QOBJECT(E));
++ QINCREF(E);
+|
+- qobject_decref(QOBJECT(E));
++ QDECREF(E);
+|
 - qdict_put_obj(Obj, Key, QOBJECT(E));
 + qdict_put(Obj, Key, E);
 |
-- 
2.11.0


