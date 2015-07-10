Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDMY0-00034c-5y
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2015 20:52:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMXx-000321-Rg
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMXt-00051X-DK
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:09 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:58108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZDMXs-00050q-Rw; Thu, 09 Jul 2015 20:52:05 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BJB73444; Fri, 10 Jul 2015 08:51:54 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jul 2015 08:51:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 10 Jul 2015 08:51:30 +0800
Message-ID: <1436489490-236-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.559F172A.00B0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f41b062386f56f1f18e3675335b4f1e7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 4/4] vl.c: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 00:52:10 -0000

From: Gonglei <arei.gonglei@huawei.com>

Failing to save or free storage allocated
by "g_strdup(cmd)" leaks it. Let's use a
variable to storage it.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 vl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 3f269dc..399e816 100644
--- a/vl.c
+++ b/vl.c
@@ -1326,16 +1326,19 @@ static int add_semihosting_arg(void *opaque,
 static inline void semihosting_arg_fallback(const char *file, const char *cmd)
 {
     char *cmd_token;
+    char *cmd_str;
 
     /* argv[0] */
     add_semihosting_arg(&semihosting, "arg", file, NULL);
 
+    cmd_str = g_strdup(cmd);
     /* split -append and initialize argv[1..n] */
-    cmd_token = strtok(g_strdup(cmd), " ");
+    cmd_token = strtok(cmd_str, " ");
     while (cmd_token) {
         add_semihosting_arg(&semihosting, "arg", cmd_token, NULL);
         cmd_token = strtok(NULL, " ");
     }
+    g_free(cmd_str);
 }
 
 /***********************************************************/
-- 
1.7.12.4



