Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZhKp-0004w8-Ib
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 12:07:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cZhKm-0004th-UF
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 12:07:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cZhKm-0002nJ-0p
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 12:07:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cZhKg-0002jq-O4; Fri, 03 Feb 2017 12:07:34 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC654811AC;
	Fri,  3 Feb 2017 17:07:34 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-116-196.ams2.redhat.com
	[10.36.116.196])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v13H7WEn001699; Fri, 3 Feb 2017 12:07:33 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri,  3 Feb 2017 09:07:29 -0800
Message-Id: <20170203170729.12399-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 03 Feb 2017 17:07:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] test-vmstate: remove yield_until_fd_readable
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
X-List-Received-Date: Fri, 03 Feb 2017 17:07:42 -0000

The function is not needed anymore now that migration is built on
top of QIOChannel.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/test-vmstate.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index 9d87faf..0c2af4d 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -33,17 +33,6 @@
 static char temp_file[] = "/tmp/vmst.test.XXXXXX";
 static int temp_fd;
 
-/* Fake yield_until_fd_readable() implementation so we don't have to pull the
- * coroutine code as dependency.
- */
-void yield_until_fd_readable(int fd)
-{
-    fd_set fds;
-    FD_ZERO(&fds);
-    FD_SET(fd, &fds);
-    select(fd + 1, &fds, NULL, NULL, NULL);
-}
-
 
 /* Duplicate temp_fd and seek to the beginning of the file */
 static QEMUFile *open_test_file(bool write)
-- 
2.9.3


