Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEawH-000586-It
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 04:54:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEawA-00050O-Tx
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 04:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEawA-0007VD-1o
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 04:53:58 -0500
Received: from out11.biz.mail.alibaba.com ([205.204.114.131]:42277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEavy-0007R7-4E; Fri, 23 Jan 2015 04:53:46 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2392635|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03016; MF=gang.chen@sunrus.com.cn; PH=DS; RN=3; RT=3;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.38);
	Fri, 23 Jan 2015 17:53:31 +0800
Message-ID: <54C21BE5.9080100@sunrus.com.cn>
Date: Fri, 23 Jan 2015 18:01:09 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.131
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Free the vec[i] in
 failure processing code block
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
X-List-Received-Date: Fri, 23 Jan 2015 09:54:04 -0000

When failure occurs during allocating vec[i], also need free all
allocated vec[i] in failure processing code block before return.

In unlock_user(), it will check vec[i].iov_base whether is NULL, so need
not check it again outside.

If error is EFAULT when "i == 0", vec[i].iov_base is NULL, then can just
skip it, so can still use "while (--i >= 0)" for the free looping.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 290fdea..a66c2ae 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1873,6 +1873,11 @@ static struct iovec *lock_iovec(int type, abi_ulong target_addr,
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
1.9.3 (Apple Git-50)

