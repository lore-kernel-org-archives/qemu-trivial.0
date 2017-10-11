Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2JfR-0001YN-9A
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2017 12:15:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=450336ad9=anthony.perard@citrix.com>)
	id 1e2JfP-0001YE-Qa
	for qemu-trivial@nongnu.org; Wed, 11 Oct 2017 12:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=450336ad9=anthony.perard@citrix.com>)
	id 1e2JfL-0007rv-0o
	for qemu-trivial@nongnu.org; Wed, 11 Oct 2017 12:15:31 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:59274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=450336ad9=anthony.perard@citrix.com>)
	id 1e2JfK-0007rE-Pj; Wed, 11 Oct 2017 12:15:26 -0400
X-IronPort-AV: E=Sophos;i="5.43,362,1503360000"; d="scan'208";a="453437109"
Date: Wed, 11 Oct 2017 17:15:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laurent Vivier <lvivier@redhat.com>
CC: <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>, Michael Tokarev
	<mjt@tls.msk.ru>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
	Tsirkin" <mst@redhat.com>
Message-ID: <20171011161523.GS1771@perard.uk.xensource.com>
References: <20171010133241.11330-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20171010133241.11330-1-lvivier@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Subject: Re: [Qemu-trivial] [PATCH] pc: remove useless hot_add_cpu
 initialisation
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
X-List-Received-Date: Wed, 11 Oct 2017 16:15:32 -0000

On Tue, Oct 10, 2017 at 03:32:41PM +0200, Laurent Vivier wrote:
> Since 4458fb3a79 (pc: Eliminate pc_default_machine_options()),
> hot_add_cpu is set in pc_machine_class_init(), so we don't
> need to set it in pc_q35_machine_options(), pc_i440fx_machine_options()
> and xenfv_machine_options(), except to clear it in
> pc_i440fx_1_4_machine_opt().
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/i386/pc_piix.c | 2 --
>  hw/i386/pc_q35.c  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 9ff79b1fd9..caf166aede 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -428,7 +428,6 @@ static void pc_i440fx_machine_options(MachineClass *m)
>  {
>      m->family = "pc_piix";
>      m->desc = "Standard PC (i440FX + PIIX, 1996)";
> -    m->hot_add_cpu = pc_hot_add_cpu;
>      m->default_machine_opts = "firmware=bios-256k.bin";
>      m->default_display = "std";
>  }
> @@ -1123,7 +1122,6 @@ static void xenfv_machine_options(MachineClass *m)
>      m->desc = "Xen Fully-virtualized PC";
>      m->max_cpus = HVM_MAX_VCPUS;
>      m->default_machine_opts = "accel=xen";
> -    m->hot_add_cpu = pc_hot_add_cpu;
>  }

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

>  
>  DEFINE_PC_MACHINE(xenfv, "xenfv", pc_xen_hvm_init,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 6c4ec4be4e..da3ea602e1 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -295,7 +295,6 @@ static void pc_q35_machine_options(MachineClass *m)
>  {
>      m->family = "pc_q35";
>      m->desc = "Standard PC (Q35 + ICH9, 2009)";
> -    m->hot_add_cpu = pc_hot_add_cpu;
>      m->units_per_default_bus = 1;
>      m->default_machine_opts = "firmware=bios-256k.bin";
>      m->default_display = "std";

-- 
Anthony PERARD

