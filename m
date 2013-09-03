Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGm6B-0001Bx-23
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 04:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VGm63-000131-Ec
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VGm5x-0002RG-SS
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:36:23 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52118 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VGm5m-0002Nt-18; Tue, 03 Sep 2013 04:36:06 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C3C27A50E4;
	Tue,  3 Sep 2013 10:36:01 +0200 (CEST)
Message-ID: <52259F6E.3000205@suse.de>
Date: Tue, 03 Sep 2013 10:35:58 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com>
In-Reply-To: <52258E44.9010704@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, liguang <lig.fnst@cn.fujitsu.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Tue, 03 Sep 2013 08:36:29 -0000

Am 03.09.2013 09:22, schrieb Paolo Bonzini:
> Il 03/09/2013 09:05, liguang ha scritto:
>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>> ---
>>  cputlb.c |   15 ---------------
>>  1 files changed, 0 insertions(+), 15 deletions(-)
>>
>> diff --git a/cputlb.c b/cputlb.c
>> index 977c0ca..08e50e0 100644
>> --- a/cputlb.c
>> +++ b/cputlb.c
>> @@ -169,21 +169,6 @@ static inline ram_addr_t qemu_ram_addr_from_host_=
nofail(void *ptr)
>>      return ram_addr;
>>  }
>> =20
>> -static inline void tlb_update_dirty(CPUTLBEntry *tlb_entry)
>> -{
>> -    ram_addr_t ram_addr;
>> -    void *p;
>> -
>> -    if (tlb_is_dirty_ram(tlb_entry)) {
>> -        p =3D (void *)(uintptr_t)((tlb_entry->addr_write & TARGET_PAG=
E_MASK)
>> -            + tlb_entry->addend);
>> -        ram_addr =3D qemu_ram_addr_from_host_nofail(p);
>> -        if (!cpu_physical_memory_is_dirty(ram_addr)) {
>> -            tlb_entry->addr_write |=3D TLB_NOTDIRTY;
>> -        }
>> -    }
>> -}
>> -
>>  void cpu_tlb_reset_dirty_all(ram_addr_t start1, ram_addr_t length)
>>  {
>>      CPUState *cpu;
>>
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> and CCing qemu-trivial.

Negative, please keep qemu-trivial out of this. My qom-cpu pull was
already blocked by the s390 and ppc pulls, so let's not add yet another
potentially interfering one to the mix.

IF rth agrees as TCG maintainer that this is not needed in any of his
upcoming refactorings then I'll queue it on qom-cpu. My upcoming
qom-cpu-13 series touches upon pretty much every core CPU file
perceivable, including this cputlb.c.

I also don't understand why qemu-trivial is suddenly picking up Stefan's
arm translation patch, it used to be for unmaintained areas only. But
arm is not my problem.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

