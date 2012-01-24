Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rq46b-0007lX-Ig
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2012 09:45:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RpkMP-0005HB-GT
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:40:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RpkMJ-0004Pb-Io
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:40:45 -0500
Received: from cantor2.suse.de ([195.135.220.15]:42329 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RpkM7-0004OK-Hj; Tue, 24 Jan 2012 12:40:27 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id CA2649043F;
	Tue, 24 Jan 2012 18:40:25 +0100 (CET)
Message-ID: <4F1EEC88.8060803@suse.de>
Date: Tue, 24 Jan 2012 18:38:16 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
	<4F1EEA64.2080704@siemens.com>
In-Reply-To: <4F1EEA64.2080704@siemens.com>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
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
X-List-Received-Date: Tue, 24 Jan 2012 17:40:51 -0000

Am 24.01.2012 18:29, schrieb Jan Kiszka:
> On 2012-01-24 18:17, Andreas F=C3=A4rber wrote:
>> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>>
>> VMState supports the type bool but qdev instead supports bit, backed b=
y
>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_boo=
l().
>>
>> bool by definition is either true or false. Should the need arise to
>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that a=
t
>> a later point in time.
>=20
> To make it a real replacement for PROP_TYPE_BIT, let's use on/off, also
> for printing. Not only programmers may use this interface. ;)

Actually non-programmers are the reason for this: cache=3Don/off makes a
great deal of sense in English (noun), but not enabled=3Doff (adjective),
which was my use case of this patch for ISA devices.

I'm fine with accepting the whole range of possibilities for parsing.
For printing I see no reason to, since there's no legacy users of this
new type we could break. true/false seemed better than yes/no.

>> +PropertyInfo qdev_prop_bool =3D {
>> +    .name =3D "bool",
>=20
> Now we have "bool" and "boolean". Can we rename the latter to bit?

I'd be fine with that, just don't know if that would break anything
elsewhere for qdev or QOM?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

