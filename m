Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIcmS-0002f0-GQ
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 12:26:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIcmQ-0002cp-3c
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 12:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIcmP-0005L2-Ew
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 12:26:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40450 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fIcmN-0005Hk-Ej; Tue, 15 May 2018 12:26:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E63DF40201A0;
	Tue, 15 May 2018 16:26:22 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFFCA1DB25;
	Tue, 15 May 2018 16:26:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,
	qemu-trivial@nongnu.org
Date: Tue, 15 May 2018 18:26:20 +0200
Message-Id: <1526401580-20535-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 16:26:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 16:26:22 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qapi/net.json: Fix the version number of the
 "vlan" removal
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
X-List-Received-Date: Tue, 15 May 2018 16:26:27 -0000

"vlan" will be dropped in 2.13, not in 2.12. And while we're at it,
use the better wording "dropped in" instead of "removed with" (also
for the "dump" removal).

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/net.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index b4fe4b6..b8adf1f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -450,7 +450,7 @@
 #
 # Since: 2.7
 #
-# 'dump' - removed with 2.12
+# 'dump': dropped in 2.12
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
@@ -498,7 +498,7 @@
 #
 # Since: 1.2
 #
-# 'vlan' - removed with 2.12
+# 'vlan': dropped in 2.13
 ##
 { 'struct': 'NetLegacy',
   'data': {
-- 
1.8.3.1


