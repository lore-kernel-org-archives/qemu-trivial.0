Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFKrX-0006gA-PS
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 05:56:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFKrU-0006bI-Q0
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 05:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFKrT-0007VM-Qk
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 05:56:12 -0500
Received: from out11.biz.mail.alibaba.com ([205.204.114.131]:40086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFKrP-0007Tc-7e; Sun, 25 Jan 2015 05:56:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1252449|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03020; MF=gang.chen@sunrus.com.cn; PH=DS; RN=5; RT=5;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.110) by smtp.aliyun-inc.com(10.194.100.109);
	Sun, 25 Jan 2015 18:55:49 +0800
Message-ID: <54C4CD81.10503@sunrus.com.cn>
Date: Sun, 25 Jan 2015 19:03:29 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi, david.gilbert@linaro.org, 
	david.gilbert@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.131
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] linux-user/main.c: Remove redundant
 end_exclusive() in arm_kernel_cmpxchg64_helper()
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
X-List-Received-Date: Sun, 25 Jan 2015 10:56:13 -0000

start/end_exclusive() need be pairs, except the start_exclusive() in
stop_all_tasks() which is only used by force_sig(), which will be abort.
So at present, start_exclusive() in stop_all_task() need not be paired.

queue_signal() may call force_sig(), or return after kill pid (or queue
signal). If could return from queue_signal(), stop_all_task() would not
be called in time, the next end_exclusive() would be issue.

So in arm_kernel_cmpxchg64_helper() for ARM, need remove end_exclusive()
after queue_signal(). The related commit: "97cc756 linux-user: Implement
new ARM 64 bit cmpxchg kernel helper".


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 8c70be4..2d52c1f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -523,8 +523,6 @@ segv:
     info.si_code = TARGET_SEGV_MAPERR;
     info._sifields._sigfault._addr = env->exception.vaddress;
     queue_signal(env, info.si_signo, &info);
-
-    end_exclusive();
 }
 
 /* Handle a jump to the kernel code page.  */
-- 
1.9.3

