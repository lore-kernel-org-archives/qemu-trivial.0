Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhgUE-000221-JS
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 10:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhgU9-0001w2-Ad
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WhgU4-0004sw-TM
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:36:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WhgTv-0004pu-II; Tue, 06 May 2014 10:36:31 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s46EaSXl032309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 6 May 2014 10:36:28 -0400
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s46EaRp9016168; Tue, 6 May 2014 10:36:27 -0400
Message-ID: <5368F36B.3040804@redhat.com>
Date: Tue, 06 May 2014 08:36:27 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="E2hBSILk9THAI8ucgPpi5i42h7dTH03sP"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Don Slutz <dslutz@verizon.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Put tempfiles in
 subdir so we can clean up libtool files
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
X-List-Received-Date: Tue, 06 May 2014 14:36:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E2hBSILk9THAI8ucgPpi5i42h7dTH03sP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/06/2014 07:17 AM, Peter Maydell wrote:
> When libtool support was added to configure, the new temporary files
> were left out of the list of files cleaned up on exit; this results
> in a lot of stale .lo files being left around in /tmp. Worse, libtool
> creates a /tmp/.libs directory which we can't easily clean up.
>=20
> Put all our temporary files in a single temporary directory created
> via mktemp -d, so we can easily clean it up. This has the bonus
> result that we no longer use $RANDOM (which silently expands to the
> empty string if your shell is not bash, and so is pretty useless).
>=20
> Note that because we now use mktemp's tempdir-finding logic rather
> than handrolling it, we no longer honour TEMPDIR (only TMPDIR).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't know why we were looking at TEMPDIR; that code was
> in there from the initial commit by Fabrice back in 2003...
>=20

> +
> +TMPDIR1=3D$(mktemp -t -d)

mktemp is not POSIX.  BSD mktemp lacks -t:

http://www.freebsd.org/cgi/man.cgi?query=3Dmktemp&apropos=3D0&sektion=3D1=
&manpath=3DRed+Hat+Linux%2Fi386+9&format=3Dhtml

and there are probably systems that lack mktemp(1) altogether.  You'll
need to come up with a more portable alternative.

Here's what autoconf recommends (modify to fit...):

# Create a (secure) tmp directory for tmp files.

{
  tmp=3D`(umask 077 && mktemp -d "./confXXXXXX") 2>/dev/null` &&
  test -d "$tmp"
}  ||
{
  tmp=3D./conf$$-$RANDOM
  (umask 077 && mkdir "$tmp")
} || as_fn_error $? "cannot create a temporary directory in ." "$LINENO" =
5
ac_tmp=3D$tmp

The use of $$ and $RANDOM is safe (even on shells that lack $RANDOM)
because of the fact that mkdir is atomic and the umask is correctly set
prior to the mkdir.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--E2hBSILk9THAI8ucgPpi5i42h7dTH03sP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTaPNrAAoJEKeha0olJ0Nqz90H/R5iaSWrA4iAufvGUXdY6cYJ
p8b9/x0k7C1eg6IiQFdW7nKf9FHuSH/3a99hQsHr/Ec17+55Q1W2YvMdIyIIxv3l
ueLtHczLn6HHRoSzkEG91z/sCT4vkKoH7h8Z00NSMC2fkWg0yGTmSbFuAgukEgwT
jfmjJkLs/QXt1/pktZ/zOzHsDEOLsVmWVSSUU5YSNrY5OAp4wxX0HuUM/cKPvw8h
xCrmjNrjQ0ggEbWSA1CiiIIC1aP5eERbnDnpBefCcGFk3A6haAsrXYjR+pQH1Uu4
uZPFWT6LvgrhbinUve3pUvmSCPAfxd0W31uOL8eBMDQz8wnjNrMJiSQbpnhDGOQ=
=KN96
-----END PGP SIGNATURE-----

--E2hBSILk9THAI8ucgPpi5i42h7dTH03sP--

