Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnrLH-0000IE-No
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 14:38:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnrLF-0000Hz-8S
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 14:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnrLB-0000xZ-SQ
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 14:38:41 -0400
Received: from www145.your-server.de ([78.47.15.66]:34529)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andreas@grapentin.org>)
	id 1cnrLB-0000x4-Jy; Tue, 14 Mar 2017 14:38:37 -0400
Received: from [88.198.220.131] (helo=sslproxy02.your-server.de)
	by www145.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnrL9-0000OG-ID; Tue, 14 Mar 2017 19:38:35 +0100
Received: from [62.157.38.9] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnrL9-0006Wk-95; Tue, 14 Mar 2017 19:38:35 +0100
Date: Tue, 14 Mar 2017 19:38:34 +0100
From: Andreas Grapentin <andreas@grapentin.org>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170314183834.GA23093@parabola-pocket>
References: <20170314165953.18506-1-andreas@grapentin.org>
	<ddea3a8a-715e-c24d-e434-3fa55f5d81b2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <ddea3a8a-715e-c24d-e434-3fa55f5d81b2@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Authenticated-Sender: andreas@grapentin.org
X-Virus-Scanned: Clear (ClamAV 0.99.2/23203/Tue Mar 14 13:13:21 2017)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 78.47.15.66
Subject: Re: [Qemu-trivial] [PATCH v2] use _Static_assert in
 QEMU_BUILD_BUG_ON
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
X-List-Received-Date: Tue, 14 Mar 2017 18:38:42 -0000


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The missing ! is because I generated the error messages by inverting the
condition and then forgot to change it back. I can send a v3 if you
like.

Thanks for being patient with me.

-A


On Tue, Mar 14, 2017 at 12:43:56PM -0500, Eric Blake wrote:
> On 03/14/2017 11:59 AM, Andreas Grapentin wrote:
> > QEMU_BUILD_BUG_ON should use C11's _Static_assert, if the compiler supp=
orts it,
> > to provide more readable messages on failure.
>=20
> >=20
> > with _Static_assert:
> >=20
> >> In file included from /qemu/include/qemu/osdep.h:36:0,
> >>                  from /qemu/qga/commands.c:13:
> >> /qemu/qga/commands.c: In function =E2=80=98qmp_guest_exec_status=E2=80=
=99:
> >> /qemu/include/qemu/compiler.h:94:30: error: static assertion failed: "=
not expecting: sizeof(*&gei->finished) > sizeof(void *)"
> >>  #define QEMU_BUILD_BUG_ON(x) _Static_assert((x), #x)
>=20
> Manual copy-and-paste? Because this is missing the ! present in the
> actual definition...
>=20
> >>                               ^
> >> /qemu/include/qemu/atomic.h:146:5: note: in expansion of macro =E2=80=
=98QEMU_BUILD_BUG_ON=E2=80=99
> >>      QEMU_BUILD_BUG_ON(sizeof(*ptr) > sizeof(void *));   \
> >>      ^~~~~~~~~~~~~~~~~
> >> /qemu/include/qemu/atomic.h:417:5: note: in expansion of macro =E2=80=
=98atomic_load_acquire=E2=80=99
> >>      atomic_load_acquire(ptr)
> >>      ^~~~~~~~~~~~~~~~~~~
> >> /qemu/qga/commands.c:160:21: note: in expansion of macro =E2=80=98atom=
ic_mb_read=E2=80=99
> >>      bool finished =3D atomic_mb_read(&gei->finished);
> >>                      ^~~~~~~~~~~~~~
> >=20
> > Signed-off-by: Andreas Grapentin <andreas@grapentin.org>
> > ---
>=20
> > +++ b/include/qemu/compiler.h
> > @@ -90,7 +90,9 @@
> >          int:(x) ? -1 : 1; \
> >      }
> > =20
> > -#ifdef __COUNTER__
> > +#if defined(CONFIG_STATIC_ASSERT)
> > +#define QEMU_BUILD_BUG_ON(x) _Static_assert(!(x), "not expecting: " #x)
>=20
> ...here.
>=20
> But that's trivial, if the maintainer would like to correct the commit
> message.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
>=20
> --=20
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>=20




--=20

---------------------------------------------------------------------------=
---
my GPG Public Key:                 https://files.grapentin.org/.gpg/public.=
key
---------------------------------------------------------------------------=
---

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEv6gAioJlZ3BjsRv0cXGYbkt0VTYFAljIOKgACgkQcXGYbkt0
VTZlegf+LGR+KOHWD5Rg8q8N1eQFZXgVeigpLJdN18HU8aJfuos1AFFpp+mv+lRE
Otm57KyPui3/qKa21Z9fx5m22ClgU+9vOfkBtCVE7/FaicQwOr6Fc9VuZVMli3S4
Gw43jqXwgJvSELklHrzWfiqsey+NvYtqqTMZavB6Py9U1aRJYlmJuh11lxgmIaJX
hYPLeobNfH/M4Y/1BcBM79otd3P7lsugPpdZZKsQ9+hIinFzegd4KFkZJcjKvQi/
sacmpxqXyTzhTjWObMwtHd091sdHU2YOb9zOOAN8jhpJwBxu6aBTT9vO+y4Vu46a
W+wglylLL33tjahB1IpK0I1l9YJjSw==
=w2Bj
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

