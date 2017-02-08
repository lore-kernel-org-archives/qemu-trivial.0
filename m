Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbVgc-00037n-Sy
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 12:05:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cbVga-00035Q-Kx
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 12:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cbVgZ-0005xB-PJ
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 12:05:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1cbVgV-0005uk-Uy; Wed, 08 Feb 2017 12:05:36 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37719C05AA59;
	Wed,  8 Feb 2017 17:05:35 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-58-133.rdu2.redhat.com
	[10.10.58.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v18H5Y4v026637; Wed, 8 Feb 2017 12:05:34 -0500
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Date: Wed,  8 Feb 2017 12:05:33 -0500
Message-Id: <20170208170533.28822-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 Feb 2017 17:05:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ide: remove undefined behavior in ide-test
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
X-List-Received-Date: Wed, 08 Feb 2017 17:05:41 -0000

trivial: initialize the dirty buffer with a random-ish byte.
Stops valgrind from whining about uninitialized buffers.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/ide-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/ide-test.c b/tests/ide-test.c
index 2fa97bc..139ebc0 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -550,6 +550,7 @@ static void make_dirty(uint8_t device)
 
     guest_buf = guest_alloc(guest_malloc, len);
     buf = g_malloc(len);
+    memset(buf, rand() % 255 + 1, len);
     g_assert(guest_buf);
     g_assert(buf);
 
-- 
2.9.3


