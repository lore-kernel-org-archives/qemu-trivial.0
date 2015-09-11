Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMIM-0001wC-Ac
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:15:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZaMIK-0001rH-0L
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZaMIJ-0006VQ-0j
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:15:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:41360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZaMID-0006Rl-Sn; Fri, 11 Sep 2015 07:14:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5B1EDADD0;
	Fri, 11 Sep 2015 11:14:55 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
	<55EDB16B.6080205@suse.de> <55F2A942.4040500@msgid.tls.msk.ru>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <55F2B7AF.1060306@suse.de>
Date: Fri, 11 Sep 2015 13:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55F2A942.4040500@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qom/object.h: remove some child/parent
	doc
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
X-List-Received-Date: Fri, 11 Sep 2015 11:15:05 -0000

Am 11.09.2015 um 12:13 schrieb Michael Tokarev:
> 07.09.2015 18:46, Andreas F=C3=A4rber wrote:
>> Am 04.09.2015 um 23:01 schrieb marcandre.lureau@redhat.com:
>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> It looks like this documentation is obsolete: a child object may look=
up
>>> its parent stored in the Object struct.
>>>
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  include/qom/object.h | 3 ---
>>>  1 file changed, 3 deletions(-)
>>
>> Either once again you are trying to do stuff behind my back, or your
>> setup is really broken: I double-checked that include/qom/ is listed i=
n
>> MAINTAINERS, so I should've been CC'ed rather than just -trivial.
>>
>> It's been a valid rule not to mess with these internal fields, therefo=
re
>> this is not trivial at all, and that's one reason why my x86 CPU serie=
s
>> using it was an RFC. We should either come up with a proper wrapper
>> function object_get_parent(), or with a wrapper function adding a link=
<>
>> property (where we would need to be careful with ref counts) - long ti=
me
>> only the composition tree needed to mess with an object's parent.
>>
>> If you have a concrete use case of parent access, please point to it.
>=20
> So, should the current documentation remain, or should the patch be
> applied?  If the latter, Andreas, please take care of it.

This patch should not be applied, NACK.

I outlined ideas for a v2 series above though.

Thanks,
Andreas

>=20
> Thanks,
>=20
> /mjt
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=
=C3=BCrnberg)

