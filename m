Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTD4H-0002Ew-BB
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:26:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD49-000212-7S
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD48-00050b-Hb
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTD44-0004xx-Ak; Wed, 04 Mar 2015 12:26:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 319594089A;
	Wed,  4 Mar 2015 20:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A9749952;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17557 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:53 +0300
Message-Id: <d6bc834525c1804d52e6c4d93a7cb0d03737aa42.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 36/47] gitignore: Ignore new tests
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
X-List-Received-Date: Wed, 04 Mar 2015 17:26:41 -0000

From: Cole Robinson <crobinso@redhat.com>

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index e2e4957..0dcb618 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,6 +5,7 @@ check-qjson
 check-qlist
 check-qstring
 check-qom-interface
+rcutorture
 test-aio
 test-bitops
 test-coroutine
@@ -26,6 +27,7 @@ test-qmp-input-strict
 test-qmp-input-visitor
 test-qmp-marshal.c
 test-qmp-output-visitor
+test-rcu-list
 test-rfifolock
 test-string-input-visitor
 test-string-output-visitor
@@ -33,6 +35,7 @@ test-thread-pool
 test-throttle
 test-visitor-serialization
 test-vmstate
+test-write-threshold
 test-x86-cpuid
 test-xbzrle
 *-test
-- 
2.1.4


