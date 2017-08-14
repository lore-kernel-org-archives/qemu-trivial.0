Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJG-0007YY-FZ
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJC-0007TB-CB
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJB-0007XC-Bg
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJ6-0007UQ-T4; Mon, 14 Aug 2017 07:13:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9BC3D40D50;
	Mon, 14 Aug 2017 14:07:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 11451B79;
	Mon, 14 Aug 2017 14:07:44 +0300 (MSK)
Received: (nullmailer pid 31401 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:39 +0300
Message-Id: <e8ec0117b21150d2ea888bbcf6d8fe9683332a9e.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 2/7] libqtest: Fix typo in comments
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
X-List-Received-Date: Mon, 14 Aug 2017 11:13:23 -0000

From: Eric Blake <eblake@redhat.com>

s/continuosly/continuously/

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/libqtest.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/libqtest.h b/tests/libqtest.h
index 38bc1e9953..3ae570927a 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -117,7 +117,7 @@ QDict *qtest_qmp_receive(QTestState *s);
  * @s: #QTestState instance to operate on.
  * @s: #event event to wait for.
  *
- * Continuosly polls for QMP responses until it receives the desired event.
+ * Continuously polls for QMP responses until it receives the desired event.
  */
 void qtest_qmp_eventwait(QTestState *s, const char *event);
 
@@ -126,7 +126,7 @@ void qtest_qmp_eventwait(QTestState *s, const char *event);
  * @s: #QTestState instance to operate on.
  * @s: #event event to wait for.
  *
- * Continuosly polls for QMP responses until it receives the desired event.
+ * Continuously polls for QMP responses until it receives the desired event.
  * Returns a copy of the event for further investigation.
  */
 QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event);
@@ -571,7 +571,7 @@ static inline QDict *qmp_receive(void)
  * qmp_eventwait:
  * @s: #event event to wait for.
  *
- * Continuosly polls for QMP responses until it receives the desired event.
+ * Continuously polls for QMP responses until it receives the desired event.
  */
 static inline void qmp_eventwait(const char *event)
 {
@@ -582,7 +582,7 @@ static inline void qmp_eventwait(const char *event)
  * qmp_eventwait_ref:
  * @s: #event event to wait for.
  *
- * Continuosly polls for QMP responses until it receives the desired event.
+ * Continuously polls for QMP responses until it receives the desired event.
  * Returns a copy of the event for further investigation.
  */
 static inline QDict *qmp_eventwait_ref(const char *event)
-- 
2.11.0


