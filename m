Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zx45g-0008T4-BJ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 21:27:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1Zx45d-0008QX-Vn
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 21:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1Zx45d-0005Cj-5H
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 21:27:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1Zx45Y-0005AZ-Q5; Thu, 12 Nov 2015 21:27:44 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id F08CBE706C;
	Fri, 13 Nov 2015 02:27:43 +0000 (UTC)
Received: from localhost (ovpn-112-19.ams2.redhat.com [10.36.112.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAD2Rehe006692; Thu, 12 Nov 2015 21:27:42 -0500
Date: Fri, 13 Nov 2015 10:27:37 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20151113022737.GC8057@stefanha-x1.localdomain>
References: <1447353228-30550-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <1447353228-30550-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.23 (2015-06-09)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore test-blockjob-txn
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
X-List-Received-Date: Fri, 13 Nov 2015 02:27:50 -0000


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 11:33:48AM -0700, Eric Blake wrote:
> Commit 6c6f312d added a new test, but did not mark it for
> exclusion in .gitignore.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Yeah, I know this affects only non-VPATH builds, which we don't
> recommend, but we might as well be consistent.
>=20
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWRUqZAAoJEJykq7OBq3PIaW4IAKPIQHkqiPzDpgGopgp6orMB
mWl5OJR0Sxxvc6nzsKA+xGqgrrmvwi98HmnKhyTIbbnUKWoP7y5aoKNZG8ps/kCq
JYb7JYYufvm4w5mUlo3Jv79cVrduXDmVaAmxfqWRjfcsZnysRp/0fC7vflgPNZAB
Uj14Z2t1gf9l2twq2aYU0SwPNk9Og2NC3c3Sdc7WeWYEzASTNdBTYTnJe5A8guRO
tgCQM64BOEAvdD40SRz0QXPiQNk0ia9mO0ca+eadZv+idET3nsYmsrxd9CKL8ZbK
zudZdlhehiNjYuITUIORpnJgmvFk4YYegJf/lhwxSk3qt7pv5u9IysTqiqqmMZk=
=i4qt
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--

