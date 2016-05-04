Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axwUM-0002Hp-BT
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 09:05:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwUC-0001pi-PE
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:05:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwU1-0004RW-3V
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:04:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1axwTj-0004IO-5M; Wed, 04 May 2016 09:04:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E26CE7AE97;
	Wed,  4 May 2016 13:04:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44D4FaZ002315; Wed, 4 May 2016 09:04:16 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Date: Wed,  4 May 2016 15:04:05 +0200
Message-Id: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] muldiv64() trivial fixes
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
X-List-Received-Date: Wed, 04 May 2016 13:05:11 -0000

Some fixes in the use of muldiv64()

The patches have been generated with the help of coccinelle.

The first patch contains the scripts used to generate the two following
patches. As it is done for linux, I've added the scripts under
scripts/coccinelle.

Laurent Vivier (3):
  scripts: add muldiv64() checking coccinelle scripts
  The only 64bit parameter of muldiv64() is the first one.
  remove useless muldiv64()

 hw/timer/omap_gptimer.c                  |  4 +--
 hw/usb/hcd-ohci.c                        |  2 +-
 scripts/coccinelle/remove_muldiv64.cocci |  6 +++++
 scripts/coccinelle/swap_muldiv64.cocci   | 46 ++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 scripts/coccinelle/remove_muldiv64.cocci
 create mode 100644 scripts/coccinelle/swap_muldiv64.cocci

-- 
2.5.5


