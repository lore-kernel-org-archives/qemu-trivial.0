Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dd4d4-0002AY-KN
	for mharc-qemu-trivial@gnu.org; Wed, 02 Aug 2017 21:08:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dd4d2-00029T-Gz
	for qemu-trivial@nongnu.org; Wed, 02 Aug 2017 21:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dd4d1-00060r-NJ
	for qemu-trivial@nongnu.org; Wed, 02 Aug 2017 21:08:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dd4cw-0005xr-DS; Wed, 02 Aug 2017 21:08:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66E9061464;
	Thu,  3 Aug 2017 01:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 66E9061464
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-121-23.rdu2.redhat.com [10.10.121.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE0DE7BAF1;
	Thu,  3 Aug 2017 01:08:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  2 Aug 2017 20:08:33 -0500
Message-Id: <20170803010833.19647-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Aug 2017 01:08:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] libqtest: Fix typo in comments
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
X-List-Received-Date: Thu, 03 Aug 2017 01:08:45 -0000

s/continuosly/continuously/

Signed-off-by: Eric Blake <eblake@redhat.com>
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
2.13.3


