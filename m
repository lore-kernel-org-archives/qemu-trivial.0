Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zka35-00082c-8y
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2P-0006ts-9T
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2N-0005a1-5B
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1Zka2G-0005Cv-ST; Fri, 09 Oct 2015 11:56:45 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 7FA14FA9D4;
	Fri,  9 Oct 2015 15:56:44 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99Fud3M025235; Fri, 9 Oct 2015 11:56:43 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  9 Oct 2015 17:56:37 +0200
Message-Id: <1444406198-6521-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1444406198-6521-1-git-send-email-thuth@redhat.com>
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 3/4] tests/i44fx-test: No need for zeroing
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
X-List-Received-Date: Fri, 09 Oct 2015 15:56:56 -0000

Change a g_malloc0 into g_malloc since the following
memset fills the whole buffer anyway.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
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


