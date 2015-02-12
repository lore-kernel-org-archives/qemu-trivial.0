Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLrNq-0002CZ-A3
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 05:52:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNi-000206-A5
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNh-0006Vd-Da
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLrNa-0006Ti-FD; Thu, 12 Feb 2015 05:52:18 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CAqHF8004981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Feb 2015 05:52:17 -0500
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1CAqEOu001505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Feb 2015 05:52:16 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 24B23303F912; Thu, 12 Feb 2015 11:52:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Feb 2015 11:52:11 +0100
Message-Id: <1423738334-13545-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH 0/3] hmp: Normalize HMP command handler names
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
X-List-Received-Date: Thu, 12 Feb 2015 10:52:31 -0000

When I can't guess a handler's name, I have to look it up in
hmp-commands.hx.  Happens often enough to annoy me.  Let's make them
more predictable.

Touches several subsystems because HMP command handlers are still
spread far and wide, but the changes are trivial.  Speak up if you
want your subsystem's part routed through your tree rather than
-trivial.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>

Markus Armbruster (3):
  hmp: Clean up declarations for long-gone info handlers
  hmp: Name HMP command handler functions hmp_COMMAND()
  hmp: Name HMP info handler functions hmp_info_SUBCOMMAND()

 block/block-backend.c          |   6 +-
 blockdev.c                     |   6 +-
 device-hotplug.c               |   2 +-
 hmp-commands.hx                |  86 +++++++++++++-------------
 hmp.c                          |   6 +-
 hmp.h                          |   6 +-
 hw/core/loader.c               |   2 +-
 hw/intc/i8259.c                |   4 +-
 hw/intc/lm32_pic.c             |   4 +-
 hw/pci/pci-hotplug-old.c       |   4 +-
 hw/pci/pci-stub.c              |   2 +-
 hw/pci/pcie_aer.c              |   2 +-
 hw/sparc/sun4m.c               |   4 +-
 hw/usb/bus.c                   |   2 +-
 hw/usb/host-libusb.c           |   2 +-
 hw/usb/host-stub.c             |   2 +-
 include/hw/i386/pc.h           |   4 +-
 include/hw/lm32/lm32_pic.h     |   4 +-
 include/hw/loader.h            |   2 +-
 include/hw/sparc/sun4m.h       |   4 +-
 include/hw/usb.h               |   2 +-
 include/migration/migration.h  |   4 --
 include/monitor/qdev.h         |   4 +-
 include/net/net.h              |   6 +-
 include/net/slirp.h            |   6 +-
 include/sysemu/block-backend.h |   2 +-
 include/sysemu/blockdev.h      |   4 +-
 include/sysemu/sysemu.h        |  23 +++----
 include/ui/console.h           |   2 +-
 include/ui/qemu-spice.h        |   3 -
 monitor.c                      | 134 ++++++++++++++++++++---------------------
 net/net.c                      |   6 +-
 net/slirp.c                    |   6 +-
 qdev-monitor.c                 |   4 +-
 savevm.c                       |   6 +-
 ui/input.c                     |   2 +-
 vl.c                           |   4 +-
 37 files changed, 181 insertions(+), 191 deletions(-)

-- 
1.9.3


