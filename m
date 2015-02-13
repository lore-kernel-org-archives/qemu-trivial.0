Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YMApw-00087H-WA
	for mharc-qemu-trivial@gnu.org; Fri, 13 Feb 2015 02:38:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1YM9hI-0005b4-Id
	for qemu-trivial@nongnu.org; Fri, 13 Feb 2015 01:25:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1YM9hH-0007lD-DI
	for qemu-trivial@nongnu.org; Fri, 13 Feb 2015 01:25:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1YM9hC-0007kN-Go; Fri, 13 Feb 2015 01:25:46 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1D6PivO032416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Feb 2015 01:25:44 -0500
Received: from [10.72.4.138] (vpn1-4-138.pek2.redhat.com [10.72.4.138])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1D6PXXI027921; Fri, 13 Feb 2015 01:25:36 -0500
Date: Fri, 13 Feb 2015 06:33:31 +0008
From: Jason Wang <jasowang@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-Id: <1423808731.4864.0@smtp.corp.redhat.com>
In-Reply-To: <1423738334-13545-1-git-send-email-armbru@redhat.com>
References: <1423738334-13545-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Fri, 13 Feb 2015 02:38:51 -0500
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] hmp: Normalize HMP
 command handler names
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
X-List-Received-Date: Fri, 13 Feb 2015 06:25:54 -0000



On Thu, Feb 12, 2015 at 6:52 PM, Markus Armbruster <armbru@redhat.com> 
wrote:
> When I can't guess a handler's name, I have to look it up in
> hmp-commands.hx.  Happens often enough to annoy me.  Let's make them
> more predictable.
> 
> Touches several subsystems because HMP command handlers are still
> spread far and wide, but the changes are trivial.  Speak up if you
> want your subsystem's part routed through your tree rather than
> -trivial.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> 
> Markus Armbruster (3):
>   hmp: Clean up declarations for long-gone info handlers
>   hmp: Name HMP command handler functions hmp_COMMAND()
>   hmp: Name HMP info handler functions hmp_info_SUBCOMMAND()
> 
>  block/block-backend.c          |   6 +-
>  blockdev.c                     |   6 +-
>  device-hotplug.c               |   2 +-
>  hmp-commands.hx                |  86 +++++++++++++-------------
>  hmp.c                          |   6 +-
>  hmp.h                          |   6 +-
>  hw/core/loader.c               |   2 +-
>  hw/intc/i8259.c                |   4 +-
>  hw/intc/lm32_pic.c             |   4 +-
>  hw/pci/pci-hotplug-old.c       |   4 +-
>  hw/pci/pci-stub.c              |   2 +-
>  hw/pci/pcie_aer.c              |   2 +-
>  hw/sparc/sun4m.c               |   4 +-
>  hw/usb/bus.c                   |   2 +-
>  hw/usb/host-libusb.c           |   2 +-
>  hw/usb/host-stub.c             |   2 +-
>  include/hw/i386/pc.h           |   4 +-
>  include/hw/lm32/lm32_pic.h     |   4 +-
>  include/hw/loader.h            |   2 +-
>  include/hw/sparc/sun4m.h       |   4 +-
>  include/hw/usb.h               |   2 +-
>  include/migration/migration.h  |   4 --
>  include/monitor/qdev.h         |   4 +-
>  include/net/net.h              |   6 +-
>  include/net/slirp.h            |   6 +-
>  include/sysemu/block-backend.h |   2 +-
>  include/sysemu/blockdev.h      |   4 +-
>  include/sysemu/sysemu.h        |  23 +++----
>  include/ui/console.h           |   2 +-
>  include/ui/qemu-spice.h        |   3 -
>  monitor.c                      | 134 
> ++++++++++++++++++++---------------------
>  net/net.c                      |   6 +-
>  net/slirp.c                    |   6 +-
>  qdev-monitor.c                 |   4 +-
>  savevm.c                       |   6 +-
>  ui/input.c                     |   2 +-
>  vl.c                           |   4 +-
>  37 files changed, 181 insertions(+), 191 deletions(-)
> 
> -- 
> 1.9.3
> 

For net parts:

Acked-by: Jason Wang <jasowang@redhat.com>


