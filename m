Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnUj3-00075P-4S
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 10:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UnUiz-00070c-Oz
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 10:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UnUiy-0000Pd-DL
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 10:11:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48162 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UnUin-0000My-DJ; Fri, 14 Jun 2013 10:11:21 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 56A5EA0FED;
	Fri, 14 Jun 2013 16:11:20 +0200 (CEST)
Message-ID: <51BB2488.1020309@suse.de>
Date: Fri, 14 Jun 2013 16:11:20 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370434603-5394-1-git-send-email-hpoussin@reactos.org>
	<51AF96C5.5000507@msgid.tls.msk.ru>
In-Reply-To: <51AF96C5.5000507@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel]  [PATCH] cputlb: fix debug logs
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
X-List-Received-Date: Fri, 14 Jun 2013 14:11:35 -0000

Am 05.06.2013 21:51, schrieb Michael Tokarev:
> 05.06.2013 16:16, Herv=C3=A9 Poussineau wrote:
>> 'pd' variable has been removed in 06ef3525e1f271b6a842781a05eace5cf63b=
95c2.
>=20
> It's been removed indeed, but the value has been replaced by using
> a MemoryRegionSection instead.  I understand current code is wrong
> when DEBUG_TLB is #defined, but I think it is also wrong to just
> remove this value in printf.  The question is whenever this debugging
> is useful now, and whenever this now-missing value is interesting
> for that and should be provided by other means.  Maybe we may just
> remove whole thing here and everywhere.

I interpret it as logging the function arguments, so dropping it sounded
like the right solution to me. Would be nice to turn it into a
tracepoint or at least some DPRINTF() macro that gets compile-tested.

Andreas

>=20
> Cc'ing authors.
>=20
> While this patch looks really trivial, it is something which is of
> use by the subsystem maintainer(s) at their disposal.
>=20
> Thanks,
>=20
> /mjt
>=20
>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>> ---
>>  cputlb.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/cputlb.c b/cputlb.c
>> index 86666c8..1230e9e 100644
>> --- a/cputlb.c
>> +++ b/cputlb.c
>> @@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong =
vaddr,
>> =20
>>  #if defined(DEBUG_TLB)
>>      printf("tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGE=
T_FMT_plx
>> -           " prot=3D%x idx=3D%d pd=3D0x%08lx\n",
>> -           vaddr, paddr, prot, mmu_idx, pd);
>> +           " prot=3D%x idx=3D%d\n",
>> +           vaddr, paddr, prot, mmu_idx);
>>  #endif
>> =20
>>      address =3D vaddr;
>>
>=20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

