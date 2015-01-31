Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHSUG-0003py-H8
	for mharc-qemu-trivial@gnu.org; Sat, 31 Jan 2015 02:29:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YHSUD-0003ka-Jz
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 02:28:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YHSUC-0003LY-EG
	for qemu-trivial@nongnu.org; Sat, 31 Jan 2015 02:28:57 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:65244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YHSU3-0003GJ-Cj; Sat, 31 Jan 2015 02:28:47 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CGQ06835; Sat, 31 Jan 2015 15:28:32 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 31 Jan 2015 15:28:20 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 31 Jan 2015 15:27:55 +0800
Message-ID: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH 0/2] xen_pt: fix two Coverity defects
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
X-List-Received-Date: Sat, 31 Jan 2015 07:28:58 -0000

From: Gonglei <arei.gonglei@huawei.com>


Gonglei (2):
  xen-pt: fix Negative array index read
  xen-pt: fix Out-of-bounds read

 hw/xen/xen_pt_config_init.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
1.7.12.4



