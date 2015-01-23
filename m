Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbBt-0000g9-ED
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:10:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEbBn-0000Vx-Pe
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:10:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEbBi-0004Rl-Uh
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:10:07 -0500
Received: from mail113-248.mail.alibaba.com ([205.204.113.248]:60176
	helo=us-alimail-mta1.hst.scl.en.alidc.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEbBd-0004LF-Hh; Fri, 23 Jan 2015 05:09:57 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1176492|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03020; MF=gang.chen@sunrus.com.cn; PH=DS; RN=3; RT=3;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.147.11.248);
	Fri, 23 Jan 2015 18:09:44 +0800
Message-ID: <54C21FB2.1050603@sunrus.com.cn>
Date: Fri, 23 Jan 2015 18:17:22 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 205.204.113.248
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user/main.c: Remove redundant
	end_exclusive()
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
X-List-Received-Date: Fri, 23 Jan 2015 10:10:12 -0000

start/end_exclusive() need be pairs, except the start_exclusive() in
stop_all_tasks() which is only used by force_sig(), which will be abort.
So at present, start_exclusive() in stop_all_task() need not be paired.

So need remove end_exclusive() after queue_signal(). If could really
return from queue_signal(), which meant stop_all_task() is not called (
at least, not called in time), the next end_exclusive() would be issue.

Also use TARGET_SIGSEGV instead of SIGSEGV, since queue_signal() is for
TARGET_*, at present, queue_signal() is a normal function which may call
force_sig(), or return (may kill pid or queue signal, then return).

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 8c70be4..a410a17 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -517,14 +517,12 @@ segv:
     end_exclusive();
     /* We get the PC of the entry address - which is as good as anything,
        on a real kernel what you get depends on which mode it uses. */
-    info.si_signo = SIGSEGV;
+    info.si_signo = TARGET_SIGSEGV;
     info.si_errno = 0;
     /* XXX: check env->error_code */
     info.si_code = TARGET_SEGV_MAPERR;
     info._sifields._sigfault._addr = env->exception.vaddress;
     queue_signal(env, info.si_signo, &info);
-
-    end_exclusive();
 }
 
 /* Handle a jump to the kernel code page.  */
-- 
1.9.3 (Apple Git-50)

