Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFRA9-0001Rq-KN
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 12:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VFRA2-0001Oa-L9
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 12:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VFR9x-0004Or-Pb
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 12:02:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VFR9x-0004Od-HS; Fri, 30 Aug 2013 12:02:53 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7UG2pBR004036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 30 Aug 2013 12:02:51 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-60.ams2.redhat.com
	[10.36.112.60])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r7UG2mOH019613; Fri, 30 Aug 2013 12:02:49 -0400
Message-ID: <5220C226.1080905@redhat.com>
Date: Fri, 30 Aug 2013 18:02:46 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
	<5220BE16.6090103@redhat.com> <5220C0B7.4030108@suse.de>
In-Reply-To: <5220C0B7.4030108@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r7UG2pBR004036
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
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
X-List-Received-Date: Fri, 30 Aug 2013 16:03:03 -0000

Il 30/08/2013 17:56, Andreas F=C3=A4rber ha scritto:
> Am 30.08.2013 17:45, schrieb Paolo Bonzini:
>> Il 13/08/2013 12:38, Herv=C3=A9 Poussineau ha scritto:
>>>
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
>>
>> Ping.
>=20
> If you actually give it a Reviewed-by I can take it through qom-next.
>=20
> Commit message does not point to a commit X for trivial verification
> that it is in fact correct since X.

Commit b40acf9 (ioport: Switch dispatching to memory core layer,
2013-06-24) removed all instances of old_portio except this, one in
docs/memory.txt, and one in hw/ppc/spapr_pci.c.

Paolo

