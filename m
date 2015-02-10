Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4VX-0006pq-5x
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VS-0006hk-KC
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VR-0003pN-Mk
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4VL-0003lo-S2; Tue, 10 Feb 2015 01:41:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 38F784182A;
	Tue, 10 Feb 2015 09:41:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BBFCE935;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9357 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:01 +0300
Message-Id: <dec0473dc683ac0ddd7946acdebd285728966a02.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang S <gang.chen@sunrus.com.cn>, Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 12/46] linux-user/syscall.c: do_ioctl_dm: Need
	to call unlock_user() before going to failure return in default case
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:11 -0000

From: Chen Gang S <gang.chen@sunrus.com.cn>

In abi_long do_ioctl_dm(), after lock_user() call, the code does
not call unlock_user() before going to failure return in default case.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 310080c..5720195 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3576,6 +3576,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
     }
     default:
         ret = -TARGET_EINVAL;
+        unlock_user(argptr, guest_data, 0);
         goto out;
     }
     unlock_user(argptr, guest_data, 0);
@@ -3695,6 +3696,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
             break;
         }
         default:
+            unlock_user(argptr, guest_data, 0);
             ret = -TARGET_EINVAL;
             goto out;
         }
-- 
2.1.4


