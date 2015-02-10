Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yh-0002e8-Vl
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yZ-0002NM-Dc
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yY-0007EB-Hh
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yO-00077e-PX; Tue, 10 Feb 2015 02:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4F67941823;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 73BE38C9;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9350 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:58 +0300
Message-Id: <7eff518b6c91bdd62710dd9868ec7a17bd6f1434.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang S <gang.chen@sunrus.com.cn>, Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 09/46] linux-user/syscall.c: lock_iovec:
	unlock vec[i] in failure processing code block
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:20 -0000

From: Chen Gang S <gang.chen@sunrus.com.cn>

When failure occurs during locking of vec[i], we also need to unlock all
already locked vec[i] in failure processing code block before return.

Code in unlock_user() checks vec[i].iov_base for NULL, so there's no
need not check it .

If error is EFAULT when "i == 0", vec[i].iov_base is NULL, we can just
skip it, so can still use "while (--i >= 0)" loop condition.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d4398b9..7b6f482 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1883,6 +1883,11 @@ static struct iovec *lock_iovec(int type, abi_ulong target_addr,
     return vec;
 
  fail:
+    while (--i >= 0) {
+        if (tswapal(target_vec[i].iov_len) > 0) {
+            unlock_user(vec[i].iov_base, tswapal(target_vec[i].iov_base), 0);
+        }
+    }
     unlock_user(target_vec, target_addr, 0);
  fail2:
     free(vec);
-- 
2.1.4


