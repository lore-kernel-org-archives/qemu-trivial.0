Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFSRm-0006Wz-V6
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 13:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VFSRg-0006KF-Gg
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 13:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VFSRb-0000B0-AL
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 13:25:16 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51485 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VFSRQ-0008Ik-J2; Fri, 30 Aug 2013 13:25:00 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 086A6A52D7;
	Fri, 30 Aug 2013 19:25:00 +0200 (CEST)
Message-ID: <5220D568.8080103@suse.de>
Date: Fri, 30 Aug 2013 19:24:56 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
	<5220BE16.6090103@redhat.com> <5220C0B7.4030108@suse.de>
	<5220C226.1080905@redhat.com>
In-Reply-To: <5220C226.1080905@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] PING Re: [PATCH for-1.6] isa: fix
 documentation of isa_register_portio_list
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
X-List-Received-Date: Fri, 30 Aug 2013 17:25:21 -0000

Am 30.08.2013 18:02, schrieb Paolo Bonzini:
> Il 30/08/2013 17:56, Andreas F=C3=A4rber ha scritto:
>> Am 30.08.2013 17:45, schrieb Paolo Bonzini:
>>> Il 13/08/2013 12:38, Herv=C3=A9 Poussineau ha scritto:
>>>>
>>>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>>>> ---
>>>>  include/hw/isa/isa.h |    2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>>>> index 495bcf3..fa45a5b 100644
>>>> --- a/include/hw/isa/isa.h
>>>> +++ b/include/hw/isa/isa.h
>>>> @@ -78,7 +78,7 @@ void isa_register_ioport(ISADevice *dev, MemoryReg=
ion *io, uint16_t start);
>>>>   * @dev: the ISADevice against which these are registered; may be N=
ULL.
>>>>   * @start: the base I/O port against which the portio->offset is ap=
plied.
>>>>   * @portio: the ports, sorted by offset.
>>>> - * @opaque: passed into the old_portio callbacks.
>>>> + * @opaque: passed into the portio callbacks.
>>>>   * @name: passed into memory_region_init_io.
>>>>   */
>>>>  void isa_register_portio_list(ISADevice *dev, uint16_t start,
>>>>
>>>
>>> Ping.
>>
>> If you actually give it a Reviewed-by I can take it through qom-next.
>>
>> Commit message does not point to a commit X for trivial verification
>> that it is in fact correct since X.
>=20
> Commit b40acf9 (ioport: Switch dispatching to memory core layer,
> 2013-06-24) removed all instances of old_portio

Thanks, I've copied it into the commit message and consider this an
Acked-by. Applied to qom-next:
https://github.com/afaerber/qemu-cpu/commits/qom-next

Andreas

> except this, one in
> docs/memory.txt, and one in hw/ppc/spapr_pci.c.
>=20
> Paolo
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

