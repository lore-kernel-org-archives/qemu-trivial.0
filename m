Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d89ZF-0002jC-OV
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 14:09:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d89ZD-0002gc-LY
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 14:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d89ZC-0004I4-Go
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 14:08:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d89Z7-0004Cq-Nz; Tue, 09 May 2017 14:08:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B438CC059735;
	Tue,  9 May 2017 18:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B438CC059735
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B438CC059735
Received: from [10.10.123.147] (ovpn-123-147.rdu2.redhat.com [10.10.123.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5345118A54;
	Tue,  9 May 2017 18:08:51 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
	<20170508173031.GK22428@stefanha-x1.localdomain>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <ec4c60eb-2c7d-6d5d-6a5e-2aef6883878a@redhat.com>
Date: Tue, 9 May 2017 13:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170508173031.GK22428@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Lrn3JdvMjexatrauoL31tM7XRr147IrXb"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 09 May 2017 18:08:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
 2017-05-07
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
X-List-Received-Date: Tue, 09 May 2017 18:09:00 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lrn3JdvMjexatrauoL31tM7XRr147IrXb
Content-Type: multipart/mixed; boundary="KHOGoAuKg5ooJg6pc08R6wOqFDh4oCV8b";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <ec4c60eb-2c7d-6d5d-6a5e-2aef6883878a@redhat.com>
Subject: Re: [Qemu-devel] [PULL 00/23] Trivial patches for 2017-05-07
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
 <20170508173031.GK22428@stefanha-x1.localdomain>
In-Reply-To: <20170508173031.GK22428@stefanha-x1.localdomain>

--KHOGoAuKg5ooJg6pc08R6wOqFDh4oCV8b
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/08/2017 12:30 PM, Stefan Hajnoczi wrote:
> On Sun, May 07, 2017 at 10:02:03AM +0300, Michael Tokarev wrote:
>> The following changes since commit 12a95f320a36ef66f724a49bb05e4fb553a=
c5dbe:
>>
>>   Merge remote-tracking branch 'kwolf/tags/for-upstream' into staging =
(2017-05-04 13:44:32 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>>
>> for you to fetch changes up to 311875781e549af91a3216d34c6ef40420bab43=
5:
>>
>>   tests: Remove redundant assignment (2017-05-07 09:57:51 +0300)
>>
>> ----------------------------------------------------------------
>> trivial patches for 2017-05-07
>>

>> sochin.jiang fix wrong parameter comments in channel-file.h (1):
>>       channel-file: fix wrong parameter comments

See my question on 11/23

>=20
> Thanks, applied to my staging tree:
> https://github.com/stefanha/qemu/commits/staging

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KHOGoAuKg5ooJg6pc08R6wOqFDh4oCV8b--

--Lrn3JdvMjexatrauoL31tM7XRr147IrXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEgWyAAoJEKeha0olJ0Nqk+MH/2mFYCXfDurHRon3C3SGpef9
uGgGE4HHYOCOkgiScFondStJZA/hWzHbnf0AGgEpfFuyOHANsSj+ZtkKIXsD3gkf
jhtGEYMViZVzCXIPtsXtEoWUaTrjT6lJ3lRtpLcayl91+oNw9qdGMcLY+rce0L0b
FaqQpWcYaqg6awcXiReWb+AlxpAqpASEVVruH53kI6pZQYemFntqbEsD8wqhBMl3
IUlEl64i+p3Xf+JiPxHZCsX5abZLAx+XEfD7Flxi/UUZNsCw093ynJqXuZW7gGSU
Y3XiJD+Axs/SovHpUs37bmK4ZjYpEsmCeF3b5MeoIaO3PL1kOpzwaqUxSQjNh/E=
=rrd4
-----END PGP SIGNATURE-----

--Lrn3JdvMjexatrauoL31tM7XRr147IrXb--

