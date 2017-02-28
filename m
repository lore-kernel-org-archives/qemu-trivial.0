Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibX6-0001up-M8
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:45:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX3-0001p7-Aq
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX2-0003Hg-Kn
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibWy-0003DW-CM; Tue, 28 Feb 2017 01:45:04 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B611643588;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 208483D0;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: (nullmailer pid 19627 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:49 +0300
Message-Id: <6048018ef6112476b529807ad603015314151bb2.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/14] ide: remove undefined behavior in
 ide-test
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
X-List-Received-Date: Tue, 28 Feb 2017 06:45:10 -0000

From: John Snow <jsnow@redhat.com>

trivial: initialize the dirty buffer with a random-ish byte.
Stops valgrind from whining about uninitialized buffers.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/ide-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/ide-test.c b/tests/ide-test.c
index fb541f8..b57c2b1 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -544,6 +544,7 @@ static void make_dirty(uint8_t device)
 
     guest_buf = guest_alloc(guest_malloc, len);
     buf = g_malloc(len);
+    memset(buf, rand() % 255 + 1, len);
     g_assert(guest_buf);
     g_assert(buf);
 
-- 
2.1.4


