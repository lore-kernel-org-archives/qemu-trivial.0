Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c092Y-0001w1-SO
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:25:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0001rF-Rf
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092T-0007tt-Vp
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c092P-0007qx-9z; Fri, 28 Oct 2016 11:25:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 43A2143734;
	Fri, 28 Oct 2016 18:25:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5ECF8B4A;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6066 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:42 +0300
Message-Id: <7344ffaa2d1fed640e5ac0f45e339289ef45ca7b.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/23] colo-compare: remove unused struct
 CompareChardevProps and 'props' variable
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
X-List-Received-Date: Fri, 28 Oct 2016 15:25:52 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

After commit 0a73336d, 'props' variable in find_and_check_chardev()
is unused. Remove it, togther with struct CompareChardevProps.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/colo-compare.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index f791383..2089bea 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -92,10 +92,6 @@ typedef struct CompareClass {
     ObjectClass parent_class;
 } CompareClass;
 
-typedef struct CompareChardevProps {
-    bool is_socket;
-} CompareChardevProps;
-
 enum {
     PRIMARY_IN = 0,
     SECONDARY_IN,
@@ -571,8 +567,6 @@ static int find_and_check_chardev(CharDriverState **chr,
                                   char *chr_name,
                                   Error **errp)
 {
-    CompareChardevProps props;
-
     *chr = qemu_chr_find(chr_name);
     if (*chr == NULL) {
         error_setg(errp, "Device '%s' not found",
@@ -580,8 +574,6 @@ static int find_and_check_chardev(CharDriverState **chr,
         return 1;
     }
 
-    memset(&props, 0, sizeof(props));
-
     if (!qemu_chr_has_feature(*chr, QEMU_CHAR_FEATURE_RECONNECTABLE)) {
         error_setg(errp, "chardev \"%s\" is not reconnectable",
                    chr_name);
-- 
2.1.4


