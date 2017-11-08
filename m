Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCUMi-0003If-LQ
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 12:42:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCUMg-0003H4-HR
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:42:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCUMf-0003Xq-I3
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:42:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCUMZ-0003WD-Eo; Wed, 08 Nov 2017 12:42:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 810755D688;
	Wed,  8 Nov 2017 17:42:06 +0000 (UTC)
Received: from [10.10.125.14] (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 342935C737;
	Wed,  8 Nov 2017 17:42:02 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20171107223708.17935-1-eblake@redhat.com>
	<20171108154226.GC6118@stefanha-x1.localdomain>
	<462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
	<061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
	<20171108173621.GB8403@stefanha-x1.localdomain>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, qemu-trivial@nongnu.org, Kevin Wolf
	<kwolf@redhat.com>, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <34d8f43a-483a-fb2d-13b3-994d0a67f464@redhat.com>
Date: Wed, 8 Nov 2017 11:42:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108173621.GB8403@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ew6eqX2AKd9niUbLCdtr1egiGbMQxTGtJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 08 Nov 2017 17:42:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine: Fix
 documentation of co_aio_sleep_ns()
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
X-List-Received-Date: Wed, 08 Nov 2017 17:42:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ew6eqX2AKd9niUbLCdtr1egiGbMQxTGtJ
Content-Type: multipart/mixed; boundary="itJ3UlR9V8M0drUso7qEepUckA8RpCtjU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-trivial@nongnu.org, Kevin Wolf
 <kwolf@redhat.com>, qemu-devel@nongnu.org
Message-ID: <34d8f43a-483a-fb2d-13b3-994d0a67f464@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] coroutine: Fix documentation of
 co_aio_sleep_ns()
References: <20171107223708.17935-1-eblake@redhat.com>
 <20171108154226.GC6118@stefanha-x1.localdomain>
 <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
 <061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
 <20171108173621.GB8403@stefanha-x1.localdomain>
In-Reply-To: <20171108173621.GB8403@stefanha-x1.localdomain>

--itJ3UlR9V8M0drUso7qEepUckA8RpCtjU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/08/2017 11:36 AM, Stefan Hajnoczi wrote:

>> This function uses timers and hence needs to know the event loop
>> (#AioContext) to place the timer on.  After the time elapses, the
>> current coroutine will restart with the same #AioContext it is current=
ly
>> running in, even if that is different than the timer context passed to=

>> co_aio_sleep_ns().
>=20
> These complicated semantics are a clue that the API should be
> simplified.  QEMU has changed since this function was first introduced.=

> Now we can do the following:
>=20
>   void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
>   {
>       AioContext *ctx =3D qemu_get_current_aio_context();
>       CoSleepCB sleep_cb =3D {
>           .co =3D qemu_coroutine_self(),
>       };
>       sleep_cb.ts =3D aio_timer_new(ctx, type, SCALE_NS, co_sleep_cb, &=
sleep_cb);
>       timer_mod(sleep_cb.ts, qemu_clock_get_ns(type) + ns);
>       qemu_coroutine_yield();
>       timer_del(sleep_cb.ts);
>       timer_free(sleep_cb.ts);
>   }
>=20
> I don't see a reason for the caller to pass in an AioContext.
>=20
> Any objections?  Will send a patch if this is okay.

Makes sense to me.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--itJ3UlR9V8M0drUso7qEepUckA8RpCtjU--

--ew6eqX2AKd9niUbLCdtr1egiGbMQxTGtJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloDQekACgkQp6FrSiUn
Q2qy6Af/RIB0a/WZ3VRjJkFzMdrgFL93ZTIIlPEDSCHlGlxncgXU3W1QkO51/1sa
Mo6BcTELjLTEPlg3j+2Cvh4sJBSaZbiGZXwr92ojKFqasbSoDaoAeb7J6vVFH3O7
kb1CyVYibzpb/ERzfIyB4hyNrF3MU+Ji85EKZs/4bdrMxXbbsJezzR1Y7evehaND
Uuaz6iz8NgAuMmsOLSOa7ANKdWmfUNQrNo6Lxb6b5rT/FKQjeq6oh2wX+rcJ/hBz
MVHAqJ0VTqpkIwVKhVcE9BTO4LW3Tf2zOmEHVO2/20yl7bUvYBf2ruVaaWu57+S/
ZQnq9MpCKgGU9hKmuK4pO+pYXoy7LQ==
=6wcQ
-----END PGP SIGNATURE-----

--ew6eqX2AKd9niUbLCdtr1egiGbMQxTGtJ--

