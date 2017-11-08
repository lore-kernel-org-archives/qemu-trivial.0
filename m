Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCSjv-0001YG-0W
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 10:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCSjn-0001UB-6i
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:58:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCSjm-0006Gk-6w
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:57:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCSjg-0006EW-5Z; Wed, 08 Nov 2017 10:57:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA2A67EA89;
	Wed,  8 Nov 2017 15:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA2A67EA89
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.125.14] (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B32662499;
	Wed,  8 Nov 2017 15:57:48 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20171107223708.17935-1-eblake@redhat.com>
	<20171108154226.GC6118@stefanha-x1.localdomain>
	<462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
Date: Wed, 8 Nov 2017 09:57:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XWhurDJJjVkBGJtQIwdd5SAEiDpL1DFGm"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 08 Nov 2017 15:57:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] coroutine: Fix documentation of
 co_aio_sleep_ns()
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
X-List-Received-Date: Wed, 08 Nov 2017 15:58:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XWhurDJJjVkBGJtQIwdd5SAEiDpL1DFGm
Content-Type: multipart/mixed; boundary="kG5lfCKu7CjBc4BAx6dBjkBRvBxhQTCE8";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
Subject: Re: [PATCH] coroutine: Fix documentation of co_aio_sleep_ns()
References: <20171107223708.17935-1-eblake@redhat.com>
 <20171108154226.GC6118@stefanha-x1.localdomain>
 <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
In-Reply-To: <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>

--kG5lfCKu7CjBc4BAx6dBjkBRvBxhQTCE8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/08/2017 09:47 AM, Paolo Bonzini wrote:
> On 08/11/2017 16:42, Stefan Hajnoczi wrote:
>>> In any case, co_aio_sleep_ns()
>>> + * does not affect the #AioContext where the current coroutine is ru=
nning,
>>> + * as the coroutine will restart on the same #AioContext that it is
>>> + * running on.
>> I cannot parse the second sentence.  What does "affecting" an AioConte=
xt
>> mean?  Does "where the current coroutine is running" simply mean "the
>> caller"?
>>
>> What is it trying to say?  My guess is: the caller will be resumed in
>> the current AioContext, not the timer's AioContext.
>=20
> Yes, that is the intended meaning.  Perhaps just s/current//.

How about:

This function uses timers and hence needs to know the event loop
(#AioContext) to place the timer on.  After the time elapses, the
current coroutine will restart with the same #AioContext it is currently
running in, even if that is different than the timer context passed to
co_aio_sleep_ns().

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--kG5lfCKu7CjBc4BAx6dBjkBRvBxhQTCE8--

--XWhurDJJjVkBGJtQIwdd5SAEiDpL1DFGm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloDKXsACgkQp6FrSiUn
Q2pnagf/e+5853+j30Q9nocVlNGa9KU+ODUdaSeNrj2YZRDRUURM8oEn+TrYroF9
zesAUzPB5FS7C3bryJLdehpLtaQcjTWQrG40dDMeSILhpvIVkXqazrjHdA7tBabw
HyS+7JzQ0U5t+8qGsaRtLirKFn1jGwUGvQb/ZA7F2LBMmavK/5sn0Vx0SIvERwTe
t2vmfHW/nyYyzCxh0B0fDJlUyRwJx48OWULAHNuQxlnL9Ydjrj6cfdGb0ylZJFPY
nYsH883TB+/UrgKOgomLWi8jwW+BPmFYD0W4xC3iLpi6sZUyXjPEsMskNRgYKsjw
Da4yDU2+gftW5aUPLQ7Z7WklGdylsA==
=QJvt
-----END PGP SIGNATURE-----

--XWhurDJJjVkBGJtQIwdd5SAEiDpL1DFGm--

