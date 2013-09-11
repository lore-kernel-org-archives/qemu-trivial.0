Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJmmH-0008CV-75
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:56:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VJmmB-000852-93
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1VJmm6-0005qn-DY
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1VJmlv-0005pI-D9; Wed, 11 Sep 2013 11:56:03 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8BFtrJK002133
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Sep 2013 11:55:54 -0400
Received: from [10.3.113.111] (ovpn-113-111.phx2.redhat.com [10.3.113.111])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8BFtq7D025975; Wed, 11 Sep 2013 11:55:53 -0400
Message-ID: <52309288.8000100@redhat.com>
Date: Wed, 11 Sep 2013 09:55:52 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com>
In-Reply-To: <523083EF.7050203@redhat.com>
X-Enigmail-Version: 1.5.2
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Hta0hBwENlip1fiTXa8L67swbXXT0P04H"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Quote extra_cflags in config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 15:56:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hta0hBwENlip1fiTXa8L67swbXXT0P04H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/11/2013 08:53 AM, Paolo Bonzini wrote:
>=20
> printf "# Configured with:" >> $config_host_mak
> printf " '%s'" "$0" "$@" >> $config_host_mak
>=20
> Something like
>=20
> for arg in "$0" "$@"; do
>    quoted_arg=3D$(echo "$i" | sed 's/[$\\"]/\\&/g')

Won't work as written: mismatch between $arg vs. $i.

That missed ` - but do we expect anyone to pass a literal ` as one of
their arguments?  Also, it strips any literal trailing newlines in the
arguments.

>    printf ' "%s"' "$quoted_arg"
> done >> $config_host_mak
>=20
> could replace the second line.  Adding Eric Blake in case he knows some=

> extra trick.

Nope, no good portable tricks for this.  But to address the (corner
case) issues I mentioned above, it might be worth using '' rather than
"" quoting; as well as embed a trailing space to guarantee no trailing
newline:

for arg in "$0" "$@"; do
    quoted_arg=3D$(echo "$arg " | sed "s/'/'\\''/g')
    printf "'%s'" "$quoted_arg"
done >> $config_host_mak

if you don't mind a trailing space in the output file.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Hta0hBwENlip1fiTXa8L67swbXXT0P04H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSMJKIAAoJEKeha0olJ0NqLA4H/jYs722QNkoze7GxobkXJNyV
bmsnZrvYp5eppJT7Tue7KTv/KFMPMDib6YSkh1L39ayjYTorRB+6xMoAeVJXFeHR
94U3ZSMCTLak29ZEW8hH6CUGC5XXtHWMeCCU9EBxbhL5wu9jleWQjgLRHyN9C4nl
qSI79w5SXtPgJeGqqIjz7Y35A0pfHMaNA/lHqyb215At/IqBlom6zftXfOnSPg9F
oPRsGjMWwSVEhjvYwYhvP+gEV08wQ1P4NDUA+qoBi1rrkJURnV/9AJOQw5tF23n4
yO3AqwXQX1c3pcuvjSfiNEpUL+dmi7y++7p/h68bqmWXUaUyaIiR0NOKEo6j5HU=
=oGG9
-----END PGP SIGNATURE-----

--Hta0hBwENlip1fiTXa8L67swbXXT0P04H--

