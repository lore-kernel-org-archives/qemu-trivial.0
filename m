Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnR6u-0007DC-Gi
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 10:05:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bnR6p-000788-11
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 10:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bnR6i-00042K-0a
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 10:05:45 -0400
Received: from chuckie.co.uk ([82.165.15.123]:53996
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bnR6h-00040a-PF; Fri, 23 Sep 2016 10:05:39 -0400
Received: from host165-120-225-112.range165-120.btcentralplus.com
	([165.120.225.112] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bnR6V-0001xs-1y; Fri, 23 Sep 2016 15:05:32 +0100
To: Thomas Huth <huth@tuxfamily.org>, QEMU Developers
	<qemu-devel@nongnu.org>, Fabien Chouteau <chouteau@adacore.com>
References: <c1a178ce-1c5e-2c26-0f55-6a4fbfe21a83@tuxfamily.org>
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <51fce155-aaab-c4ac-b00b-02678dd827b4@ilande.co.uk>
Date: Fri, 23 Sep 2016 15:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <c1a178ce-1c5e-2c26-0f55-6a4fbfe21a83@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 165.120.225.112
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-trivial] [Qemu-devel] MAINTAINERS: Add some SPARC machine
 related files
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
X-List-Received-Date: Fri, 23 Sep 2016 14:05:51 -0000

On 19/09/16 20:58, Thomas Huth wrote:

> And while we're at it, remove Blue Swirl from the list
> of maintainers. Blue has apparently been inactive for
> quite a while now, so I assume he's unfortunately
> not available as maintainer anymore.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  MAINTAINERS | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9fab46..c6297c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -650,22 +650,27 @@ F: hw/sh4/shix.c
>  SPARC Machines
>  --------------
>  Sun4m
> -M: Blue Swirl <blauwirbel@gmail.com>
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>  S: Maintained
>  F: hw/sparc/sun4m.c
> +F: hw/dma/sparc32_dma.c
> +F: hw/dma/sun4m_iommu.c
> +F: include/hw/sparc/sparc32_dma.h
> +F: include/hw/sparc/sun4m.h
> +F: pc-bios/openbios-sparc32
>  
>  Sun4u
> -M: Blue Swirl <blauwirbel@gmail.com>
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>  S: Maintained
>  F: hw/sparc64/sun4u.c
> +F: pc-bios/openbios-sparc64
>  
>  Leon3
>  M: Fabien Chouteau <chouteau@adacore.com>
>  S: Maintained
>  F: hw/sparc/leon3.c
>  F: hw/*/grlib*
> +F: include/hw/sparc/grlib.h
>  
>  S390 Machines
>  -------------

No issue with the sun4m/sun4u changes, however shouldn't the OpenBIOS
binaries be handled separately by the OpenBIOS project rather than by
the SPARC maintainers? (I guess technically that is currently also me,
but generally I do a pull request that updates all SPARC/PPC binaries in
one go)


ATB,

Mark.


