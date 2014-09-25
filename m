Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX5eB-0006mu-5i
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 05:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5e4-0006au-JT
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dz-0004JW-Q2
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:28 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:56425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX5do-0004CW-Rl; Thu, 25 Sep 2014 05:47:13 -0400
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUV43902; Thu, 25 Sep 2014 17:46:43 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 17:46:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Sep 2014 17:46:22 +0800
Message-ID: <1411638384-5844-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.5423E484.00D6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5cb82291bade9dbe0b3e01d4419ffe20
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 2/4] os-posix: report error message when lock
	file failed
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
X-List-Received-Date: Thu, 25 Sep 2014 09:47:33 -0000

From: Gonglei <arei.gonglei@huawei.com>

It will cause that create vm failed When manager
tool is killed forcibly (kill -9 libvirtd_pid),
the file not was unlink, and unlock. It's better
that report the error message for users.

Signed-off-by: Huangweidong <weidong.huang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 os-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/os-posix.c b/os-posix.c
index 9d5ae70..89831dc 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -316,6 +316,7 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
     if (lockf(fd, F_TLOCK, 0) == -1) {
+        error_report("lock file '%s' failed: %s", filename, strerror(errno));
         close(fd);
         return -1;
     }
-- 
1.7.12.4



