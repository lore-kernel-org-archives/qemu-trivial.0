Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkaUF-0002sb-BE
	for mharc-qemu-trivial@gnu.org; Sat, 01 Nov 2014 11:21:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XkaU7-0002rO-Cn
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 11:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XkaU1-0006LL-FN
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 11:20:59 -0400
Received: from resqmta-po-11v.sys.comcast.net ([96.114.154.170]:35155)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XkaU1-0006L8-9G
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 11:20:53 -0400
Received: from resomta-po-01v.sys.comcast.net ([96.114.154.225])
	by resqmta-po-11v.sys.comcast.net with comcast
	id AFKk1p0044s37d401FLsPG; Sat, 01 Nov 2014 15:20:52 +0000
Received: from [10.1.5.182] ([63.158.87.14])
	by resomta-po-01v.sys.comcast.net with comcast
	id AFJY1p0060JZzm701FJaLl; Sat, 01 Nov 2014 15:18:50 +0000
Message-ID: <5454F9C7.4020208@redhat.com>
Date: Sat, 01 Nov 2014 09:18:31 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-4-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1414806603-22556-4-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ra4XqvpVjvsr9UuoFxXED5jfIhKlWTRbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1414855252;
	bh=4EKsQInhBJ4qXcatiEfZADPhuM/9YQIHCK/ars4+CyE=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=N+BaF/qBhSGsItG8iXuIrZ53/usE2tO4eV5XxzmN4GZ+TkTNxdtcreDLDWsmcSXPU
	Pji6kn1nOpVDWzEnaribSgcRYBFovTW1LvfKRCqDp9HrBvvHsl/0FJitHvSrS7bvy6
	6J9B+dP3KGdF+FrkfuBze0Di7PjDUmLxQJpKLRTK3cblNPTdQRGTcHTEU2hXIoyxXn
	G26UqSILLn879uKTICSOLmfD6iQEGeSubGAKoTaBdNhR9yIv8IZTub4bWeTf/ujKgk
	Bnqb1A6Eo/zEIMidUimYRihfUzTPZuftcrUdwSZOqlRqRP5Rm4jigqiu8N8F/eVufP
	GWRD+LFHZvS6Q==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.170
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] qemu-char: convert some
 open functions to use Error API
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
X-List-Received-Date: Sat, 01 Nov 2014 15:21:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ra4XqvpVjvsr9UuoFxXED5jfIhKlWTRbX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/31/2014 07:50 PM, zhanghailiang wrote:
> Convert several Character backend open functions to use the Error API.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  qemu-char.c | 52 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 25 deletions(-)

> @@ -2337,12 +2339,12 @@ static CharDriverState *qemu_chr_open_stdio(Cha=
rdevStdio *opts)
>          if (stdio->hInputThread =3D=3D INVALID_HANDLE_VALUE
>              || stdio->hInputReadyEvent =3D=3D INVALID_HANDLE_VALUE
>              || stdio->hInputDoneEvent =3D=3D INVALID_HANDLE_VALUE) {
> -            fprintf(stderr, "cannot create stdio thread or event\n");
> +            error_setg(errp, "cannot create stdio thread or event");
>              exit(1);

This conversion feels wrong.  error_setg() does not report an error, it
just stores the error for a later entity higher in the call stack to
report it.  But exit() means there is no execution of the reporting
code.  Either leave this one alone, or get rid of the exit and instead
properly propagate error status back to the caller and make sure the
caller reports it.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ra4XqvpVjvsr9UuoFxXED5jfIhKlWTRbX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUVPnHAAoJEKeha0olJ0NqVxwIAIYAvMbkXqMt99ieNPRWN8xK
hUxZk+0EI/5A25c75CyYnxKxoOUKCeUvvtN8pXAnzztFyDMm4NlRAqwKQwnAmbL8
uj7FxI7fAdO4mepWMauCobXKS1A98VmrDTaesaTdEp8SEollHLmvqt5qcliiDo9t
dk5fmye4hCnF4vOqwpHuEbUvYX/W8/2fludylS9lyUkOuIEII1jOmwovhJ3Dh+Ik
5BOAEMhena+VEtuHn8hFo4bSag8SxkmtHg1WPgjgE/KDiAzpdHnOCgeyVAqib4ZY
7wUTVIdpO7Af8Mu/goeMlNmHwZ1gPNqGN9dpVtKM/OCU48VHT3ioFm2r9DFIjBU=
=+MeW
-----END PGP SIGNATURE-----

--ra4XqvpVjvsr9UuoFxXED5jfIhKlWTRbX--

