Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAIbh-0000Xj-34
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 11:07:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIbe-0000V0-7A
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIbZ-0002G2-0S
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:07:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bAIbP-0002CQ-FQ; Tue, 07 Jun 2016 11:07:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 96B8840C27;
	Tue,  7 Jun 2016 18:07:32 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
	<ac8eb9b954f267b8d9145cb8833a2f0b346f5913.1465112552.git.mjt@msgid.tls.msk.ru>
	<92ecec92-44d4-f192-ea66-9425383782eb@redhat.com>
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5756E333.2020809@msgid.tls.msk.ru>
Date: Tue, 7 Jun 2016 18:07:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <92ecec92-44d4-f192-ea66-9425383782eb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PULL 50/52] pc-bios/s390-ccw: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 07 Jun 2016 15:07:51 -0000

06.06.2016 16:17, Laurent Vivier wrote:
> On 05/06/2016 09:43, Michael Tokarev wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
>>
>> This patch is the result of coccinelle script
>> scripts/coccinelle/round.cocci
>>
>> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  pc-bios/s390-ccw/bootmap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
>> index 611102e..ecdc52d 100644
>> --- a/pc-bios/s390-ccw/bootmap.c
>> +++ b/pc-bios/s390-ccw/bootmap.c
>> @@ -599,7 +599,7 @@ static void load_iso_bc_entry(IsoBcSection *load)
>>  
>>      if (real_size) {
>>          /* Round up blocks to load */
>> -        blks_to_load = (real_size + ISO_SECTOR_SIZE - 1) / ISO_SECTOR_SIZE;
>> +        blks_to_load = DIV_ROUND_UP(real_size, ISO_SECTOR_SIZE);
>>          sclp_print("ISO boot image size verified\n");
>>      } else {
>>          sclp_print("ISO boot image size could not be verified\n");
>>
> 
> I think this one must be dropped from the pull request as s390-ccw files
> have no access to the definition of DIV_ROUND_UP.

Dropped it now, thank you!

/mjt

> I missed that because it is not built by default and can only be built
> on a s390 system (or with some tricks with a cross-compiler).
> 
> Thanks,
> Laurent
> 


