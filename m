Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFS9i-000607-0F
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 13:06:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VFS9a-0005sv-N0
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 13:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VFS9V-0001zO-5A
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 13:06:34 -0400
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15]:44770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1VFS9G-0001us-TI; Fri, 30 Aug 2013 13:06:15 -0400
Received: from [192.168.0.32] (unknown [82.227.227.196])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 4ECAD822CD;
	Fri, 30 Aug 2013 19:05:59 +0200 (CEST)
Message-ID: <5220D0F6.3010401@reactos.org>
Date: Fri, 30 Aug 2013 19:05:58 +0200
From: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
	<5220BE16.6090103@redhat.com> <5220C0B7.4030108@suse.de>
In-Reply-To: <5220C0B7.4030108@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 30 Aug 2013 17:06:40 -0000

Andreas F=C3=A4rber a =C3=A9crit :
> Am 30.08.2013 17:45, schrieb Paolo Bonzini:
>> Il 13/08/2013 12:38, Herv=C3=A9 Poussineau ha scritto:
>>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>>> ---
>>>  include/hw/isa/isa.h |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>>> index 495bcf3..fa45a5b 100644
>>> --- a/include/hw/isa/isa.h
>>> +++ b/include/hw/isa/isa.h
>>> @@ -78,7 +78,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegi=
on *io, uint16_t start);
>>>   * @dev: the ISADevice against which these are registered; may be NU=
LL.
>>>   * @start: the base I/O port against which the portio->offset is app=
lied.
>>>   * @portio: the ports, sorted by offset.
>>> - * @opaque: passed into the old_portio callbacks.
>>> + * @opaque: passed into the portio callbacks.
>>>   * @name: passed into memory_region_init_io.
>>>   */
>>>  void isa_register_portio_list(ISADevice *dev, uint16_t start,
>>>
>> Ping.
>=20
> If you actually give it a Reviewed-by I can take it through qom-next.
>=20
> Commit message does not point to a commit X for trivial verification
> that it is in fact correct since X.

Just above the changed line, the ports variable is named "portio", not=20
"old_portio".

Herv=C3=A9


