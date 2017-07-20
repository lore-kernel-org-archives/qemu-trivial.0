Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYIiW-0002QT-3T
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 17:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYIiT-0002Oc-DV
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYIiS-0005zL-G4
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:10:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYIiM-0005uj-Qc; Thu, 20 Jul 2017 17:10:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86F4A7CB8D;
	Thu, 20 Jul 2017 21:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 86F4A7CB8D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 86F4A7CB8D
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C93E17C4C;
	Thu, 20 Jul 2017 21:10:28 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
	<eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
	<CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	"patches@linaro.org" <patches@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <15cdd5e0-48f8-35be-8fa3-c57bc50828f6@redhat.com>
Date: Thu, 20 Jul 2017 16:10:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LgRcC7l64IOhTgbRbMCFtk77O7xK1iSVr"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Jul 2017 21:10:29 +0000 (UTC)
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
X-List-Received-Date: Thu, 20 Jul 2017 21:10:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LgRcC7l64IOhTgbRbMCFtk77O7xK1iSVr
Content-Type: multipart/mixed; boundary="nkDhRkNCn0KOto1MLUKViRTChC485CVno";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kamil Rytarowski <kamil@netbsd.org>,
 "patches@linaro.org" <patches@linaro.org>
Message-ID: <15cdd5e0-48f8-35be-8fa3-c57bc50828f6@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] util/oslib-posix.c: Avoid warning
 on NetBSD
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
 <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
 <CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>
In-Reply-To: <CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>

--nkDhRkNCn0KOto1MLUKViRTChC485CVno
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 03:53 PM, Peter Maydell wrote:
> On 20 July 2017 at 19:26, Eric Blake <eblake@redhat.com> wrote:
>> On 07/20/2017 11:32 AM, Peter Maydell wrote:
>>> On NetBSD the compiler warns:
>>> util/oslib-posix.c: In function 'sigaction_invoke':
>>> util/oslib-posix.c:589:5: warning: missing braces around initializer =
[-Wmissing-braces]
>>>      siginfo_t si =3D { 0 };
>>>      ^
>>
>> Uggh. That is a broken compiler.  C99 declares that 'anything =3D {0}'=
 is
>> supposed to be a valid way to zero-initialize anything.
>=20
> Looks like maybe it was https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
53119

Would it be better to add a configure check for broken -Wmissing-braces
(where we would then add -Wno-missing-braces to the (outdated) NetBSD
compiler)?

But then again, we already rely on gcc/clang's extension of foo=3D{}
(which is valid for C++, what a shame that the two languages picked
different universal-zero initializers), so it's probably less churn to
just fix the few outliers to also rely on the extension than it is to
bloat configure just to permanently work around the broken compiler.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--nkDhRkNCn0KOto1MLUKViRTChC485CVno--

--LgRcC7l64IOhTgbRbMCFtk77O7xK1iSVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllxHEMACgkQp6FrSiUn
Q2rZ6ggAl0IB/bMiZOSu1Mzlc7Oxiqymiv9DEkxUat8MRJXTom0kFeQPnmtJC4/a
dQfcGIaUiSxzdH2P9thAPaDz3ZcTTWq1Ice6usFQ7Cqdt415i/SovYlCwCBrtGvQ
dw54FnJF7YszE1q/SkgOZfO6z3nX9C/onlHuyb7kVYT7JkpsZeaMjZlTO2WBtrDD
Cbpk8yQZdcl4Y+r4WW8n786dwBjOL0F4GbONCA+qbmNH5ok+8P7zgWSTPbBd2jNq
2NIU7X1j6jVrRAr+VsiZnLq/LoyONCHyLp9dOYHtPOfBGfyAyK56dy3MFJpEgsBb
Me1TRI9CvFhqbtWRbqtnnuXwEtys9g==
=WeoD
-----END PGP SIGNATURE-----

--LgRcC7l64IOhTgbRbMCFtk77O7xK1iSVr--

