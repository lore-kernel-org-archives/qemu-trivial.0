Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJeov-00065o-Ls
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 04:31:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJeoo-0005vY-OD
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 04:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJeok-00010i-DY
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 04:31:02 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:21318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJeoY-0000yU-Nf; Tue, 19 Aug 2014 04:30:47 -0400
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAM39889; Tue, 19 Aug 2014 16:30:40 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 19 Aug 2014 16:30:30 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 19 Aug 2014 16:30:17 +0800
Message-ID: <1408437017-15648-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH v8] slirp/misc: Use the GLib memory
	allocation APIs
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
X-List-Received-Date: Tue, 19 Aug 2014 08:31:07 -0000

Here we don't check the return value of malloc() which may fail.
Use the g_new() instead, which will abort the program when
there is not enough memory.

Also, use g_strdup instead of strdup and remove the unnecessary
strdup function.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 slirp/misc.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index b8eb74c..6543dc7 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -54,11 +54,11 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, char *exec,
 	}
 
 	tmp_ptr = *ex_ptr;
-	*ex_ptr = (struct ex_list *)malloc(sizeof(struct ex_list));
+	*ex_ptr = g_new(struct ex_list, 1);
 	(*ex_ptr)->ex_fport = port;
 	(*ex_ptr)->ex_addr = addr;
 	(*ex_ptr)->ex_pty = do_pty;
-	(*ex_ptr)->ex_exec = (do_pty == 3) ? exec : strdup(exec);
+	(*ex_ptr)->ex_exec = (do_pty == 3) ? exec : g_strdup(exec);
 	(*ex_ptr)->ex_next = tmp_ptr;
 	return 0;
 }
@@ -187,7 +187,7 @@ fork_exec(struct socket *so, const char *ex, int do_pty)
 			   bptr++;
 			c = *bptr;
 			*bptr++ = (char)0;
-			argv[i++] = strdup(curarg);
+			argv[i++] = g_strdup(curarg);
 		   } while (c);
 
                 argv[i] = NULL;
@@ -228,20 +228,6 @@ fork_exec(struct socket *so, const char *ex, int do_pty)
 }
 #endif
 
-#ifndef HAVE_STRDUP
-char *
-strdup(str)
-	const char *str;
-{
-	char *bptr;
-
-	bptr = (char *)malloc(strlen(str)+1);
-	strcpy(bptr, str);
-
-	return bptr;
-}
-#endif
-
 void slirp_connection_info(Slirp *slirp, Monitor *mon)
 {
     const char * const tcpstates[] = {
-- 
1.7.12.4



