Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yc-0002Tt-Rp
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yW-0002IK-HP
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yV-0007Bl-FC
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yP-00078r-OU; Tue, 10 Feb 2015 02:11:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6DAB441825;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9F431946;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9353 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:59 +0300
Message-Id: <71ec7cef01b0f855cb9f774300f80d1ddcb91fc9.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang S <gang.chen@sunrus.com.cn>, Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 10/46] linux-user/syscall.c: Fix typo issue
	for using target_vec[i].iov_len instead of target_vec[i].iov_base
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:13 -0000

From: Chen Gang S <gang.chen@sunrus.com.cn>

It is only a typo issue, need use tswapal(target_vec[i].iov_len) for the
len.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7b6f482..310080c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1906,7 +1906,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     if (target_vec) {
         for (i = 0; i < count; i++) {
             abi_ulong base = tswapal(target_vec[i].iov_base);
-            abi_long len = tswapal(target_vec[i].iov_base);
+            abi_long len = tswapal(target_vec[i].iov_len);
             if (len < 0) {
                 break;
             }
-- 
2.1.4


