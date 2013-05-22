Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uf1h6-0002dV-S5
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2013 01:34:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Uf1gx-0002Rf-Db
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 01:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Uf1gp-0008Ur-Iy
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 01:34:27 -0400
Received: from [222.73.24.84] (port=23659 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1Uf1gp-0008Rl-6o; Wed, 22 May 2013 01:34:19 -0400
X-IronPort-AV: E=Sophos;i="4.87,719,1363104000"; 
   d="scan'208";a="7330823"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 22 May 2013 13:31:12 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4M5Y0Dr022017;
	Wed, 22 May 2013 13:34:00 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052213324247-1422186 ;
	Wed, 22 May 2013 13:32:42 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2013 13:33:12 +0800
Message-Id: <c5d67e2881026c5d6cf22fe31bb6e657448da59a.1369193012.git.hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <cover.1369193012.git.hutao@cn.fujitsu.com>
References: <cover.1369193012.git.hutao@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/22 13:32:42,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/22 13:32:43,
	Serialize complete at 2013/05/22 13:32:43
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [RFC PATCH v1 08/20] rtc: remove rtc_set_date
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
X-List-Received-Date: Wed, 22 May 2013 05:34:34 -0000

Since it's not defined and used anywhere.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 include/hw/timer/mc146818rtc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/mc146818rtc.h
index 753dda6..eaf6497 100644
--- a/include/hw/timer/mc146818rtc.h
+++ b/include/hw/timer/mc146818rtc.h
@@ -9,6 +9,5 @@
 ISADevice *rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq);
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
-void rtc_set_date(ISADevice *dev, const struct tm *tm);
 
 #endif /* !MC146818RTC_H */
-- 
1.8.2.3


