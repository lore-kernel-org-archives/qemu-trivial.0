Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMTec-0001eX-W4
	for mharc-qemu-trivial@gnu.org; Tue, 26 Aug 2014 23:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XMTeU-0001QL-Gk
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 23:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XMTeO-0003ny-CY
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 23:12:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XMTeB-0003mu-Rk; Tue, 26 Aug 2014 23:11:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7R3BgXv012126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 26 Aug 2014 23:11:42 -0400
Received: from T430.nay.redhat.com (dhcp-14-155.nay.redhat.com [10.66.14.155])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s7R3Bcfr008568; Tue, 26 Aug 2014 23:11:40 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 Aug 2014 11:11:55 +0800
Message-Id: <1409109115-8348-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] scripts: Remove scripts/qtest
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
X-List-Received-Date: Wed, 27 Aug 2014 03:12:09 -0000

This is a dummy file with no user, drop it.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 scripts/qtest | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100755 scripts/qtest

diff --git a/scripts/qtest b/scripts/qtest
deleted file mode 100755
index 4ef6c1c..0000000
--- a/scripts/qtest
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-export QTEST_QEMU_BINARY=$1
-shift
-"$@"
-- 
2.1.0


