Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYXRg-0002Bp-7K
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 08:54:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYXRe-00029o-4N
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 08:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYXRd-0001Nm-0k
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 08:54:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYXRW-0001Jl-J9; Fri, 21 Jul 2017 08:54:06 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE4CC073D69;
	Fri, 21 Jul 2017 12:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6EE4CC073D69
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6EE4CC073D69
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEB880E84;
	Fri, 21 Jul 2017 12:54:03 +0000 (UTC)
To: Kamil Rytarowski <n54@gmx.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
	<eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
	<CAFEAcA_mOeR2jTGuik6Jig972vMW5JTqQFaoZzt5_9oaG7D+aA@mail.gmail.com>
	<9b0800b8-b13f-67b3-a21f-96a6ba8d0a99@gmx.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	"patches@linaro.org" <patches@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <0b389a73-243c-71fa-8a3f-f8af79f487b0@redhat.com>
Date: Fri, 21 Jul 2017 07:54:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9b0800b8-b13f-67b3-a21f-96a6ba8d0a99@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qLd2NksO1XpjvcoWfNgtViGGsLSLB6hiP"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 21 Jul 2017 12:54:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10]
 util/oslib-posix.c: Avoid warning on NetBSD
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
X-List-Received-Date: Fri, 21 Jul 2017 12:54:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qLd2NksO1XpjvcoWfNgtViGGsLSLB6hiP
Content-Type: multipart/mixed; boundary="jWIgxOd6SH9VCqRrABP6rWmoOIpcVWVGt";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kamil Rytarowski <kamil@netbsd.org>,
 "patches@linaro.org" <patches@linaro.org>
Message-ID: <0b389a73-243c-71fa-8a3f-f8af79f487b0@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] util/oslib-posix.c:
 Avoid warning on NetBSD
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
 <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
 <CAFEAcA_mOeR2jTGuik6Jig972vMW5JTqQFaoZzt5_9oaG7D+aA@mail.gmail.com>
 <9b0800b8-b13f-67b3-a21f-96a6ba8d0a99@gmx.com>
In-Reply-To: <9b0800b8-b13f-67b3-a21f-96a6ba8d0a99@gmx.com>

--jWIgxOd6SH9VCqRrABP6rWmoOIpcVWVGt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/21/2017 07:18 AM, Kamil Rytarowski wrote:
> On 21.07.2017 12:22, Peter Maydell wrote:
>> On 20 July 2017 at 19:26, Eric Blake <eblake@redhat.com> wrote:
>>> On 07/20/2017 11:32 AM, Peter Maydell wrote:
>>>> On NetBSD the compiler warns:
>>>> util/oslib-posix.c: In function 'sigaction_invoke':
>>>> util/oslib-posix.c:589:5: warning: missing braces around initializer=
 [-Wmissing-braces]
>>>>      siginfo_t si =3D { 0 };
>>>>      ^
>>>
>>> Uggh. That is a broken compiler.  C99 declares that 'anything =3D {0}=
' is
>>> supposed to be a valid way to zero-initialize anything.
>>>
>=20
> Not necessarily broken compiler. According to strict C standard we need=

> to initialize it in this case with "{{0}}"... which is ugly.

No, the C standard SPECIFICALLY allows for missing {}, so that {0} is
the universal zero-initializer.

  typedef union siginfo {
          char    si_pad[128];    /* Total size; for future expansion */
          struct _ksiginfo _info;
  } siginfo_t;

C99 6.7.8 Initialization paragraph 20

> If the aggregate or union contains elements or members that are aggrega=
tes or unions,
> these rules apply recursively to the subaggregates or contained unions.=
 If the initializer of
> a subaggregate or contained union begins with a left brace, the initial=
izers enclosed by
> that brace and its matching right brace initialize the elements or memb=
ers of the
> subaggregate or the contained union. Otherwise, only enough initializer=
s from the list are
> taken to account for the elements or members of the subaggregate or the=
 first member of
> the contained union; any remaining initializers are left to initialize =
the next element or
> member of the aggregate of which the current subaggregate or contained =
union is a part.

and also gives an example of missing braces being valid, in paragraph 28:=


> EXAMPLE 5
> The declaration
> struct { int a[3], b; } w[] =3D { { 1 }, 2 };
> is a definition with an inconsistently bracketed initialization. It def=
ines an array with two element
> structures: w[0].a[0] is 1 and w[1].a[0] is 2; all the other elements a=
re zero.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--jWIgxOd6SH9VCqRrABP6rWmoOIpcVWVGt--

--qLd2NksO1XpjvcoWfNgtViGGsLSLB6hiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllx+WsACgkQp6FrSiUn
Q2obrwf+Pwdxm+FhFfdFDWdwgPOBeeUVY+7indwtu6oyHiPkHyjRqB0Ghn5ufp78
7FDy+98pxz34BdzNzGUc7WwZEkLOsglkSqXU3gsAufdzHe5iebpEaqtsWpLKSuen
7JxNu1JV9Y+WUlg3ZLeGN3vIaGQ8QuKHg1QEqzfcjr1C6rxy8AAmn0Mvz+EqwcWt
8GyZjl3z9Fdade8RXX4CXgfXJS63ymku178xjcSAkeyllc9WyZAsXiGzXvsgtYLq
WAfvFZpIe2RsicyQfqCK+fGrX4WoqvBJCA5YfgMWJC2AKdThYiS5gCY3IbjNR2an
rywfU54+3R+rGdkyQY4D10tQ6Ocadw==
=QCeQ
-----END PGP SIGNATURE-----

--qLd2NksO1XpjvcoWfNgtViGGsLSLB6hiP--

