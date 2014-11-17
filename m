Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqFKD-0001y8-7t
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 00:58:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqFK7-0001nu-Aq
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XqFK2-00027i-Hq
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 00:58:03 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:21243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XqFK1-00026d-Rj; Mon, 17 Nov 2014 00:57:58 -0500
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCL71314; Mon, 17 Nov 2014 13:57:53 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 17 Nov 2014 13:57:34 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 17 Nov 2014 13:57:34 +0800
Message-ID: <1416203854-11908-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, edgar.iglesias@gmail.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] target-cris/translate.c: fix out of bounds
	read
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
X-List-Received-Date: Mon, 17 Nov 2014 05:58:08 -0000

In function t_gen_mov_TN_preg and t_gen_mov_preg_TN, The begin check about the
validity of in-parameter 'r' is useless. We still access cpu_PR[r] in the
follow code if it is invalid. Which will be an out-of-bounds read error.

Fix it by using assert() to ensure it is valid before using it.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 target-cris/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target-cris/translate.c b/target-cris/translate.c
index e37b04e..76406af 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -169,9 +169,7 @@ static int preg_sizes[] = {
 
 static inline void t_gen_mov_TN_preg(TCGv tn, int r)
 {
-    if (r < 0 || r > 15) {
-        fprintf(stderr, "wrong register read $p%d\n", r);
-    }
+    assert(r >= 0 && r <= 15);
     if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
         tcg_gen_mov_tl(tn, tcg_const_tl(0));
     } else if (r == PR_VR) {
@@ -182,9 +180,7 @@ static inline void t_gen_mov_TN_preg(TCGv tn, int r)
 }
 static inline void t_gen_mov_preg_TN(DisasContext *dc, int r, TCGv tn)
 {
-    if (r < 0 || r > 15) {
-        fprintf(stderr, "wrong register write $p%d\n", r);
-    }
+    assert(r >= 0 && r <= 15);
     if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
         return;
     } else if (r == PR_SRS) {
-- 
1.7.12.4



