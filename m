Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YwzGI-00028q-Il
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 16:46:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YwzGG-00025Z-3f
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 16:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YwzGF-0001DL-8X
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 16:46:12 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56454 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1YwzGB-0001By-2J; Mon, 25 May 2015 16:46:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 20664AC69;
	Mon, 25 May 2015 20:46:06 +0000 (UTC)
Message-ID: <55638A0C.1000902@suse.de>
Date: Mon, 25 May 2015 22:46:04 +0200
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, afaerber@suse.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] device-tree: Make a common-obj
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
X-List-Received-Date: Mon, 25 May 2015 20:46:13 -0000



On 24.05.15 22:20, Peter Crosthwaite wrote:
> There is no reason for device tree API to be built per-target.
> common-obj it. There is an extraneous inclusion of config.h that
> needs to be removed.
>=20
> Cc: Alexander Graf <agraf@suse.de>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Doesn't this mean that we're now linking against libfdt on
qemu-system-x86_64?


Alex

> ---
>  Makefile.objs   | 2 ++
>  Makefile.target | 1 -
>  device_tree.c   | 1 -
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 28999d3..4881d2c 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -76,6 +76,8 @@ common-obj-$(CONFIG_SECCOMP) +=3D qemu-seccomp.o
> =20
>  common-obj-$(CONFIG_SMARTCARD_NSS) +=3D $(libcacard-y)
> =20
> +common-obj-$(CONFIG_FDT) +=3D device_tree.o
> +
>  ######################################################################
>  # qapi
> =20
> diff --git a/Makefile.target b/Makefile.target
> index 1083377..5100013 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -129,7 +129,6 @@ ifdef CONFIG_SOFTMMU
>  obj-y +=3D arch_init.o cpus.o monitor.o gdbstub.o balloon.o ioport.o n=
uma.o
>  obj-y +=3D qtest.o bootdevice.o
>  obj-y +=3D hw/
> -obj-$(CONFIG_FDT) +=3D device_tree.o
>  obj-$(CONFIG_KVM) +=3D kvm-all.o
>  obj-y +=3D memory.o savevm.o cputlb.o
>  obj-y +=3D memory_mapping.o
> diff --git a/device_tree.c b/device_tree.c
> index 3d119ef..d2de580 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -18,7 +18,6 @@
>  #include <unistd.h>
>  #include <stdlib.h>
> =20
> -#include "config.h"
>  #include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
>=20

