Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YuiQx-0005kC-RY
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 10:23:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1YuiQr-0005YD-3r
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1YuiQm-0002xx-PA
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:23:44 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58913 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1YuiQc-0002uR-SG; Tue, 19 May 2015 10:23:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1FBA4AC62;
	Tue, 19 May 2015 14:23:29 +0000 (UTC)
Message-ID: <555B4761.6020104@suse.de>
Date: Tue, 19 May 2015 16:23:29 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, 
 Martin Cerveny <M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
	<555B31D9.2090806@suse.de> <555B4127.4030700@redhat.com>
	<alpine.GSO.2.00.1505191601120.6069@dmz.c-home.cz>
	<555B45E2.5090008@redhat.com>
In-Reply-To: <555B45E2.5090008@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="dDahtKqBtHb0CXUH8hK1pgSaPEJSco9eg"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] scripts: qom-*: add
	network syntax
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
X-List-Received-Date: Tue, 19 May 2015 14:23:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dDahtKqBtHb0CXUH8hK1pgSaPEJSco9eg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 19.05.2015 um 16:17 schrieb Eric Blake:
> On 05/19/2015 08:12 AM, Martin Cerveny wrote:
>> Hello.
>>
>> On Tue, 19 May 2015, Eric Blake wrote:
>>> On 05/19/2015 06:51 AM, Andreas F=C3=A4rber wrote:
>>>> Am 13.05.2015 um 14:14 schrieb Martin Cerveny:
>>>>> Add network syntax parsing (ip address, port) to qom-* scripts.
>>>>>
>>>>> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
>>>>> ---
>>>>>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>>>>>  scripts/qmp/qom-get  |   12 +++++++++++-
>>>>>  scripts/qmp/qom-list |   12 +++++++++++-
>>>>>  scripts/qmp/qom-set  |   12 +++++++++++-
>>>>>  scripts/qmp/qom-tree |   12 +++++++++++-
>>>>>  5 files changed, 56 insertions(+), 5 deletions(-)
>>>>
>>>> Could some Python guru please take a look at this?
>=20
>>>>> +if len(connection) =3D=3D 2:
>>>>> +    try:
>>>>> +         port =3D int(connection[1])
>>>>> +    except ValueError:
>>>>> +         raise QMPBadPort
>>>>> +    connection =3D ( connection[0], port )
>>>
>>> Won't that mishandle IPv6 connections, such as something like [::1]:8=
000
>>> for connecting to port 8000 on localhost, since it splits into more t=
han
>>> 2 pieces when splitting on :?
>>
>> Yes, this is problem, but I copy-paste the same construct from
>> scripts/qmp/qmp-shell to be compatible.
>=20
> Might be worth mentioning that, as justification in the commit message.=

>=20
>> Is the IPv6 support for utilities mandatory ?
>=20
> I don't have any strong feelings about it (I'm okay if you don't).  But=

> others might.
>=20
>> If yes I can make V2.
>=20
> If so, it would be good to fix qmp-shell, too - which makes it sound
> like it would be a separate commit.

Is there a chance this can be fixed in a way that we don't need to
replicate that code? :)

Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; =
HRB
21284 (AG N=C3=BCrnberg)


--dDahtKqBtHb0CXUH8hK1pgSaPEJSco9eg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVW0dhAAoJEPou0S0+fgE/a98QAJAyML4nEN37haOjKyxvczHc
DKkXaed9fbyBbNdj2knsNBp1wXSwzKe7crHLbg88kKnLKaDuVn7DrwllBW+GheZA
zVpc0Ozq3INytrKMhf4OlgazxzJeXpQ2wSbQ7wDcvhavG1td3k9ETPFDrf7EBHpz
HEymwIT10GlUUfD7NxUme835JjLi/Irg4vN58qVfRXTw+KC3PjjWUc10njTJXenJ
meMg9+QAKbH7SjhmfbIA/xIsNbo1NO+F4NUMl3+/J+2/5tgXVu/VM0LjwwfvX1Wc
/QyFHKphYisNX+u74FBlNyEmSft0PG5AQXK2gK9iFZNM2oz6T9SOF/UM/ZkBOa73
ijUiGhVFbuqPdnf3XRGOav3U3B0pEtv/fX03P8yOeSRysA6PNsy1JF/t/Y4O2qf8
Sa6fxyzHAJSFxAvfkOWQtqsWM9coV/YdRpQdzynDep9zwgxVN3FpwgEphVDID85c
Hw8sfuSepM/vlcB06knvBeGKaMoOJ66jPWpadljywdrJELVqIq9mFMNIZ5y5WOJ5
pdXEzIZk54zwvVNdKhnGISQ0Jrm7Jh10HLcGZ2AXpdFSEYtTWSo5gaWNYOp/qchq
xs8I97Xjkbyt11xCOB4MGOn6oCeePGLj3RbrSR4VNH010lYCnuWnwipUQHHMBbcE
pFSQUx/+R7T8xCdIb+l+
=kwQB
-----END PGP SIGNATURE-----

--dDahtKqBtHb0CXUH8hK1pgSaPEJSco9eg--

