Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Siw-000360-2t
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sir-00031c-6f
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sil-0004Pw-J1
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sif-0004OO-ON; Sun, 05 Jun 2016 03:43:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1863E40910;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 697D4ADA;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1107 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:46 +0300
Message-Id: <cf2eb64ab7be4e591fe6945e1114ddca4817be20.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/52] scripts: add muldiv64() checking
 coccinelle scripts
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
X-List-Received-Date: Sun, 05 Jun 2016 07:43:52 -0000

From: Laurent Vivier <lvivier@redhat.com>

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/coccinelle/overflow_muldiv64.cocci | 16 ++++++++++++++++
 scripts/coccinelle/remove_muldiv64.cocci   |  6 ++++++
 scripts/coccinelle/simplify_muldiv64.cocci | 11 +++++++++++
 scripts/coccinelle/swap_muldiv64.cocci     | 13 +++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 scripts/coccinelle/overflow_muldiv64.cocci
 create mode 100644 scripts/coccinelle/remove_muldiv64.cocci
 create mode 100644 scripts/coccinelle/simplify_muldiv64.cocci
 create mode 100644 scripts/coccinelle/swap_muldiv64.cocci

diff --git a/scripts/coccinelle/overflow_muldiv64.cocci b/scripts/coccinelle/overflow_muldiv64.cocci
new file mode 100644
index 0000000..08ec4a8
--- /dev/null
+++ b/scripts/coccinelle/overflow_muldiv64.cocci
@@ -0,0 +1,16 @@
+// Find muldiv64(i64, i64, x) for potential overflow
+@filter@
+typedef uint64_t;
+typedef int64_t;
+{ uint64_t, int64_t, long, unsigned long } a, b;
+expression c;
+position p;
+@@
+
+muldiv64(a,b,c)@p
+
+@script:python@
+p << filter.p;
+@@
+
+cocci.print_main("potential muldiv64() overflow", p)
diff --git a/scripts/coccinelle/remove_muldiv64.cocci b/scripts/coccinelle/remove_muldiv64.cocci
new file mode 100644
index 0000000..4c10bd5
--- /dev/null
+++ b/scripts/coccinelle/remove_muldiv64.cocci
@@ -0,0 +1,6 @@
+// replace muldiv64(a, 1, b) by "a / b"
+@@
+expression a, b;
+@@
+-muldiv64(a, 1, b)
++a / b
diff --git a/scripts/coccinelle/simplify_muldiv64.cocci b/scripts/coccinelle/simplify_muldiv64.cocci
new file mode 100644
index 0000000..3d7c974
--- /dev/null
+++ b/scripts/coccinelle/simplify_muldiv64.cocci
@@ -0,0 +1,11 @@
+// replace muldiv64(i32, i32, x) by (uint64_t)i32 * i32 / x
+@@
+typedef uint32_t;
+typedef int32_t;
+{ uint32_t, int32_t, int, unsigned int } a, b;
+typedef uint64_t;
+expression c;
+@@
+
+-muldiv64(a,b,c)
++(uint64_t) a * b / c
diff --git a/scripts/coccinelle/swap_muldiv64.cocci b/scripts/coccinelle/swap_muldiv64.cocci
new file mode 100644
index 0000000..b48b0d0
--- /dev/null
+++ b/scripts/coccinelle/swap_muldiv64.cocci
@@ -0,0 +1,13 @@
+// replace muldiv64(i32, i64, x) by muldiv64(i64, i32, x)
+@@
+typedef uint64_t;
+typedef int64_t;
+typedef uint32_t;
+typedef int32_t;
+{ uint32_t, int32_t, int, unsigned int } a;
+{ uint64_t, int64_t, long, unsigned long } b;
+expression c;
+@@
+
+-muldiv64(a,b,c)
++muldiv64(b,a,c)
-- 
2.1.4


