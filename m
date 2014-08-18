Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHjq-0004po-8S
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 03:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHjk-0004j5-4k
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHjf-0008NC-NZ
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:52:16 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:35938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJHjU-0008Kf-9X; Mon, 18 Aug 2014 03:52:02 -0400
Received: from 172.24.2.119 (EHLO szxeml417-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATF23897; Mon, 18 Aug 2014 15:51:54 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml417-hub.china.huawei.com
	(10.82.67.156) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 15:51:44 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Aug 2014 15:51:50 +0800
Message-ID: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.53F1B09B.008B,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 92dbd8b556f5893da32039a195b74cdf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, jan.kiszka@siemens.com, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH v7] slirp/misc: Use g_malloc() instead of
	malloc()
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
X-List-Received-Date: Mon, 18 Aug 2014 07:52:20 -0000

Here we don't check the return value of malloc() which may fail.
Use the g_malloc() instead, which will abort the program when
there is not enough memory.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 slirp/misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index b8eb74c..f7fe497 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -54,7 +54,7 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, char *exec,
 	}
 
 	tmp_ptr = *ex_ptr;
-	*ex_ptr = (struct ex_list *)malloc(sizeof(struct ex_list));
+	*ex_ptr = (struct ex_list *)g_malloc(sizeof(struct ex_list));
 	(*ex_ptr)->ex_fport = port;
 	(*ex_ptr)->ex_addr = addr;
 	(*ex_ptr)->ex_pty = do_pty;
@@ -235,7 +235,7 @@ strdup(str)
 {
 	char *bptr;
 
-	bptr = (char *)malloc(strlen(str)+1);
+	bptr = (char *)g_malloc(strlen(str)+1);
 	strcpy(bptr, str);
 
 	return bptr;
-- 
1.7.12.4



