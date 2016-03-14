Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afTGo-0005Ju-SE
	for mharc-qemu-trivial@gnu.org; Mon, 14 Mar 2016 10:14:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1afTGi-0005CX-6e
	for qemu-trivial@nongnu.org; Mon, 14 Mar 2016 10:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1afTGc-0004J9-K9
	for qemu-trivial@nongnu.org; Mon, 14 Mar 2016 10:14:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1afTGS-0004H0-Nw; Mon, 14 Mar 2016 10:14:32 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1338C3297;
	Mon, 14 Mar 2016 14:14:32 +0000 (UTC)
Received: from [10.3.113.142] (ovpn-113-142.phx2.redhat.com [10.3.113.142])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2EEEVMP000797; Mon, 14 Mar 2016 10:14:31 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	Mriyam Tamuli <mbtamuli@gmail.com>
References: <1457895376-22138-1-git-send-email-mbtamuli@gmail.com>
	<CAFEAcA_9H0txC8nPb2TuOWFK9Dxm4w26ZMmjpuuH9ZUTd=WHDQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56E6C747.10307@redhat.com>
Date: Mon, 14 Mar 2016 08:14:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9H0txC8nPb2TuOWFK9Dxm4w26ZMmjpuuH9ZUTd=WHDQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="V7tJ6f8WgwRDq8KrafOVsDFPr1X7c21gW"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] address_space: replaced
	function calls
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
X-List-Received-Date: Mon, 14 Mar 2016 14:14:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--V7tJ6f8WgwRDq8KrafOVsDFPr1X7c21gW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/13/2016 01:10 PM, Peter Maydell wrote:
> On 13 March 2016 at 18:56, Mriyam Tamuli <mbtamuli@gmail.com> wrote:
>> replaced calls named cpu_physical_memory_* with address_space_*
>>
>> cpus.c
>> cputlb.c
>> disas.c
>> exec.c
>> ---
>>  cpus.c   |  2 +-
>>  cputlb.c |  8 ++++----
>>  disas.c  |  2 +-
>>  exec.c   | 60 ++++++++++++++++++++++++++++++-------------------------=
-----
>>  4 files changed, 36 insertions(+), 36 deletions(-)
>>
>> diff --git a/cpus.c b/cpus.c
>> index bc774e2..d73cd7b 100644
>> --- a/cpus.c
>> +++ b/cpus.c
>> @@ -1662,7 +1662,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, co=
nst char *filename,
>>          l =3D sizeof(buf);
>>          if (l > size)
>>              l =3D size;
>> -        cpu_physical_memory_read(addr, buf, l);
>> +        address_space_read(addr, buf, l);
>=20
> address_space_read() takes five arguments, not three -- surely
> this change won't compile?

Also, sending 5 identically-titled patches is poor form; it makes life
harder for backporting.  Please make sure all 5 patches have different
subject lines, with proper threading (each message in-reply-to the 0/5
cover letter, rather than its own top-level thread).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--V7tJ6f8WgwRDq8KrafOVsDFPr1X7c21gW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW5sdHAAoJEKeha0olJ0NqPCYIAJsD36XdgeG3HF5rMW3BWfQz
Huewumf/82p4Y6BCahxgyPJzBdVeKA0oT0jwxrTwxRKL0wCLa97areZdMeCTFQEK
gplB/HjMds3LULhZSTqCH9aOegKTzOOOHa30Y9E9i0bjoIysmzcGNMskc5nOJ4Si
xxNw9YxwOLu3M5FdWRb2T+6DOPKebVc56CsDMjdu1DxozFf9oU/MViILAd1Py6dw
Un1w8lj4vf8c02UWe3Whb8kFyweZga58sqJE6hyctlMnjDXsGdztMYvlmb5DAWH0
uKoeg3ozK3SMmcERttD3lSdNLJO3wQdk9IaJoOuKAmOrEzXsetdKlha8thsyQkI=
=nPXJ
-----END PGP SIGNATURE-----

--V7tJ6f8WgwRDq8KrafOVsDFPr1X7c21gW--

