Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0q2-0000AP-Kq
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:13:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0pu-0008Kp-Go
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:13:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0pp-0005GH-JT
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:13:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0pf-00053H-5D; Fri, 06 Dec 2013 14:12:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BE3D540D77;
	Fri,  6 Dec 2013 23:12:57 +0400 (MSK)
Message-ID: <52A221B9.4040407@msgid.tls.msk.ru>
Date: Fri, 06 Dec 2013 23:12:57 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/arm/highbank: Simplify code (memory
 region in device state)
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
X-List-Received-Date: Fri, 06 Dec 2013 19:13:20 -0000

06.12.2013 22:43, Stefan Weil wrote:
> The memory region can be included by value instead of by reference in the
> device state (like it is done in other SoCs).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/highbank.c |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index fe98ef1..54384b3 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -125,7 +125,7 @@ typedef struct {
>      SysBusDevice parent_obj;
>      /*< public >*/
>  
> -    MemoryRegion *iomem;
> +    MemoryRegion iomem;
>      uint32_t regs[NUM_REGS];
>  } HighbankRegsState;

Don't we have active maintainer for arm? (Who is Cc'd on the original patch).

> @@ -154,10 +154,9 @@ static int highbank_regs_init(SysBusDevice *dev)
>  {
>      HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
>  
> -    s->iomem = g_new(MemoryRegion, 1);
> -    memory_region_init_io(s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
> +    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>                            "highbank_regs", 0x1000);

I know right to nothing about arm, does it have any alignment requiriments,
which may break here?

Thanks,

/mjt

