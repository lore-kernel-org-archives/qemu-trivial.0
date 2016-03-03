Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPoc-0003po-7q
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:45:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoZ-0003kj-Pd
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoW-0005uK-KQ
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:44:59 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:19935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPoU-0005oe-Dn; Thu, 03 Mar 2016 04:44:54 -0500
Received: from 172.24.1.50 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN05941; Thu, 03 Mar 2016 17:44:32 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:37 +0800
Message-ID: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.56D80780.01D1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bbfae4330c4a10138fcc83c6c447032c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 0/6] fix some coverity complains
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
X-List-Received-Date: Thu, 03 Mar 2016 09:45:00 -0000


Gonglei (6):
  egl-helpers: fix possible resource leak
  sheepdog: fix possible resouce leak and out-of-bounds access
  spice: fix coverity complains
  hostmem-file: fix memory leak
  spapr: fix possible Negative array index read
  smbus: fix memory leak

 backends/hostmem-file.c | 5 ++++-
 block/sheepdog.c        | 9 ++++++---
 hw/i2c/smbus_eeprom.c   | 2 ++
 hw/ppc/spapr.c          | 4 ++++
 ui/egl-helpers.c        | 9 +++------
 ui/spice-display.c      | 4 +---
 6 files changed, 20 insertions(+), 13 deletions(-)

-- 
1.8.5.2



