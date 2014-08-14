Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv31-00023g-Ai
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWK-0005KQ-8A
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWF-0006Oi-VE
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:24 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:4989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpW1-0006Ij-Tz; Thu, 14 Aug 2014 03:32:06 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11836; Thu, 14 Aug 2014 15:30:59 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:58 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:18 +0800
Message-ID: <1408001361-13580-8-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Subject: [Qemu-trivial] [PATCH v6 07/10] linux-user: check return value of
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
X-List-Received-Date: Thu, 14 Aug 2014 07:32:28 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Acked-by: Riku Voipio <riku.voipio@linaro.org>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a50229d..8e5ccf1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2870,6 +2870,10 @@ static inline abi_long do_msgsnd(int msqid, abi_long msgp,
     if (!lock_user_struct(VERIFY_READ, target_mb, msgp, 0))
         return -TARGET_EFAULT;
     host_mb = malloc(msgsz+sizeof(long));
+    if (!host_mb) {
+        unlock_user_struct(target_mb, msgp, 0);
+        return -TARGET_ENOMEM;
+    }
     host_mb->mtype = (abi_long) tswapal(target_mb->mtype);
     memcpy(host_mb->mtext, target_mb->mtext, msgsz);
     ret = get_errno(msgsnd(msqid, host_mb, msgsz, msgflg));
-- 
1.7.12.4



