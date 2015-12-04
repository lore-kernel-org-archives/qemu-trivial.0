Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kJY-0006QI-Qw
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 01:57:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJS-0006Bx-Sn
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJS-0000KW-0N
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kJN-0000IF-Ds; Fri, 04 Dec 2015 01:57:45 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CF6A040686;
	Fri,  4 Dec 2015 09:57:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id ABE01AAE;
	Fri,  4 Dec 2015 09:57:42 +0300 (MSK)
Received: (nullmailer pid 7955 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:32 +0300
Message-Id: <624533e5a53e5df347e46f06408d15b9df5254f0.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PULL 1/9] util/id: fully allocate names table
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
X-List-Received-Date: Fri, 04 Dec 2015 06:57:52 -0000

From: John Snow <jsnow@redhat.com>

Trivial: this array should be allocated to have ID_MAX entries always.
Otherwise if someone were to forget to expand this table, the assertion
in the id generator won't actually trigger; it will read junk data.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/id.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/id.c b/util/id.c
index bcc64d8..7883fbe 100644
--- a/util/id.c
+++ b/util/id.c
@@ -29,7 +29,7 @@ bool id_wellformed(const char *id)
 
 #define ID_SPECIAL_CHAR '#'
 
-static const char *const id_subsys_str[] = {
+static const char *const id_subsys_str[ID_MAX] = {
     [ID_QDEV]  = "qdev",
     [ID_BLOCK] = "block",
 };
@@ -53,7 +53,7 @@ char *id_generate(IdSubSystems id)
     static uint64_t id_counters[ID_MAX];
     uint32_t rnd;
 
-    assert(id < ID_MAX);
+    assert(id < ARRAY_SIZE(id_subsys_str));
     assert(id_subsys_str[id]);
 
     rnd = g_random_int_range(0, 100);
-- 
2.1.4


