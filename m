Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnaw-0008GE-5j
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008An-O7
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-00042v-M4
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnak-0003ts-S6; Sat, 08 Oct 2016 05:06:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 48AE240ED8;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A833FB3C;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19274 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:12 +0300
Message-Id: <52cfcb464255b4da5115408e2a6ce3327bbcb9df.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 26/26] net/filter-mirror: Fix mirror initial
 check typo
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
X-List-Received-Date: Sat, 08 Oct 2016 09:07:00 -0000

From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>

Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/filter-mirror.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 35df374..0ee58d9 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -198,7 +198,7 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
     MirrorState *s = FILTER_MIRROR(nf);
 
     if (!s->outdev) {
-        error_setg(errp, "filter filter mirror needs 'outdev' "
+        error_setg(errp, "filter mirror needs 'outdev' "
                    "property set");
         return;
     }
@@ -315,7 +315,7 @@ filter_mirror_set_outdev(Object *obj, const char *value, Error **errp)
     g_free(s->outdev);
     s->outdev = g_strdup(value);
     if (!s->outdev) {
-        error_setg(errp, "filter filter mirror needs 'outdev' "
+        error_setg(errp, "filter mirror needs 'outdev' "
                    "property set");
         return;
     }
-- 
2.1.4


