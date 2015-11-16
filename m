Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZyQBu-0005Pp-ES
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2015 15:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZyAnq-0003VX-P4
	for qemu-trivial@nongnu.org; Sun, 15 Nov 2015 22:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZyAnp-0005iu-Vk
	for qemu-trivial@nongnu.org; Sun, 15 Nov 2015 22:50:02 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:35988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZyAnl-0005ca-J3; Sun, 15 Nov 2015 22:49:57 -0500
Received: by pacdm15 with SMTP id dm15so160576707pac.3;
	Sun, 15 Nov 2015 19:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SllsRFNoNnqnE9tVHwdlA2gejzUNXcZX+wZNop5hFlU=;
	b=Lwd4Q7PHeI06mzh8a/yhFS0ZGLaDFcqFAaeWKPSQtf45W+v+oYU65KrVHnqUi5YxdN
	ZOifnlKwQB4Cm21KP9TXN3wC9OBoHvPKGmQvxoL3m1vU/NFaTuKuacnEdVxaAgU6yILB
	GNSddhD0q4GLkYWztw3+HJzkNqQglSLOD1RmPPQPMz3ekiKl0CvGtf9Cj1hwOgRtaS3X
	H5lwKtwVqhdAlPIezHaVKPy8BhmS9//d4GXPlvoBpaQVY85jjBcCbo+rnNQaG+ucm+om
	W5RQD7hOhar3GVTc289CocbRzZYG0j7ffWRzlBJyH6h8SmOEBpU0CUVajiruq1lVG+ie
	9Y5Q==
X-Received: by 10.66.150.165 with SMTP id uj5mr50702131pab.23.1447645796667;
	Sun, 15 Nov 2015 19:49:56 -0800 (PST)
Received: from localhost (42-2-247-202.static.netvigator.com. [42.2.247.202])
	by smtp.gmail.com with ESMTPSA id
	v17sm33005953pbs.69.2015.11.15.19.49.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 19:49:55 -0800 (PST)
Date: Mon, 16 Nov 2015 11:49:53 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20151116034953.GF9498@stefanha-x1.localdomain>
References: <1447386423-13160-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline
In-Reply-To: <1447386423-13160-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.23 (2015-06-09)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: qemu-trivial@nongnu.org, berto@igalia.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.5 v2] tests: Ignore
 recent test binaries
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
X-List-Received-Date: Mon, 16 Nov 2015 03:50:03 -0000


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 08:47:03PM -0700, Eric Blake wrote:
> Commits 6c6f312d and bd797fc1 added new tests (test-blockjob-txn
> and test-timed-average, respectively), but did not mark them for
> exclusion in .gitignore.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> v2: retitle; also ignore test-timed-average
>=20
>  tests/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWSVJhAAoJEJykq7OBq3PIu98H/iJJvwWFNLr/mYx1Jxk/o76J
0khjTFfo3cCnMPdVyNvBP9fjO7I85mcrASNvmVQ5rEQRSO8Q8SbsWdYcHp/LVWgv
j61kbFfC9KckBS/+SmSepvX05u5UHN2ATeOCA17NH3bZ0HaI5TnIgTBMoqdEP/Gl
YowKjg07bwPA9PnKheJFzm096KgOsKabEkIHf/J4eWurNgngwlZHQu2/A7F1hB0W
eoSYR1ToTZfC3tF3csCJfdzIasSCuW3p8QPu1aIEd4fHLZ2vKIomN1N7yP99jPaG
yVGX0RNym3pe1X7sUEy1+Eg4dRTJr7jI67yQXlYvVJQbceTEKITvop1Q54Sk54Q=
=q8zt
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--

