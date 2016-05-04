Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axwUN-0002Jd-9Q
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 09:05:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwUE-0001ti-Hi
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwU2-0004SI-JZ
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:05:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1axwTk-0004Io-9t; Wed, 04 May 2016 09:04:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9A49C0467F2;
	Wed,  4 May 2016 13:04:19 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44D4Faa002315; Wed, 4 May 2016 09:04:18 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Date: Wed,  4 May 2016 15:04:06 +0200
Message-Id: <1462367048-20997-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
References: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/3] scripts: add muldiv64() checking
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
X-List-Received-Date: Wed, 04 May 2016 13:05:13 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/coccinelle/remove_muldiv64.cocci |  6 +++++
 scripts/coccinelle/swap_muldiv64.cocci   | 46 ++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 scripts/coccinelle/remove_muldiv64.cocci
 create mode 100644 scripts/coccinelle/swap_muldiv64.cocci

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
diff --git a/scripts/coccinelle/swap_muldiv64.cocci b/scripts/coccinelle/swap_muldiv64.cocci
new file mode 100644
index 0000000..39a278d
--- /dev/null
+++ b/scripts/coccinelle/swap_muldiv64.cocci
@@ -0,0 +1,46 @@
+// replace muldiv64(i32, i64, x) by muldiv64(i64, i32, x)
+@filter@
+typedef uint64_t;
+typedef int64_t;
+typedef uint32_t;
+typedef int32_t;
+uint64_t u64;
+int64_t s64;
+uint32_t u32;
+int32_t s32;
+int si;
+unsigned int ui;
+long sl;
+unsigned long ul;
+expression b;
+position p;
+@@
+	muldiv64(
+(
+si
+|
+ui
+|
+s32
+|
+u32
+)
+,
+(
+sl
+|
+ul
+|
+u64
+|
+s64
+)
+, b)@p
+
+@swap@
+position filter.p;
+expression a, b, c;
+@@
+
+-muldiv64(a,b,c)@p
++muldiv64(b,a,c)
-- 
2.5.5


