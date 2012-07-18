Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrWOE-00058Y-2Q
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 11:42:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1SrWOC-00055j-40
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 11:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1SrWO2-0002TY-JH
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 11:42:12 -0400
Received: from cantor2.suse.de ([195.135.220.15]:39154 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1SrWNk-0002Pu-PK; Wed, 18 Jul 2012 11:41:44 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 5D75AA329D;
	Wed, 18 Jul 2012 17:41:41 +0200 (CEST)
Message-ID: <5006D930.8080205@suse.de>
Date: Wed, 18 Jul 2012 17:41:36 +0200
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1342599771-13844-1-git-send-email-aik@ozlabs.ru>
	<5006D8F8.5050306@weilnetz.de>
In-Reply-To: <5006D8F8.5050306@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
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
X-List-Received-Date: Wed, 18 Jul 2012 15:42:13 -0000

On 07/18/2012 05:40 PM, Stefan Weil wrote:
> Am 18.07.2012 10:22, schrieb Alexey Kardashevskiy:
>> By default mingw-gcc is trying to pack structures the way to
>> preserve binary compatibility with MS Visual C what leads to
>> incorrect and unexpected padding in the PCI bus ranges property of
>> the sPAPR PHB.
>>
>> The patch replaces __attribute__((packed)) with more strict QEMU_PACKED
>> which actually is __attribute__((gcc_struct, packed)) on Windows.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   hw/spapr_pci.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/spapr_pci.c b/hw/spapr_pci.c
>> index b3032d2..0261d2e 100644
>> --- a/hw/spapr_pci.c
>> +++ b/hw/spapr_pci.c
>> @@ -418,7 +418,7 @@ int spapr_populate_pci_dt(sPAPRPHBState *phb,
>>           uint64_t child;
>>           uint64_t parent;
>>           uint64_t size;
>> -    } __attribute__((packed)) ranges[] = {
>> +    } QEMU_PACKED ranges[] = {
>>           {
>>               cpu_to_be32(b_ss(1)), cpu_to_be64(0),
>>               cpu_to_be64(phb->io_win_addr),
>
>
> The patch changes sizeof(ranges[0]) from 32 to 28 bytes
> and can be applied as a trivial patch.
>
> Tested-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>

So do you want to take it through the trivial queue? I'm fine either way.

Acked-by: Alexander Graf <agraf@suse.de>


Alex


