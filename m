Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1cQA-0004bj-RM
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 14:04:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cQ7-0004aS-Th
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 14:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e1cQ6-0005qi-Vr
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 14:04:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1e1cPx-0005ne-PG; Mon, 09 Oct 2017 14:04:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A334F356EC;
	Mon,  9 Oct 2017 18:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A334F356EC
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.122.223] (ovpn-122-223.rdu2.redhat.com [10.10.122.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BDF160842;
	Mon,  9 Oct 2017 18:04:35 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-32-f4bug@amsat.org>
	<87r2ucrcsi.fsf@dusky.pond.sub.org> <20171009081101.GA2374@work-vm>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f9b0931d-0f17-8977-f115-0f30df39b7fb@redhat.com>
Date: Mon, 9 Oct 2017 13:04:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171009081101.GA2374@work-vm>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ck2wkndEoD4V5aS0iQ8LPeFJDLcT3gUGR"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 09 Oct 2017 18:04:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 31/88] QMP: use g_new()
 family of functions
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
X-List-Received-Date: Mon, 09 Oct 2017 18:04:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ck2wkndEoD4V5aS0iQ8LPeFJDLcT3gUGR
Content-Type: multipart/mixed; boundary="KE20w112tNaITihfdnoJfoT5F3esdqis9";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Message-ID: <f9b0931d-0f17-8977-f115-0f30df39b7fb@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 31/88] QMP: use g_new() family of functions
References: <20171006235023.11952-1-f4bug@amsat.org>
 <20171006235023.11952-32-f4bug@amsat.org> <87r2ucrcsi.fsf@dusky.pond.sub.org>
 <20171009081101.GA2374@work-vm>
In-Reply-To: <20171009081101.GA2374@work-vm>

--KE20w112tNaITihfdnoJfoT5F3esdqis9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/09/2017 03:11 AM, Dr. David Alan Gilbert wrote:

>>> =20
>>> -    info =3D g_malloc0(sizeof(*info));
>>> +    info =3D g_new0(CommandInfoList, 1);
>>>      info->value =3D g_malloc0(sizeof(*info->value));
>>>      info->value->name =3D g_strdup(cmd->name);
>>>      info->next =3D *list;
>>
>> I'm not convinced rewriting
>>
>>        LHS =3D g_malloc(sizeof(*LHS));
>>
>> to
>>
>>        LHS =3D g_new(T, 1);
>>
>> where T is the type of LHS is worth the trouble.  The code before the
>> rewrite is pretty idiomatic.  There's no possibility of integer overfl=
ow
>> g_new() could avoid.  The types are obviously correct, so the addition=
al
>> type checking is quite unlikely to catch anything.  That leaves the
>> consistency argument.  I'm willing to hear it, but I feel it should be=

>> heard in a patch series that does nothing else.
>=20
> The 'obviously correct' is the dodgy part of the argument here.
> How many bugs do we right that are obviously wrong?
>=20
> t.c:13:20: warning: initialization from incompatible pointer type [-Win=
compatible-pointer-types]
>      struct c *pc =3D g_new(struct b, 1);
>=20
> seems good to me.

Yes, that's a GOOD warning, and it proves that we DO get type safety
when we convert:

LHS =3D g_malloc(sizeof(type))

into

LHS =3D g_new(type, 1)

but that's not what Markus was pointing out.  When we already have the
correctly-typed object on the right hand side, as in:

LHS =3D g_malloc(sizeof(*LHS))

then the compiler will always give us the correct type of LHS, whereas wi=
th:

LHS =3D g_new(type, 1)

we have to manually update the line if the type of LHS changes.

Thus, converting malloc(sizeof(type)) into new(type, 1) is a no-brainer,
but converting malloc(sizeof(*expr)) needs justification.  I'm not
necessarily opposed to the conversion (if our justification is
consistency, and where HACKING documents our style and where we have
scripts that let us easily preserve our style), but I'm not sure I see
the requisite justification in the current iteration of this series.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KE20w112tNaITihfdnoJfoT5F3esdqis9--

--ck2wkndEoD4V5aS0iQ8LPeFJDLcT3gUGR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnbujMACgkQp6FrSiUn
Q2ow7gf9Fv6yFtt5x9PvY5Ktggr0Wk/q8VrXKPV8yA13kw2OX3q6Yrqzi7diaXH8
i1ndCy4s9HlUlI1S+Fi0Hpo9hT1hd3SFkvmv+EGAoCT5rMXzqvjTGwagZsljTLN6
hd54ddphZObnn5qFekjK3CiJqFivYFDDwXU5ehd8JkaCoVhaBhR0BDVf7veqbQkK
P+l3MECYD30mNPN88GyuilUWI6IqRxYeCnPQOdo7Dgrxn3s342OxwIYvhDKxlRO0
zjKW2HPqGVkn5kGr7XkdddZ2+6sdlkLyK+PC757MGFlZ1acKoN/RoPhd4A58m150
DA/cFDgBXIs9Wu70iX9kpXKuf/RJeQ==
=4R8q
-----END PGP SIGNATURE-----

--ck2wkndEoD4V5aS0iQ8LPeFJDLcT3gUGR--

