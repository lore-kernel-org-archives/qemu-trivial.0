Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGkhc-0001yg-NL
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 04:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhW-0001oh-ME
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhR-00027c-MG
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:30 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:60190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGkhF-00024e-TB; Mon, 11 Aug 2014 04:11:14 -0400
Received: from 172.24.2.119 (EHLO szxeml451-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC25427; Mon, 11 Aug 2014 16:11:06 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml451-hub.china.huawei.com
	(10.82.67.194) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 16:10:57 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 16:10:24 +0800
Message-ID: <1407744626-4984-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] trivial patches for pci-host
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
X-List-Received-Date: Mon, 11 Aug 2014 08:11:35 -0000

From: Gonglei <arei.gonglei@huawei.com>

Gonglei (2):
  pci-host: update obsolete reference about piix_pci.c
  pci-host: update uncorresponding description

 hw/isa/lpc_ich9.c         | 2 +-
 hw/pci-host/pam.c         | 4 ++--
 hw/pci-host/q35.c         | 2 +-
 include/hw/pci-host/pam.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.12.4



