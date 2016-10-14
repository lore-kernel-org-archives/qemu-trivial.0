Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buzIz-00042r-QO
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 06:01:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1buzIu-0003yc-UC
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 06:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1buzIn-0000hK-TI
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 06:01:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1buzIi-0000dK-9q; Fri, 14 Oct 2016 06:01:16 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EF7F711C6;
	Fri, 14 Oct 2016 10:01:15 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EA1ECp025379; Fri, 14 Oct 2016 06:01:15 -0400
Date: Fri, 14 Oct 2016 11:01:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20161014100113.GB20003@stefanha-x1.localdomain>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 14 Oct 2016 10:01:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Fix build for less common build
 directories names
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
X-List-Received-Date: Fri, 14 Oct 2016 10:01:32 -0000


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 08:29:30PM +0200, Stefan Weil wrote:
> scripts/tracetool generates a C preprocessor macro from the name of the
> build directory. Any characters which are possible in a directory name
> but not allowed in a macro name must be substituted, otherwise builds
> will fail.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> I had problems with a build directory of the form "host,variant".
> Is this fix needed for stable, too?
>=20
> Regards
> Stefan W.
>=20
>  scripts/tracetool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/tracetool.py b/scripts/tracetool.py
> index 629b259..fe9c9e9 100755
> --- a/scripts/tracetool.py
> +++ b/scripts/tracetool.py
> @@ -70,7 +70,7 @@ def make_group_name(filename):
> =20
>      if dirname =3D=3D "":
>          return "common"
> -    return re.sub(r"/|-", "_", dirname)
> +    return re.sub(r"[^A-Za-z0-9]", "_", dirname)

dirname should only contain QEMU source tree subdirectory paths (e.g.
hw/net).  How did you get a comma in there?

I tried an out-of-tree build in a directory called 'a,b' but it doesn't
trigger the issue.

I'd like to understand how to reproduce the problem in case I missed
something.

Stefan

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYAKzpAAoJEJykq7OBq3PI9Y4IAIk+tKbI1x6qYsvohBZ3Q/uO
BeaFZnTLf+WVdM/AH5svKGORf7VEV7UM/OCcZxOTIiJuY+jy7+CITYcWKDy+Kkr5
UpJLNAEJCfhfWWhWWqLWfUdrH2FZc6AGj5S40KvA2FP7xddZG1tNqZbmWVOhl1fl
l3Nr4SH/rRbGtpsz4z1Hn2sllIy6apgL30H5Nv8AwroG+WXIsSRt3+yaAvYa78xc
YbOHYkVvWaGms/N4DqhJzGCfKOZFUpfmAb7vmbVLazpZHxExO2b8amzV1/lhSdt6
Oerwo3kM0WGAlaq/+a3///SQHwAbU07xFMLAITTV4rE1ED8kDaIL+tTdJ+UwOow=
=OtE7
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--

