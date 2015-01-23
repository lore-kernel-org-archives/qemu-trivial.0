Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEb2W-0000KN-Dn
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:00:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEb2U-0000I8-C0
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:00:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEb2T-0001UQ-C8
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:00:30 -0500
Received: from out114-135.biz.mail.alibaba.com ([205.204.114.135]:39309
	helo=out11.biz.mail.alibaba.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEb2M-0001Rq-LP; Fri, 23 Jan 2015 05:00:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2074681|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r46d02012; MF=gang.chen@sunrus.com.cn; PH=DS; RN=3; RT=3;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.147.34.67);
	Fri, 23 Jan 2015 18:00:12 +0800
Message-ID: <54C21D76.8050808@sunrus.com.cn>
Date: Fri, 23 Jan 2015 18:07:50 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.135
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user/syscall.c: Fix typo issue for
 using target_vec[i].iov_len instead of target_vec[i].iov_base
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
X-List-Received-Date: Fri, 23 Jan 2015 10:00:31 -0000

It is only a typo issue, need use tswapal(target_vec[i].iov_len) for the
len.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a66c2ae..8260ed7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1896,7 +1896,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     if (target_vec) {
         for (i = 0; i < count; i++) {
             abi_ulong base = tswapal(target_vec[i].iov_base);
-            abi_long len = tswapal(target_vec[i].iov_base);
+            abi_long len = tswapal(target_vec[i].iov_len);
             if (len < 0) {
                 break;
             }
-- 
1.9.3 (Apple Git-50)

