Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rq46b-0007ms-VD
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2012 09:45:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpkew-0001mI-Pt
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 13:00:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpkes-00073w-Bh
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:59:54 -0500
Received: from david.siemens.de ([192.35.17.14]:28681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Rpkej-00070r-5o; Tue, 24 Jan 2012 12:59:41 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q0OHxajt002173;
	Tue, 24 Jan 2012 18:59:36 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0OHxakB020298;
	Tue, 24 Jan 2012 18:59:36 +0100
Message-ID: <4F1EF188.4090608@siemens.com>
Date: Tue, 24 Jan 2012 18:59:36 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
	<4F1EEA64.2080704@siemens.com> <4F1EEC88.8060803@suse.de>
In-Reply-To: <4F1EEC88.8060803@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by david.siemens.de id
	q0OHxajt002173
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
X-Mailman-Approved-At: Wed, 25 Jan 2012 09:45:41 -0500
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Juan Quintela <quintela@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v6] qdev: Add support for property type
	bool
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
X-List-Received-Date: Tue, 24 Jan 2012 18:00:01 -0000

On 2012-01-24 18:38, Andreas F=C3=A4rber wrote:
> Am 24.01.2012 18:29, schrieb Jan Kiszka:
>> On 2012-01-24 18:17, Andreas F=C3=A4rber wrote:
>>> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>>>
>>> VMState supports the type bool but qdev instead supports bit, backed =
by
>>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bo=
ol().
>>>
>>> bool by definition is either true or false. Should the need arise to
>>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that =
at
>>> a later point in time.
>>
>> To make it a real replacement for PROP_TYPE_BIT, let's use on/off, als=
o
>> for printing. Not only programmers may use this interface. ;)
>=20
> Actually non-programmers are the reason for this: cache=3Don/off makes =
a
> great deal of sense in English (noun), but not enabled=3Doff (adjective=
),
> which was my use case of this patch for ISA devices.

Agreed, there are use cases for both.

>=20
> I'm fine with accepting the whole range of possibilities for parsing.
> For printing I see no reason to, since there's no legacy users of this
> new type we could break. true/false seemed better than yes/no.

We have a few single-bit booleans I would like to convert to bool. So
the best option may be having control over what is printed. Could we
easily provide a PROP_TYPE_SWITCH based on bool?

>=20
>>> +PropertyInfo qdev_prop_bool =3D {
>>> +    .name =3D "bool",
>>
>> Now we have "bool" and "boolean". Can we rename the latter to bit?
>=20
> I'd be fine with that, just don't know if that would break anything
> elsewhere for qdev or QOM?

Hmm, to me it looks like it's only used for verbose error reporting. But
I may miss something.

Jan

--=20
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

