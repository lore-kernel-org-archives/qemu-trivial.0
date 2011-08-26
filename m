Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qx1uq-0004Pd-AK
	for mharc-qemu-trivial@gnu.org; Fri, 26 Aug 2011 15:18:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1Qx1un-0004PH-HO
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1Qx1um-0006nW-Jo
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:18:05 -0400
Received: from fe02x03-cgp.akado.ru ([77.232.31.165]:55681 helo=akado.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>)
	id 1Qx1um-0006nI-Dk; Fri, 26 Aug 2011 15:18:04 -0400
Received: from [10.0.66.9] ([10.0.66.9] verified)
	by fe02-cgp.akado.ru (CommuniGate Pro SMTP 5.2.13)
	with ESMTPS id 227098467; Fri, 26 Aug 2011 23:18:00 +0400
Date: Fri, 26 Aug 2011 23:17:59 +0400 (MSD)
From: malc <av1474@comtv.ru>
X-X-Sender: malc@linmac
To: Alon Levy <alevy@redhat.com>
In-Reply-To: <1314385561-22519-1-git-send-email-alevy@redhat.com>
Message-ID: <alpine.LNX.2.00.1108262316530.3630@linmac>
References: <1314385561-22519-1-git-send-email-alevy@redhat.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 77.232.31.165
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci-stub: fix comment
	typo
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
X-List-Received-Date: Fri, 26 Aug 2011 19:18:06 -0000

On Fri, 26 Aug 2011, Alon Levy wrote:

> Signed-off-by: Alon Levy <alevy@redhat.com>

> ---
>  hw/pci-stub.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/pci-stub.c b/hw/pci-stub.c
> index c5a0aa8..8454c30 100644
> --- a/hw/pci-stub.c
> +++ b/hw/pci-stub.c
> @@ -1,5 +1,5 @@
>  /*
> - * PCI stubs for plathome that doesn't support pci bus.
> + * PCI stubs for platforms that doesn't support pci bus.
>   *
>   * Copyright (c) 2010 Isaku Yamahata <yamahata at valinux co jp>
>   *                    VA Linux Systems Japan K.K.
> 

I doubt that this is correct from grammatical standpoint (plural begs for
do, not does), not a native speaker though..

-- 
mailto:av1474@comtv.ru

