Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggZQa-0008WI-O5
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2019 13:15:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ggZQX-0008Sh-Sd
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 13:15:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ggZQW-0008Rh-1k
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 13:15:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1ggZQQ-00087q-JH; Mon, 07 Jan 2019 13:14:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2BD8461CF;
	Mon,  7 Jan 2019 18:04:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-126-62.rdu2.redhat.com
	[10.10.126.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF30660A9D;
	Mon,  7 Jan 2019 18:04:50 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Jon Doron <arilou@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>,
	Wen Congyang <wency@cn.fujitsu.com>, Luiz Capitulino
	<lcapitulino@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20181225125344.4482-1-arilou@gmail.com>
	<CAJ+F1CJN=Gn5GYqrOeqWFNryw=q+7q8TDUX0VQEzrtS8tbUeQg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7961a154-f139-af73-613d-94b88bf95392@redhat.com>
Date: Mon, 7 Jan 2019 19:04:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJN=Gn5GYqrOeqWFNryw=q+7q8TDUX0VQEzrtS8tbUeQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 07 Jan 2019 18:04:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] dump: Set correct vaddr
 for ELF dump
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
X-List-Received-Date: Mon, 07 Jan 2019 18:15:07 -0000

On 01/07/19 13:14, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Tue, Dec 25, 2018 at 5:52 PM Jon Doron <arilou@gmail.com> wrote:
>>
>> vaddr needs to be equal to the paddr since the dump file represents th=
e
>> physical memory image.
>>
>> Without setting vaddr correctly, GDB would load all the different memo=
ry
>> regions on top of each other to vaddr 0, thus making GDB showing the w=
rong
>> memory data for a given address.
>>
>> Signed-off-by: Jon Doron <arilou@gmail.com>
>=20
> This is a non-trivial patch! (qemu-trivial, please ignore).
>=20
>> ---
>>  dump.c                       | 4 ++--
>>  scripts/dump-guest-memory.py | 1 +
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/dump.c b/dump.c
>> index 4ec94c5e25..bf77a119ea 100644
>> --- a/dump.c
>> +++ b/dump.c
>> @@ -192,7 +192,7 @@ static void write_elf64_load(DumpState *s, MemoryM=
apping *memory_mapping,
>>      phdr.p_paddr =3D cpu_to_dump64(s, memory_mapping->phys_addr);
>>      phdr.p_filesz =3D cpu_to_dump64(s, filesz);
>>      phdr.p_memsz =3D cpu_to_dump64(s, memory_mapping->length);
>> -    phdr.p_vaddr =3D cpu_to_dump64(s, memory_mapping->virt_addr);
>> +    phdr.p_vaddr =3D phdr.p_paddr;
>=20
> This is likely breaking paging=3Dtrue somehow, which sets
> memory_mapping->virt_addr to non-0.
>=20
> According to doc "If you want to use gdb to process the core, please
> set @paging to true."
>=20
> Although I am not able to (gdb) x/10bx 0xa0000 for example on a core
> produced with paging. Not sure why, anybody could help?
>=20
>>      assert(memory_mapping->length >=3D filesz);
>>
>> @@ -216,7 +216,7 @@ static void write_elf32_load(DumpState *s, MemoryM=
apping *memory_mapping,
>>      phdr.p_paddr =3D cpu_to_dump32(s, memory_mapping->phys_addr);
>>      phdr.p_filesz =3D cpu_to_dump32(s, filesz);
>>      phdr.p_memsz =3D cpu_to_dump32(s, memory_mapping->length);
>> -    phdr.p_vaddr =3D cpu_to_dump32(s, memory_mapping->virt_addr);
>> +    phdr.p_vaddr =3D phdr.p_paddr;
>>
>>      assert(memory_mapping->length >=3D filesz);
>>
>> diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.=
py
>> index 198cd0fe40..2c587cbefc 100644
>> --- a/scripts/dump-guest-memory.py
>> +++ b/scripts/dump-guest-memory.py
>> @@ -163,6 +163,7 @@ class ELF(object):
>>          phdr =3D get_arch_phdr(self.endianness, self.elfclass)
>>          phdr.p_type =3D p_type
>>          phdr.p_paddr =3D p_paddr
>> +        phdr.p_vaddr =3D p_paddr
>=20
> With your proposed change though, I can dump memory with gdb...
>=20
>>          phdr.p_filesz =3D p_size
>>          phdr.p_memsz =3D p_size
>>          self.segments.append(phdr)
>> --
>> 2.19.2
>>
>>
>=20
>=20

I've never used paging-enabled dumps. First, because doing so requires
QEMU to trust guest memory contents (see original commit 783e9b4826b9;
or more recently/generally, the @dump-guest-memory docs in
"qapi/misc.json"). Second, because whenever I had to deal with guest
memory dumps, I always used "crash" (which needs no paging), and the
subject guests were all Linux.

I can't comment on paging-enabled patches for dump, except that they
shouldn't regress the paging-disabled functionality. :) If the patches
satisfy that, I'm fine.

(I *am* surprised that GDB insists on p_vaddr equaling p_paddr; after
all, in the guest, the virtual address is "memory_mapping->virt_addr".
But, I would never claim to understand most of the ELF intricacies,
and/or what GDB requires on top of those.)

Thanks
Laszlo

