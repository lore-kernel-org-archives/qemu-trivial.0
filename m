Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xr5Ah-0003TD-Cm
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 08:19:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xr5AY-0003SC-Au
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 08:19:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Xr5AS-0006uj-JI
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 08:19:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Xr5AS-0006uX-Al; Wed, 19 Nov 2014 08:19:32 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAJDJVhQ024953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 19 Nov 2014 08:19:31 -0500
Received: from [10.3.113.151] (ovpn-113-151.phx2.redhat.com [10.3.113.151])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAJDJTMe022313; Wed, 19 Nov 2014 08:19:29 -0500
Message-ID: <546C98E1.3070905@redhat.com>
Date: Wed, 19 Nov 2014 06:19:29 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1416380832-9697-1-git-send-email-famz@redhat.com>
In-Reply-To: <1416380832-9697-1-git-send-email-famz@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="mPqOOViVl5uIoJ3x95o78vbxllxs0HWNR"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mjt@tls.msk.ru,
	stefanha@redhat.com, mreitz@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] tests: Use "command -v" instead of
 which(1) in shell scripts
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
X-List-Received-Date: Wed, 19 Nov 2014 13:19:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mPqOOViVl5uIoJ3x95o78vbxllxs0HWNR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/19/2014 12:07 AM, Fam Zheng wrote:
> When which(1) is not installed, we would complain "perl not found"
> because it's the first set_prog_path check. The error message is
> wrong.
>=20
> Fix it by using "command -v", a native way to query the existence of a
> command.
>=20
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>

> +++ b/tests/qemu-iotests/common.config
> @@ -47,7 +47,7 @@ export PWD=3D`pwd`
>  # $1 =3D prog to look for, $2* =3D default pathnames if not found in $=
PATH
>  set_prog_path()
>  {
> -    p=3D`which $1 2> /dev/null`
> +    p=3D`command -v $1 2> /dev/null`

Reviewed-by: Eric Blake <eblake@redhat.com>

>      if [ -n "$p" -a -x "$p" ]; then

Unrelated: this line "works" because this is a /bin/bash script, but it
is non-portable.  Use of -a and -o inside [] is a mistake waiting to
happen.  For example, is [ ! "$a" -a "$b" ] supposed to be true or false
for all values of $a and $b?  Naively, this says return true if '! "$a"'
(a is empty) and '"$b"' (b is non-empty); but if $a is '(' and $b is ')'
it could also be parsed as returning the negation of whether the
parenthesized string "-a" is non-empty.

Use of -a and -o in [[]] is a bit better, but I still HIGHLY recommend
that constructs like this be rewritten as [ -n "$p" ] && [ -x "$p" ] for
avoidance of confusion and prevention of copy-pasting the test to
non-bash shells.  But that would be a separate patch.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--mPqOOViVl5uIoJ3x95o78vbxllxs0HWNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUbJjhAAoJEKeha0olJ0Nqt2wIAIW1r/VOJB5hJEW6sviTWjhe
a/rahj0Y5GS4od8NLfD6UM9R4Kul9c+7PGCM4IPRYsl+DOnD86jUziFKrhcsgCN0
F4ksLO3NCztWOyRDw96kzbMVK+Sk3XFTd0GyBhIr8cZbVMCL1Tz8u4mRqKc3JR/L
XnMMz49RukZOu3xqwHnm5RcjVFDTjWBe3t7rrl3JLeoT+wz40iVbAaVc4VlVeJlx
6LiOvpmYf6gjBNIy6ZLzCgWwvq65ELcOBIC5gBHZxF2fFcsE+DxJoM/SFPy00Ilu
ji97N/VLc/gVbfK3WSHYmB7IVUQ+HQpmo/Jsav283Woa8Cg6MeZ7v76yJgEyDEI=
=3HbN
-----END PGP SIGNATURE-----

--mPqOOViVl5uIoJ3x95o78vbxllxs0HWNR--

