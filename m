Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWJjB-0001D9-S3
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 22:23:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJj9-00018x-2T
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:23:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJj8-0002s9-9A
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:23:55 -0500
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:57704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJj7-0002qz-Ly
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:23:54 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <zhihuili@linux.vnet.ibm.com>;
	Fri, 2 Dec 2011 08:53:43 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
	by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2011 08:53:40 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB23NcYQ3690558; Fri, 2 Dec 2011 08:53:40 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pB23Nb6o012507; Fri, 2 Dec 2011 08:53:38 +0530
Received: from mm.cn.ibm.com (mm.cn.ibm.com [9.115.116.119] (may be forged))
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB23NYBx012308; Fri, 2 Dec 2011 08:53:35 +0530
From: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Dec 2011 11:23:32 +0800
Message-Id: <1322796212-324-1-git-send-email-zhihuili@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
x-cbid: 11120203-5564-0000-0000-00000058356B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.4
Cc: qemu-trivial@nongnu.org, Li Zhi Hui <zhihuili@linux.vnet.ibm.com>,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] hw/smbus_eeprom.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 03:23:56 -0000

Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
---
 hw/smbus_eeprom.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/smbus_eeprom.c b/hw/smbus_eeprom.c
index 5d080ab..d66fbbc 100644
--- a/hw/smbus_eeprom.c
+++ b/hw/smbus_eeprom.c
@@ -142,4 +142,5 @@ void smbus_eeprom_init(i2c_bus *smbus, int nb_eeprom,
         qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
         qdev_init_nofail(eeprom);
     }
+    g_free(eeprom_buf);
 }
-- 
1.7.4.1


