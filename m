Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YwmGX-0005T4-7D
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 02:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YwmGR-0005SQ-KC
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 02:53:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YwmGM-0000pv-Ot
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 02:53:31 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:20672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YwmGM-0000Pi-5E; Mon, 25 May 2015 02:53:26 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGM97759; Mon, 25 May 2015 14:48:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 25 May 2015 14:47:59 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 May 2015 14:47:25 +0800
Message-ID: <1432536445-12760-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5562C5A6.0119, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 14aa1eb88d73f80a8e7e419a673810eb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH] vl: fix memory leak spotted by valgrind
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
X-List-Received-Date: Mon, 25 May 2015 06:53:35 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==9276== 13 bytes in 1 blocks are definitely lost in loss record 1,046 of 3,673
==9276==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==9276==    by 0x2EAFBB: malloc_and_trace (vl.c:2556)
==9276==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==9276==    by 0x4A28BD: addr_to_string (vnc.c:123)
==9276==    by 0x4A29AD: vnc_socket_local_addr (vnc.c:139)
==9276==    by 0x4A9AFE: vnc_display_local_addr (vnc.c:3240)
==9276==    by 0x2EF4FE: main (vl.c:4321)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 74c2681..9539e7b 100644
--- a/vl.c
+++ b/vl.c
@@ -4295,8 +4295,9 @@ int main(int argc, char **argv, char **envp)
     /* init remote displays */
     qemu_opts_foreach(qemu_find_opts("vnc"), vnc_init_func, NULL, 0);
     if (show_vnc_port) {
-        printf("VNC server running on `%s'\n",
-               vnc_display_local_addr("default"));
+        char *ret = vnc_display_local_addr("default");
+        printf("VNC server running on `%s'\n", ret);
+        g_free(ret);
     }
 #endif
 #ifdef CONFIG_SPICE
-- 
2.0.4



