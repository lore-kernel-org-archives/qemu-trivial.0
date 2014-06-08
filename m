Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wtca1-0003ja-SU
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 08:52:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WtcZv-0003cX-4u
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WtcZp-0002JR-2z
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:52:03 -0400
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:53035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WtcZc-00020F-Kt; Sun, 08 Jun 2014 08:51:44 -0400
Received: from bcdc006c.skybroadband.com ([188.220.0.108] helo=[192.168.1.78])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WtcZN-0007om-VI; Sun, 08 Jun 2014 13:51:32 +0100
Message-ID: <53945BB4.7030900@ilande.co.uk>
Date: Sun, 08 Jun 2014 13:48:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1402167282-9264-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1402167282-9264-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 188.220.0.108
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] apb: Fix compiler warnings
	(large constants)
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
X-List-Received-Date: Sun, 08 Jun 2014 12:52:09 -0000

On 07/06/14 19:54, Stefan Weil wrote:

> Both constants need more than 32 bit.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   hw/pci-host/apb.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
> index 1497008..6fa2723 100644
> --- a/hw/pci-host/apb.c
> +++ b/hw/pci-host/apb.c
> @@ -99,8 +99,8 @@ do { printf("IOMMU: " fmt , ## __VA_ARGS__); } while (0)
>   #define IOMMU_TTE_DATA_SIZE     (1ULL << 61)
>   #define IOMMU_TTE_DATA_W        (1ULL << 1)
>
> -#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000
> -#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000
> +#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000ULL
> +#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000ULL
>
>   #define IOMMU_TSB_8K_OFFSET_MASK_8M    0x00000000007fe000ULL
>   #define IOMMU_TSB_8K_OFFSET_MASK_16M   0x0000000000ffe000ULL

Gah yes, physical addresses in SPARC do lie outside the 32-bit range (I 
guess this showed up building with a 32-bit compiler?). Is it urgent 
enough to warrant me sending this as a separate pull request, or can it 
simply be queued via trivial?


ATB,

Mark.


