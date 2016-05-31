Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mee-0004wV-M4
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7meX-0004qU-2K
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7meR-0003Cs-TA
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7meM-00039o-Sm; Tue, 31 May 2016 12:36:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59E2DC049D5B;
	Tue, 31 May 2016 16:36:13 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QE011053; Tue, 31 May 2016 12:36:10 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Date: Tue, 31 May 2016 18:35:49 +0200
Message-Id: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 31 May 2016 16:36:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 00/16] use macro DIV_ROUND_UP instead of
 (((n) + (d) - 1) /(d))
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2016 16:36:31 -0000

This patch series is the result of coccinelle
script scripts/coccinelle/round.coccii, added by the first patch.

Laurent Vivier (16):
  coccinelle: use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
  parallels: Use DIV_ROUND_UP
  qcow/qcow2: Use DIV_ROUND_UP
  qed: Use DIV_ROUND_UP
  block: Use DIV_ROUND_UP
  crypto: Use DIV_ROUND_UP
  xen: Use DIV_ROUND_UP
  audio: Use DIV_ROUND_UP
  SPICE: Use DIV_ROUND_UP
  rocker: Use DIV_ROUND_UP
  usb: Use DIV_ROUND_UP
  slirp: Use DIV_ROUND_UP
  linux-user: Use DIV_ROUND_UP
  pc-bios/s390-ccw: Use DIV_ROUND_UP
  qemu-timer: Use DIV_ROUND_UP
  hbitmap: Use DIV_ROUND_UP

 block/parallels.c              |  2 +-
 block/qcow.c                   |  4 ++--
 block/qcow2-cluster.c          |  4 ++--
 block/qcow2-refcount.c         |  6 ++----
 block/qed-check.c              |  3 +--
 block/qed.c                    |  3 +--
 block/vvfat.c                  |  3 +--
 crypto/block-luks.c            |  6 ++----
 hw/audio/pcspk.c               |  2 +-
 hw/block/tc58128.c             |  2 +-
 hw/display/xenfb.c             |  4 ++--
 hw/net/rocker/rocker_of_dpa.c  |  5 ++---
 hw/usb/redirect.c              |  6 +++---
 linux-user/syscall.c           |  4 ++--
 pc-bios/s390-ccw/bootmap.c     |  2 +-
 qemu-timer.c                   |  2 +-
 scripts/coccinelle/round.cocci | 19 +++++++++++++++++++
 slirp/dnssearch.c              |  4 ++--
 tests/test-hbitmap.c           |  6 +++---
 ui/spice-display.c             |  2 +-
 xen-hvm.c                      |  2 +-
 21 files changed, 51 insertions(+), 40 deletions(-)
 create mode 100644 scripts/coccinelle/round.cocci

-- 
2.5.5


