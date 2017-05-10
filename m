Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8XUO-0001DK-R7
	for mharc-qemu-trivial@gnu.org; Wed, 10 May 2017 15:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d8XUL-0001BI-Jp
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 15:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d8XUK-0007Du-T0
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 15:41:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d8XUE-0007DO-J0; Wed, 10 May 2017 15:41:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6644BC054C5F;
	Wed, 10 May 2017 19:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6644BC054C5F
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6644BC054C5F
Received: from [10.10.121.252] (ovpn-121-252.rdu2.redhat.com [10.10.121.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4DDC173B7;
	Wed, 10 May 2017 19:41:24 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Laurent Vivier <lvivier@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170506004106.3291-1-f4bug@amsat.org>
	<7f51d88d-0dea-5d64-7c6d-530365e29923@redhat.com>
	<f7193a8d-0086-d61c-b214-76c7f204d062@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <118e342f-4c48-5652-10e6-1d15e6a5537d@redhat.com>
Date: Wed, 10 May 2017 14:41:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <f7193a8d-0086-d61c-b214-76c7f204d062@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BDAf9VrTJOrwJlbLNF2fC47UJWIaq6n0n"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 10 May 2017 19:41:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fix compiler
 warnings (clang 5)
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
X-List-Received-Date: Wed, 10 May 2017 19:41:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BDAf9VrTJOrwJlbLNF2fC47UJWIaq6n0n
Content-Type: multipart/mixed; boundary="rbo0BhL8RIbwAHQWDqgkH98qOHp19OUne";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <118e342f-4c48-5652-10e6-1d15e6a5537d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] syscall: fix compiler warnings (clang 5)
References: <20170506004106.3291-1-f4bug@amsat.org>
 <7f51d88d-0dea-5d64-7c6d-530365e29923@redhat.com>
 <f7193a8d-0086-d61c-b214-76c7f204d062@amsat.org>
In-Reply-To: <f7193a8d-0086-d61c-b214-76c7f204d062@amsat.org>

--rbo0BhL8RIbwAHQWDqgkH98qOHp19OUne
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


>>
>> The "for" loop scans the structure to find the rt_dev field, and we
>> should always enter in the first "if", so "host_rt_dev_ptr" is always
>> set.
>=20
> It's better indeed, I'll use g_assert_nonnull() and resend.

Careful - we haven't yet resolved whether g_assert_nonnull() is safe to u=
se.
https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg05499.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--rbo0BhL8RIbwAHQWDqgkH98qOHp19OUne--

--BDAf9VrTJOrwJlbLNF2fC47UJWIaq6n0n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZE2zjAAoJEKeha0olJ0Nq8gAIAI+r+KaKMnRS4JeJglqjL/EQ
P/KetYrD9jGWB2Kq1hCM8xZ/ncQU5hx+g9xW88e0RA2sdZGrUkUpWm8nWGOvkaBM
9XOqRajTCOIwdHx4orQhgdUaRaBG3j7KyFAD3tz0ZXwDhM2c3vozzFgxmfKE8Wzs
71kyOwhxfjSxgDsYY2ieTRdM4fgQbq9PsTEarkC7TPa/lw7qbaovK2S9X3y3g0dx
i67cynyACM2VSrj+dBJErxo8MRigetzxK/cagE51ByS5IP8ILPtJQxRRXn7oUTc9
VtE1svq6y6XNzcTrTvPl2tf/3KiDwl3/w1QhrxVgyM0IB9foijbk2H3x15dWHQg=
=/JWl
-----END PGP SIGNATURE-----

--BDAf9VrTJOrwJlbLNF2fC47UJWIaq6n0n--

