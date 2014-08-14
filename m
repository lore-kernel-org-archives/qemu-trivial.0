Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv30-00022j-UA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWJ-0005JZ-UJ
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWF-0006Nn-L3
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:23 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpW0-0006IZ-6h; Thu, 14 Aug 2014 03:32:05 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11812; Thu, 14 Aug 2014 15:30:55 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:57 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:17 +0800
Message-ID: <1408001361-13580-7-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 06/10] slirp/misc: Use g_malloc() instead
	of malloc()
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
X-List-Received-Date: Thu, 14 Aug 2014 07:32:28 -0000

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



