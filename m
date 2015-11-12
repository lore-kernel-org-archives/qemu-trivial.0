Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwyMv-0000t7-1A
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 15:21:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwyMr-0000gA-Cu
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZwyMq-0001Jf-Nk
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 15:21:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZwyMk-0001IG-My; Thu, 12 Nov 2015 15:21:06 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 4739D4C08B;
	Thu, 12 Nov 2015 20:21:06 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-56-36.rdu2.redhat.com [10.10.56.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACKL47L029782; Thu, 12 Nov 2015 15:21:05 -0500
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2015 15:21:04 -0500
Message-Id: <1447359664-25407-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] tests/.gitignore: ignore test-blockjob-txn
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
X-List-Received-Date: Thu, 12 Nov 2015 20:21:14 -0000

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index e96f569..de5e793 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -9,6 +9,7 @@ check-qom-proplist
 rcutorture
 test-aio
 test-bitops
+test-blockjob-txn
 test-coroutine
 test-crypto-cipher
 test-crypto-hash
-- 
2.4.3


