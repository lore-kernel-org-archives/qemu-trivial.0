Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN6QX-0003N3-Oc
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 16:03:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WN6QN-00039a-Co
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 16:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WN6QH-0004Rd-8Q
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 16:03:47 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:51127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WN6Pq-00044e-R6; Mon, 10 Mar 2014 16:03:14 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8883472800CA; Mon, 10 Mar 2014 21:03:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Q7SaDME2pWJy; Mon, 10 Mar 2014 21:03:11 +0100 (CET)
Received: from [192.168.178.35] (p54ADBA8B.dip0.t-ipconnect.de
	[84.173.186.139])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	930EC72800C7; Mon, 10 Mar 2014 21:03:10 +0100 (CET)
Message-ID: <531E1A7C.3010706@weilnetz.de>
Date: Mon, 10 Mar 2014 21:03:08 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1394478649-9453-4-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/12] hw/pci/pci_host.c:
 Avoid shifting left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 20:03:56 -0000

Am 10.03.2014 20:10, schrieb Peter Maydell:
> Add U suffix to avoid undefined behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/pci/pci_host.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 77c7d1f..2c17916 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -142,8 +142,9 @@ static uint64_t pci_host_data_read(void *opaque,
>  {
>      PCIHostState *s = opaque;
>      uint32_t val;
> -    if (!(s->config_reg & (1 << 31)))
> +    if (!(s->config_reg & (1u << 31))) {
>          return 0xffffffff;

I suggest fixing that 0xffffffff, too. Do we expect here a 32 bit value
(-1) which is expanded to a 64 bit value? Then 0xffffffffffffffffULL
would be correct. Otherwise 0xffffffffU is clearer.

Michael, are 8 byte reads possible here? If yes, the current code is wrong.

> +    }
>      val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
>      PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
>                  addr, len, val);
> 

What about using the BIT macro from qemu/bitops.h? I think that BIT(31)
looks better than (1u << 31).

Stefan


