Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgU2-0002rN-1g
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:28:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgU0-0002qX-Cg
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:28:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgTz-0002X7-9k
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:28:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgTt-0002Qx-UB; Sun, 17 Dec 2017 16:28:22 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E0F7941173;
	Mon, 18 Dec 2017 00:28:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC6E1C8E;
	Mon, 18 Dec 2017 00:25:45 +0300 (MSK)
Received: (nullmailer pid 30893 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:10 +0300
Message-Id: <b07ad2347243a5bcfc01da8d6b8e63372d904cc2.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/61] qht: fix kernel-doc markup in qht.h
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
X-List-Received-Date: Sun, 17 Dec 2017 21:28:29 -0000

From: "Emilio G. Cota" <cota@braap.org>

While at it, s/stuct/struct/.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/qht.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/qht.h b/include/qemu/qht.h
index 56c2c7784c..531aa95325 100644
--- a/include/qemu/qht.h
+++ b/include/qemu/qht.h
@@ -166,7 +166,7 @@ void qht_iter(struct qht *ht, qht_iter_func_t func, void *userp);
 /**
  * qht_statistics_init - Gather statistics from a QHT
  * @ht: QHT to gather statistics from
- * @stats: pointer to a struct qht_stats to be filled in
+ * @stats: pointer to a &struct qht_stats to be filled in
  *
  * Does NOT need to be called under an RCU read-critical section,
  * since it does not dereference any pointers stored in the hash table.
@@ -177,8 +177,8 @@ void qht_iter(struct qht *ht, qht_iter_func_t func, void *userp);
 void qht_statistics_init(struct qht *ht, struct qht_stats *stats);
 
 /**
- * qht_statistics_destroy - Destroy a struct qht_stats
- * @stats: stuct qht_stats to be destroyed
+ * qht_statistics_destroy - Destroy a &struct qht_stats
+ * @stats: &struct qht_stats to be destroyed
  *
  * See also: qht_statistics_init().
  */
-- 
2.11.0


