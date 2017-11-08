Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCUP0-00059Z-Bb
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 12:44:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCUOx-00057H-HX
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCUOw-0004WL-IJ
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:44:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eCUOq-0004TN-6u; Wed, 08 Nov 2017 12:44:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE65C04AC5B;
	Wed,  8 Nov 2017 17:44:27 +0000 (UTC)
Received: from [10.36.117.248] (ovpn-117-248.ams2.redhat.com [10.36.117.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 537D3600D2;
	Wed,  8 Nov 2017 17:44:19 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@gmail.com>, Eric Blake <eblake@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20171107223708.17935-1-eblake@redhat.com>
	<20171108154226.GC6118@stefanha-x1.localdomain>
	<462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
	<061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
	<20171108173621.GB8403@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9cee36dc-1e2a-c459-2748-ba8b2a1466e8@redhat.com>
Date: Wed, 8 Nov 2017 18:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108173621.GB8403@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hebPesP0tI7RGqGHGRgKR3fQbk9hvC8qF"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Nov 2017 17:44:27 +0000 (UTC)
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
X-List-Received-Date: Wed, 08 Nov 2017 17:44:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hebPesP0tI7RGqGHGRgKR3fQbk9hvC8qF
Content-Type: multipart/mixed; boundary="oIKR8WBR4EbbfnjneFxGMLIbreBi5ACMt";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Eric Blake <eblake@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Message-ID: <9cee36dc-1e2a-c459-2748-ba8b2a1466e8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] coroutine: Fix documentation of
 co_aio_sleep_ns()
References: <20171107223708.17935-1-eblake@redhat.com>
 <20171108154226.GC6118@stefanha-x1.localdomain>
 <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
 <061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
 <20171108173621.GB8403@stefanha-x1.localdomain>
In-Reply-To: <20171108173621.GB8403@stefanha-x1.localdomain>

--oIKR8WBR4EbbfnjneFxGMLIbreBi5ACMt
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/11/2017 18:36, Stefan Hajnoczi wrote:
> On Wed, Nov 08, 2017 at 09:57:47AM -0600, Eric Blake wrote:
>> On 11/08/2017 09:47 AM, Paolo Bonzini wrote:
>>> On 08/11/2017 16:42, Stefan Hajnoczi wrote:
>>>>> In any case, co_aio_sleep_ns()
>>>>> + * does not affect the #AioContext where the current coroutine is =
running,
>>>>> + * as the coroutine will restart on the same #AioContext that it i=
s
>>>>> + * running on.
>>>> I cannot parse the second sentence.  What does "affecting" an AioCon=
text
>>>> mean?  Does "where the current coroutine is running" simply mean "th=
e
>>>> caller"?
>>>>
>>>> What is it trying to say?  My guess is: the caller will be resumed i=
n
>>>> the current AioContext, not the timer's AioContext.
>>>
>>> Yes, that is the intended meaning.  Perhaps just s/current//.
>>
>> How about:
>>
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

That should work, yes.

Paolo

>=20
> Any objections?  Will send a patch if this is okay.
>=20
> Stefan
>=20



--oIKR8WBR4EbbfnjneFxGMLIbreBi5ACMt--

--hebPesP0tI7RGqGHGRgKR3fQbk9hvC8qF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAloDQmkACgkQv/vSX3jH
roNGCgf8C05DLd0tEvhz7mKbo1n1q99RCD4Po7/1JGVnMU421YvNnRsDOrJABaR3
7PNV4WvvOaxTatPL9kAtwkGgOOg2NgkNjt7lxeLB2YNPzrq7y4ul1ycfQ5YdCe7l
XRpRU2b857N0t4wAwFgkDF/Px/9+rh3nov733tw3h8Qpl8EuRy2L2NMRDUgl2Hih
sp2Ko726TeFjv6B/0dUx6ev++XyYQaB8O4z60ad+E9ImgRExF3g49vJC5br9Dbi3
2NGn/4Qcj2Rqs0wOWmV3uNLShoK1ZIcH5VnPGvH60DKfTJAxXNipjoZacnjPKdKK
d5pjggmFsv8/MJmmCYLNmItnYLfQNg==
=UXfe
-----END PGP SIGNATURE-----

--hebPesP0tI7RGqGHGRgKR3fQbk9hvC8qF--

