Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9TAz-0004M4-Oh
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 23:22:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S9TAx-0004LB-HI
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 23:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1S9TAv-00005l-R2
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 23:22:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1S9TAv-00005X-Ij; Sun, 18 Mar 2012 23:22:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2J3MLIf015077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 18 Mar 2012 23:22:21 -0400
Received: from [10.66.65.172] (dhcp-65-172.nay.redhat.com [10.66.65.172])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2J3MHOo012078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Sun, 18 Mar 2012 23:22:19 -0400
Message-ID: <4F66A66A.20000@redhat.com>
Date: Mon, 19 Mar 2012 11:22:18 +0800
From: Jason Wang <jasowang@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <20120316091044.6166.86916.stgit@amd-6168-8-1.englab.nay.redhat.com>
	<4F6316D0.6010105@suse.de>
In-Reply-To: <4F6316D0.6010105@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q2J3MLIf015077
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH] ioapic: fix build
	with DEBUG_IOAPIC
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
X-List-Received-Date: Mon, 19 Mar 2012 03:22:28 -0000

On 03/16/2012 06:32 PM, Andreas F=C3=A4rber wrote:
> Am 16.03.2012 10:10, schrieb Jason Wang:
>> ioapic.c:198: error: format =E2=80=98%08x=E2=80=99 expects type =E2=80=
=98unsigned int=E2=80=99, but argument 3 has type =E2=80=98uint64_t=E2=80=
=99
>>
>> Signed-off-by: Jason Wang<jasowang@redhat.com>
> PRIx64 is indeed needed here. However, this drops the 08 without mentio=
n
> in the commit message - was it intended?

Not intended, my fault, thanks for pointing this.
> Andreas
>
>> ---
>>   hw/ioapic.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/hw/ioapic.c b/hw/ioapic.c
>> index 3fee011..1ff31a1 100644
>> --- a/hw/ioapic.c
>> +++ b/hw/ioapic.c
>> @@ -195,7 +195,7 @@ ioapic_mem_write(void *opaque, target_phys_addr_t =
addr, uint64_t val,
>>           if (size !=3D 4) {
>>               break;
>>           }
>> -        DPRINTF("write: %08x =3D %08x\n", s->ioregsel, val);
>> +        DPRINTF("write: %08x =3D %" PRIx64 "\n", s->ioregsel, val);
>>           switch (s->ioregsel) {
>>           case IOAPIC_REG_ID:
>>               s->id =3D (val>>  IOAPIC_ID_SHIFT)&  IOAPIC_ID_MASK;


