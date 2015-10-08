Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkdd2-0003uT-0f
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:46:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyW-0004d7-DQ
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyV-0006LR-GF
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyS-0006IC-54; Thu, 08 Oct 2015 15:35:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id DADC9368E3;
	Thu,  8 Oct 2015 19:35:31 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3L009701; Thu, 8 Oct 2015 15:35:29 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:15 +0200
Message-Id: <1444332916-16476-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1444332916-16476-1-git-send-email-thuth@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PATCH 4/5] tests/i44fx-test: No need for zeroing
	memory before memset
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
X-List-Received-Date: Thu, 08 Oct 2015 19:35:37 -0000

Change a g_malloc0 into g_malloc since the following
memset fills the whole buffer anyway.

Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/i440fx-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index d0bc8de..7fa1709 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -191,7 +191,7 @@ static void write_area(uint32_t start, uint32_t end, uint8_t value)
     uint32_t size = end - start + 1;
     uint8_t *data;
 
-    data = g_malloc0(size);
+    data = g_malloc(size);
     memset(data, value, size);
     memwrite(start, data, size);
 
-- 
1.8.3.1


