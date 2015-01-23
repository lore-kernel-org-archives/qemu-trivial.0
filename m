Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEZt8-0006F0-3B
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 03:46:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEZt5-0006C8-Mw
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 03:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YEZt4-0003K6-Ra
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 03:46:43 -0500
Received: from out114-136.biz.mail.alibaba.com ([205.204.114.136]:47202
	helo=out21.biz.mail.alibaba.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YEZsu-0003Hy-5T; Fri, 23 Jan 2015 03:46:32 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1756751|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r46d02015; MF=gang.chen@sunrus.com.cn; PH=DS; RN=3; RT=3;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.147.11.246);
	Fri, 23 Jan 2015 16:46:20 +0800
Message-ID: <54C20C26.6010204@sunrus.com.cn>
Date: Fri, 23 Jan 2015 16:53:58 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.136
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user/syscall.c: Need call
 unlock_user() before go to failure return in default case
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
X-List-Received-Date: Fri, 23 Jan 2015 08:46:44 -0000

In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
unlock_user() before go to failure return in default case.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index aaac6a2..290fdea 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3681,6 +3681,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
         }
         default:
             ret = -TARGET_EINVAL;
+            unlock_user(argptr, guest_data, 0);
             goto out;
         }
         unlock_user(argptr, guest_data, guest_data_size);
-- 
1.9.3 (Apple Git-50)

