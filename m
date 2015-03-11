Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVbtj-0006DS-F1
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 04:21:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbth-00069W-83
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbtg-00073H-G7
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:45 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:38081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YVbtb-0006zA-O4; Wed, 11 Mar 2015 04:21:40 -0400
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CII61951; Wed, 11 Mar 2015 16:21:23 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Mar 2015 16:21:12 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Mar 2015 16:20:59 +0800
Message-ID: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] ui: two small fixes
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
X-List-Received-Date: Wed, 11 Mar 2015 08:21:46 -0000

From: Gonglei <arei.gonglei@huawei.com>

patch 1 reported by coverity several month ago, 
patch 2 is founded by code review.

Gonglei (2):
  ui/console: fix OVERFLOW_BEFORE_WIDEN
  vnc: avoid possible file handler leak

 ui/console.c | 4 ++--
 ui/vnc.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.12.4



