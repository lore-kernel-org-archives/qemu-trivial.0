Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFAVz-0004so-Fe
	for mharc-qemu-trivial@gnu.org; Sat, 24 Jan 2015 18:53:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFAVx-0004rH-T2
	for qemu-trivial@nongnu.org; Sat, 24 Jan 2015 18:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFAVx-0003eT-2U
	for qemu-trivial@nongnu.org; Sat, 24 Jan 2015 18:53:17 -0500
Received: from out1134-243.mail.aliyun.com ([42.120.134.243]:45064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFAVq-0003ao-OX; Sat, 24 Jan 2015 18:53:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1411015|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41f05015; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.8) by smtp.aliyun-inc.com(10.194.100.108);
	Sun, 25 Jan 2015 07:53:02 +0800
Message-ID: <54C4322A.3060704@sunrus.com.cn>
Date: Sun, 25 Jan 2015 08:00:42 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 42.120.134.243
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Need call
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
X-List-Received-Date: Sat, 24 Jan 2015 23:53:18 -0000

In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
unlock_user() before go to failure return in default case.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a427f7a..ec9e4fc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3566,6 +3566,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
     }
     default:
         ret = -TARGET_EINVAL;
+        unlock_user(argptr, guest_data, 0);
         goto out;
     }
     unlock_user(argptr, guest_data, 0);
@@ -3685,6 +3686,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
             break;
         }
         default:
+            unlock_user(argptr, guest_data, 0);
             ret = -TARGET_EINVAL;
             goto out;
         }
-- 
1.9.3

