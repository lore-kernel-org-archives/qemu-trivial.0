Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGc-0006nD-F2
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGW-0006a6-Il
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGS-0003wP-Ee
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:47183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iC-1p; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml412-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCJ79973; Sat, 15 Nov 2014 18:07:01 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml412-hub.china.huawei.com
	(10.82.67.91) with Microsoft SMTP Server id 14.3.158.1; Sat, 15 Nov 2014
	18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:39 +0800
Message-ID: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 0/9] Fix Coverity warning reports
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Those reports come from scan.coverity.com for Qemu,
which Paolo told me. There are so many defects that
I can't repair all of them. That's will be great
if more and more people to join us. :) 

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>
Cc: qemu-trivial@nongnu.org

Gonglei (9):
  l2tpv3: fix fd leak
  mips_mipssim: fix use-after-free for filename
  qga: fix false negative argument passing
  loader: fix NEGATIVE_RETURNS
  nvme: remove superfluous check
  acl: fix memory leak
  qemu-char: fix MISSING_COMMA
  shpc: fix dead code
  hcd-musb: fix dereference null return value

 hw/block/nvme.c        |  3 +--
 hw/core/loader.c       | 13 +++++++++++++
 hw/mips/mips_mipssim.c |  2 +-
 hw/pci/shpc.c          |  3 ++-
 hw/usb/hcd-musb.c      |  4 ++++
 net/l2tpv3.c           |  2 +-
 qemu-char.c            |  2 +-
 qga/main.c             |  4 ++--
 util/acl.c             | 10 +++++-----
 9 files changed, 30 insertions(+), 13 deletions(-)

-- 
1.7.12.4



