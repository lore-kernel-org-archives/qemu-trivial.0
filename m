Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpFE-0003yC-S8
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpF8-0003mc-Qc
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpF2-0003qi-FL
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:30 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:65131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEp-0003il-Ku; Mon, 11 Aug 2014 09:02:12 -0400
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71171; Mon, 11 Aug 2014 21:01:11 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 21:01:03 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:50 +0800
Message-ID: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 0/8] don't use Yoda conditions
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:35 -0000

From: Gonglei <arei.gonglei@huawei.com>

$WHATEVER: don't use 'Yoda conditions'

'Yoda conditions' are not part of idiomatic QEMU coding
style, so rewrite them in the more usual order.

v5:
 - rebase on latest qemu master and adding 'reviewed-by'.
 - Cc'ing qemu-trivial@.

v4:
 - trivial typo for patch 1/8 suggested by Eric, thanks.

v3:
 - rewrite CODINT_STYLE file suggested by Eric, thanks.
 - rename the patch serials.
 - imitate nearby code about using '!value' or 'value == NULL' at
   every patch suggested by Markus.

v2:
 - add more specific commit messages suggested by PMM, thanks.
 - introduce section of conditional statement to CODING_STYLE.

Gonglei (8):
  CODING_STYLE: Section about conditional statement
  usb: don't use 'Yoda conditions'
  audio: don't use 'Yoda conditions'
  isa-bus: don't use 'Yoda conditions'
  don't use 'Yoda conditions'
  spice: don't use 'Yoda conditions'
  vl: don't use 'Yoda conditions'
  vmxnet3: don't use 'Yoda conditions'

 CODING_STYLE         | 14 ++++++++++++++
 hw/audio/gus.c       |  2 +-
 hw/audio/hda-codec.c |  3 ++-
 hw/audio/sb16.c      |  6 +++---
 hw/isa/isa-bus.c     |  2 +-
 hw/net/vmxnet3.c     | 16 ++++++++--------
 hw/usb/dev-audio.c   |  2 +-
 hw/usb/dev-mtp.c     |  4 ++--
 hw/usb/hcd-ehci.c    |  2 +-
 qdev-monitor.c       |  2 +-
 qemu-char.c          |  2 +-
 ui/spice-core.c      |  4 ++--
 util/qemu-sockets.c  |  2 +-
 vl.c                 |  5 +++--
 14 files changed, 41 insertions(+), 25 deletions(-)

-- 
1.7.12.4



