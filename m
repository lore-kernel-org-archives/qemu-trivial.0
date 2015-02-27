Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRMk0-00043o-5E
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 10:22:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YRMjt-0003lr-HL
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 10:22:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YRMjs-0003CZ-BT
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 10:22:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1YRMjq-0003C1-IZ; Fri, 27 Feb 2015 10:22:02 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1RFM1Al002740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 27 Feb 2015 10:22:02 -0500
Received: from colepc.redhat.com (ovpn-113-120.phx2.redhat.com [10.3.113.120])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t1RFLqBH016521; Fri, 27 Feb 2015 10:22:01 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Feb 2015 10:21:22 -0500
Message-Id: <ca2b89407ae9006ad122e0f022ca1b9132d88636.1425050482.git.crobinso@redhat.com>
In-Reply-To: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
References: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
In-Reply-To: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
References: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] gitignore: Ignore new tests
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
X-List-Received-Date: Fri, 27 Feb 2015 15:22:10 -0000

Signed-off-by: Cole Robinson <crobinso@redhat.com>
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
2.1.0


