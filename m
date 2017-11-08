Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCSZi-0007GC-1y
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 10:47:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCSZf-0007EM-7C
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:47:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCSZb-0001fT-GS
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:47:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47591)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eCSZV-0001bV-Cz; Wed, 08 Nov 2017 10:47:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FAA5C04AC5B;
	Wed,  8 Nov 2017 15:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5FAA5C04AC5B
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.248] (ovpn-117-248.ams2.redhat.com [10.36.117.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FF206F92A;
	Wed,  8 Nov 2017 15:47:15 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
References: <20171107223708.17935-1-eblake@redhat.com>
	<20171108154226.GC6118@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
Date: Wed, 8 Nov 2017 16:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108154226.GC6118@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="sMGnqX3Ew9k2dWCGjeECVUhMNjdM3DLUs"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 Nov 2017 15:47:20 +0000 (UTC)
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
X-List-Received-Date: Wed, 08 Nov 2017 15:47:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sMGnqX3Ew9k2dWCGjeECVUhMNjdM3DLUs
Content-Type: multipart/mixed; boundary="TFNA8JwMcmAkgITK42E2Wx0uJdrhb0uKo";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
Subject: Re: [PATCH] coroutine: Fix documentation of co_aio_sleep_ns()
References: <20171107223708.17935-1-eblake@redhat.com>
 <20171108154226.GC6118@stefanha-x1.localdomain>
In-Reply-To: <20171108154226.GC6118@stefanha-x1.localdomain>

--TFNA8JwMcmAkgITK42E2Wx0uJdrhb0uKo
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/11/2017 16:42, Stefan Hajnoczi wrote:
>> In any case, co_aio_sleep_ns()
>> + * does not affect the #AioContext where the current coroutine is run=
ning,
>> + * as the coroutine will restart on the same #AioContext that it is
>> + * running on.
> I cannot parse the second sentence.  What does "affecting" an AioContex=
t
> mean?  Does "where the current coroutine is running" simply mean "the
> caller"?
>=20
> What is it trying to say?  My guess is: the caller will be resumed in
> the current AioContext, not the timer's AioContext.

Yes, that is the intended meaning.  Perhaps just s/current//.

Paolo


--TFNA8JwMcmAkgITK42E2Wx0uJdrhb0uKo--

--sMGnqX3Ew9k2dWCGjeECVUhMNjdM3DLUs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAloDJvsACgkQv/vSX3jH
roOD3Af/dmH9U/CPUsg3NCKAzBi15Dut8Uo0oJTj8SfQdTT5M621BvodVRsgPUye
zG0Mo1RER8OQdJ/1kkgsTE1NL2vVmnNzAPooP7HvwGMZPA5x4PhykTqccHeg5JeD
V51Sf/qCR7XMLRiY9FZpyV/FjYf1w85E7Eoa6LWRMG9BU4Y/l+qr3sm8ujBEaYF6
CuQe/i1Adc4KQnNPdiHEb+LuhFrSWt8EuNIbBSNrN4iJEjauPgklz1xmUuFtp8xh
JBakBDXx109a/d40kkjrCOpty4PS6+isheM0Z9ibQnpM/N/+fePmNCIAck5IXsjW
9nzX33/lJgfekO564IlGrusjaVKRJQ==
=NnXs
-----END PGP SIGNATURE-----

--sMGnqX3Ew9k2dWCGjeECVUhMNjdM3DLUs--

