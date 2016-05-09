Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1azlBg-0001LD-IL
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2016 09:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBX-0000x1-Lx
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBV-00041y-Gu
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1azlBN-0003zj-Pb; Mon, 09 May 2016 09:25:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68ACA6265B;
	Mon,  9 May 2016 13:25:09 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u49DP4ce017024; Mon, 9 May 2016 09:25:07 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>
Date: Mon,  9 May 2016 15:24:55 +0200
Message-Id: <1462800299-12641-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
References: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 09 May 2016 13:25:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 1/5] scripts: add muldiv64() checking
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
X-List-Received-Date: Mon, 09 May 2016 13:25:27 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5


