Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WteE4-0007QE-Lq
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 10:37:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WteDx-0007Hv-CX
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WteDn-00053m-Io
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:37:29 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WteDb-0004wG-7r; Sun, 08 Jun 2014 10:37:07 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3FCCC1180F74; Sun,  8 Jun 2014 16:37:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2C1DO05tkz0s; Sun,  8 Jun 2014 16:37:02 +0200 (CEST)
Received: from [192.168.178.35] (p54ACB2BE.dip0.t-ipconnect.de
	[84.172.178.190])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	445131180A74; Sun,  8 Jun 2014 16:37:02 +0200 (CEST)
Message-ID: <5394750D.6000703@weilnetz.de>
Date: Sun, 08 Jun 2014 16:37:01 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-devel@nongnu.org
References: <1402167282-9264-1-git-send-email-sw@weilnetz.de>
	<53945BB4.7030900@ilande.co.uk>
In-Reply-To: <53945BB4.7030900@ilande.co.uk>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
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
X-List-Received-Date: Sun, 08 Jun 2014 14:37:35 -0000

Am 08.06.2014 14:48, schrieb Mark Cave-Ayland:
> On 07/06/14 19:54, Stefan Weil wrote:
> 
>> Both constants need more than 32 bit.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   hw/pci-host/apb.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
>> index 1497008..6fa2723 100644
>> --- a/hw/pci-host/apb.c
>> +++ b/hw/pci-host/apb.c
>> @@ -99,8 +99,8 @@ do { printf("IOMMU: " fmt , ## __VA_ARGS__); } while
>> (0)
>>   #define IOMMU_TTE_DATA_SIZE     (1ULL << 61)
>>   #define IOMMU_TTE_DATA_W        (1ULL << 1)
>>
>> -#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000
>> -#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000
>> +#define IOMMU_TTE_PHYS_MASK_8K  0x1ffffffe000ULL
>> +#define IOMMU_TTE_PHYS_MASK_64K 0x1ffffff8000ULL
>>
>>   #define IOMMU_TSB_8K_OFFSET_MASK_8M    0x00000000007fe000ULL
>>   #define IOMMU_TSB_8K_OFFSET_MASK_16M   0x0000000000ffe000ULL
> 
> Gah yes, physical addresses in SPARC do lie outside the 32-bit range (I
> guess this showed up building with a 32-bit compiler?). Is it urgent
> enough to warrant me sending this as a separate pull request, or can it
> simply be queued via trivial?

It's not urgent, was detected by smatch (static code analyser), and is
already queued via trivial (thanks, Michael).

Cheers
Stefan

