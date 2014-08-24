Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLU2j-00052o-BZ
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 05:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLU2b-0004sY-Gq
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLU2V-0003kQ-Bq
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 05:24:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLU2I-0003if-Rx; Sun, 24 Aug 2014 05:24:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 50BC24494D;
	Sun, 24 Aug 2014 13:24:29 +0400 (MSK)
Message-ID: <53F9AF4D.10300@msgid.tls.msk.ru>
Date: Sun, 24 Aug 2014 13:24:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Valentin Manea <qemu@mrs.ro>, qemu-trivial@nongnu.org
References: <53F704BE.6000407@mrs.ro>
In-Reply-To: <53F704BE.6000407@mrs.ro>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] IDE: MMIO IDE device control should be
 little endian
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
X-List-Received-Date: Sun, 24 Aug 2014 09:24:55 -0000

22.08.2014 12:52, Valentin Manea wrote:
> Set the IDE MMIO memory type to little endian. The ATA specs identify
> words part of the control commands encoded as little endian.
> While this has no impact on little endian systems, it's required for big
> endian systems(eg OpenRisc).

While the patch itself is simple, I'm not sure it is "trivial enough".
And you didn't Cc neither qemu-devel@ nor the IDE subsystem "odd fixer"
maintainers (kwolf@ and stefanha@).  I'm not applying this for now to
trivial tree.

Thanks,

/mjt

> Signed-off-by: Valentin Manea <valentin.manea@gmail.com>
> ---
>  hw/ide/mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index 01c1d0e..334c8cc 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -82,7 +82,7 @@ static void mmio_ide_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps mmio_ide_ops = {
>      .read = mmio_ide_read,
>      .write = mmio_ide_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
> 
>  static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
> @@ -102,7 +102,7 @@ static void mmio_ide_cmd_write(void *opaque, hwaddr
> addr,
>  static const MemoryRegionOps mmio_ide_cs_ops = {
>      .read = mmio_ide_status_read,
>      .write = mmio_ide_cmd_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
> 
>  static const VMStateDescription vmstate_ide_mmio = {
> 


