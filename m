Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLuz-0001C7-I5
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:33:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLuw-0001Ac-53
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLuv-0003ux-Aj
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:33:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJLup-0003q8-9L; Fri, 09 Jun 2017 11:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33EF7734;
	Fri,  9 Jun 2017 15:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 33EF7734
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 33EF7734
Received: from [10.10.121.94] (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91F9786325;
	Fri,  9 Jun 2017 15:33:33 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	qemu-devel@nongnu.org
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-2-eblake@redhat.com>
	<CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b3e66ce9-d503-bf6f-cd93-511097418480@redhat.com>
Date: Fri, 9 Jun 2017 10:33:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="E5fcT9pB7twRrGqRBeoDBsH7n3w76Thnl"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Jun 2017 15:33:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qobject: Update
 coccinelle script to catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:33:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E5fcT9pB7twRrGqRBeoDBsH7n3w76Thnl
Content-Type: multipart/mixed; boundary="4tWfsWxDCoFje595rUiIXksQSDG756PjG";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Message-ID: <b3e66ce9-d503-bf6f-cd93-511097418480@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] qobject: Update coccinelle script to
 catch Q{INC, DEC}REF
References: <20170609152017.7286-1-eblake@redhat.com>
 <20170609152017.7286-2-eblake@redhat.com>
 <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>

--4tWfsWxDCoFje595rUiIXksQSDG756PjG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/09/2017 10:28 AM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Fri, Jun 9, 2017 at 7:20 PM Eric Blake <eblake@redhat.com> wrote:
>=20
>> A recent patch submission was about to use qobject_decref(QOBJECT(E)),=

>> even though we already have QDECREF(E) for that purpose.  While our
>> tree is currently free from the longhand form, we might as well update=

>>
>=20
> Oh?
>=20
>  $ git grep 'object_unref(OBJECT('  | wc -l
> 152

Quit mixing QOM and QObject ;)

$ git grep qobject_'..cref(QOBJECT'
include/qapi/qmp/qobject.h:    qobject_incref(QOBJECT(obj))
scripts/coccinelle/qobject.cocci:- qobject_incref(QOBJECT(E));
scripts/coccinelle/qobject.cocci:- qobject_decref(QOBJECT(E));

Yes, we may want to add a script to clean QOM abuses, but that's a
different project for a different day.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--4tWfsWxDCoFje595rUiIXksQSDG756PjG--

--E5fcT9pB7twRrGqRBeoDBsH7n3w76Thnl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZOr/MAAoJEKeha0olJ0NqCqUIAJ2dDzernby+VaTxULJ7//q0
gxZ5Nxkh3nye2PvbfthPNIU8drJOu9AaBjrzhNJ7HxQ7zBgcR3xeckbvJXFxwnoj
DTmO6V4aiStv9dMRySVRf9dhwOOJ8NyAqgZgaHm3a7BYolOVzglz4IZKTUWSWn1T
4UaCZhnY9mLSvJRsTU27hpmdJdc3ZwP9o6VwBI5KedBgG+WYBpyRsGsU3UwAzshs
F7T8GzOilfn6WGo5C7IR0vW5dOioNwsQHZgV1pHqGv5osbO3wK0uB8vbk7OswpHf
2zFIelXqaJs4dJeX9hTQIsd4iDb4lgD9qhK/JeLgIsjlR7qoyFIsL4k65ns24rI=
=awMj
-----END PGP SIGNATURE-----

--E5fcT9pB7twRrGqRBeoDBsH7n3w76Thnl--

