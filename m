Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1azlBm-0001Wn-6v
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2016 09:25:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBd-0001EC-AT
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBX-00042Y-36
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1azlBM-0003xo-97; Mon, 09 May 2016 09:25:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52685201FA;
	Mon,  9 May 2016 13:25:07 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u49DP4cd017024; Mon, 9 May 2016 09:25:05 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>
Date: Mon,  9 May 2016 15:24:54 +0200
Message-Id: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 09 May 2016 13:25:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/5] muldiv64() trivial fixes
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
X-List-Received-Date: Mon, 09 May 2016 13:25:30 -0000

Some fixes in the use of muldiv64()

The patches have been generated with the help of coccinelle.

The first patch contains the scripts used to generate the two following
patches. As it is done for linux, I've added the scripts under
scripts/coccinelle.

v2:
- rework scripts/coccinelle/swap_muldiv64.cocci, to simplify it
- add overflow_muldiv64.cocci and simplify_muldiv64.cocci
- add resulting patches

Laurent Vivier (5):
  scripts: add muldiv64() checking coccinelle scripts
  The only 64bit parameter of muldiv64() is the first one.
  remove useless muldiv64()
  replace muldiv64(a, b, c) by (uint64_t)a * b / c
  ppc: Remove a potential overflow in muldiv64()

 hw/audio/gus.c                             |  2 +-
 hw/ppc/ppc.c                               |  2 +-
 hw/timer/omap_gptimer.c                    |  4 ++--
 hw/usb/hcd-ohci.c                          |  2 +-
 hw/xtensa/pic_cpu.c                        |  4 ++--
 scripts/coccinelle/overflow_muldiv64.cocci | 16 ++++++++++++++++
 scripts/coccinelle/remove_muldiv64.cocci   |  6 ++++++
 scripts/coccinelle/simplify_muldiv64.cocci | 11 +++++++++++
 scripts/coccinelle/swap_muldiv64.cocci     | 13 +++++++++++++
 9 files changed, 53 insertions(+), 7 deletions(-)
 create mode 100644 scripts/coccinelle/overflow_muldiv64.cocci
 create mode 100644 scripts/coccinelle/remove_muldiv64.cocci
 create mode 100644 scripts/coccinelle/simplify_muldiv64.cocci
 create mode 100644 scripts/coccinelle/swap_muldiv64.cocci

-- 
2.5.5


