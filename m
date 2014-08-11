Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpEu-0003Nq-GU
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEn-00039o-5k
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEi-0003h2-CU
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:09 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:64818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEX-0003di-Mc; Mon, 11 Aug 2014 09:01:54 -0400
Received: from 172.24.2.119 (EHLO szxeml461-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71180; Mon, 11 Aug 2014 21:01:11 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml461-hub.china.huawei.com
	(10.82.67.204) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 21:01:03 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:51 +0800
Message-ID: <1407762058-11512-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 1/8] CODING_STYLE: Section about
	conditional statement
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:14 -0000

From: Gonglei <arei.gonglei@huawei.com>

Yoda conditions lack readability, and QEMU has a
strict compiler configuration for checking a common
mistake like "if (dev = NULL)". Make it a written rule.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 CODING_STYLE | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 4280945..d46cfa5 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -91,3 +91,17 @@ Mixed declarations (interleaving statements and declarations within blocks)
 are not allowed; declarations should be at the beginning of blocks.  In other
 words, the code should not generate warnings if using GCC's
 -Wdeclaration-after-statement option.
+
+6. Conditional statements
+
+When comparing a variable for (in)equality with a constant, list the
+constant on the right, as in:
+
+if (a == 1) {
+    /* Reads like: "If a equals 1" */
+    do_something();
+}
+
+Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
+Besides, good compilers already warn users when '==' is mis-typed as '=',
+even when the constant is on the right.
-- 
1.7.12.4



