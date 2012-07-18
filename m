Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrWNS-0004Bc-5H
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 11:41:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrWNK-00045g-Ak
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 11:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SrWNC-0002KY-Kh
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 11:41:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SrWMl-0002Gd-5r; Wed, 18 Jul 2012 11:40:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	16AF772800C8; Wed, 18 Jul 2012 17:40:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kjqPfwAzmmgg; Wed, 18 Jul 2012 17:40:41 +0200 (CEST)
Received: from [192.168.178.20] (p5086F660.dip.t-dialin.net [80.134.246.96])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1EA8D728001A; Wed, 18 Jul 2012 17:40:41 +0200 (CEST)
Message-ID: <5006D8F8.5050306@weilnetz.de>
Date: Wed, 18 Jul 2012 17:40:40 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1342599771-13844-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1342599771-13844-1-git-send-email-aik@ozlabs.ru>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] powerpc pci: fixed packing
	of ranges[]
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
X-List-Received-Date: Wed, 18 Jul 2012 15:41:24 -0000

Am 18.07.2012 10:22, schrieb Alexey Kardashevskiy:
> By default mingw-gcc is trying to pack structures the way to
> preserve binary compatibility with MS Visual C what leads to
> incorrect and unexpected padding in the PCI bus ranges property of
> the sPAPR PHB.
>
> The patch replaces __attribute__((packed)) with more strict QEMU_PACKED
> which actually is __attribute__((gcc_struct, packed)) on Windows.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   hw/spapr_pci.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/spapr_pci.c b/hw/spapr_pci.c
> index b3032d2..0261d2e 100644
> --- a/hw/spapr_pci.c
> +++ b/hw/spapr_pci.c
> @@ -418,7 +418,7 @@ int spapr_populate_pci_dt(sPAPRPHBState *phb,
>           uint64_t child;
>           uint64_t parent;
>           uint64_t size;
> -    } __attribute__((packed)) ranges[] = {
> +    } QEMU_PACKED ranges[] = {
>           {
>               cpu_to_be32(b_ss(1)), cpu_to_be64(0),
>               cpu_to_be64(phb->io_win_addr),


The patch changes sizeof(ranges[0]) from 32 to 28 bytes
and can be applied as a trivial patch.

Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Weil <sw@weilnetz.de>


