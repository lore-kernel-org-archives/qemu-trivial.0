Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLoQt-00050f-5L
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 02:43:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLoQr-0004zi-Cv
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 02:43:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLoQn-0007bH-Ry
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 02:43:29 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:54982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLoQm-0007ai-P1; Thu, 12 Feb 2015 02:43:25 -0500
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBV55378; Thu, 12 Feb 2015 15:43:16 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Feb 2015 15:43:06 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 12 Feb 2015 15:43:02 +0800
Message-ID: <1423726982-11996-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54DC5995.007E, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: efe6d7e49fdc291c3857481dcf50552a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	afaerber@suse.de, Zhoujian <jianjay.zhou@huawei.com>
Subject: [Qemu-trivial] [PATCH] object: fix typo,
	'my_class_init' -> 'derived_class_init'
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
X-List-Received-Date: Thu, 12 Feb 2015 07:43:30 -0000

From: Zhoujian <jianjay.zhou@huawei.com>

Signed-off-by: Zhoujian <jianjay.zhou@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 89c3092..8757573 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -273,7 +273,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  *     .name = TYPE_DERIVED,
  *     .parent = TYPE_MY,
  *     .class_size = sizeof(DerivedClass),
- *     .class_init = my_class_init,
+ *     .class_init = derived_class_init,
  * };
  *   </programlisting>
  * </example>
-- 
1.7.12.4



