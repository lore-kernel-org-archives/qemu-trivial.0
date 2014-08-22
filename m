Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKk9H-00008H-8q
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 04:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XKk9B-0008Tg-NX
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XKk96-0001Mb-Ul
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:24:33 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:17910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XKk8w-0001Kw-7w; Fri, 22 Aug 2014 04:24:19 -0400
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATJ95448; Fri, 22 Aug 2014 16:24:04 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 22 Aug 2014 16:23:56 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 22 Aug 2014 16:23:51 +0800
Message-ID: <1408695831-11844-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.53F6FE25.00AD,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 5ef4fd0748b1ea24a873b64aab3c8e9d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, riku.voipio@iki.fi, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH] linux-user: fix file descriptor leaks
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
X-List-Received-Date: Fri, 22 Aug 2014 08:24:38 -0000

Handle variable "fd_orig" going out of scope leaks the handle.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a50229d..11a48c2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5082,6 +5082,7 @@ static int open_self_cmdline(void *cpu_env, int fd)
 
         if (word_skipped) {
             if (write(fd, cp_buf, nb_read) != nb_read) {
+                close(fd_orig);
                 return -1;
             }
         }
-- 
1.7.12.4



