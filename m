Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dagvW-0001di-DY
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 07:25:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dagvT-0001bu-Tv
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dagvT-0004RX-1I
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:25:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dagvM-0004Jc-43; Thu, 27 Jul 2017 07:25:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D839D7DD05;
	Thu, 27 Jul 2017 11:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D839D7DD05
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 185DC5D961;
	Thu, 27 Jul 2017 11:25:43 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-5-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <517a5beb-b272-e114-3626-ba81be919a04@redhat.com>
Date: Thu, 27 Jul 2017 06:25:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-5-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="NUQpvC4p68Vc82UwueII3bOcL2FXiIS5P"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Jul 2017 11:25:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 04/20] nbd: fix memory leak
 in nbd_opt_go()
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
X-List-Received-Date: Thu, 27 Jul 2017 11:25:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NUQpvC4p68Vc82UwueII3bOcL2FXiIS5P
Content-Type: multipart/mixed; boundary="j1lIcLGm0u4EHxX4tKUbKED9nG71Pi8kB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <517a5beb-b272-e114-3626-ba81be919a04@redhat.com>
Subject: Re: [PATCH for 2.10 v2 04/20] nbd: fix memory leak in nbd_opt_go()
References: <20170727024224.22900-1-f4bug@amsat.org>
 <20170727024224.22900-5-f4bug@amsat.org>
In-Reply-To: <20170727024224.22900-5-f4bug@amsat.org>

--j1lIcLGm0u4EHxX4tKUbKED9nG71Pi8kB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/26/2017 09:42 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> nbd/client.c:385:12: warning: Potential leak of memory pointed to by 'b=
uf'
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/client.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Thanks; queued on my NBD branch for rc1:
git://repo.or.cz/qemu/ericb.git nbd

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--j1lIcLGm0u4EHxX4tKUbKED9nG71Pi8kB--

--NUQpvC4p68Vc82UwueII3bOcL2FXiIS5P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll5zbcACgkQp6FrSiUn
Q2pyRwgApuowZHXwntXwABVa0VQ8KbL4Xu2RM2lh0Fs49MW7V0s7JSveKh1x6ETi
e2fH+ELEN5QXeW1Q7RI130MvnYjHcBPFVfKXtnA1sb5TIDZ0an1zJdq3VqWq7/d8
/EQm9yJivnZOhFVJb6VwiOJiZfwoNgjrZFB6wqbALt1/4YccSVtu0Tk6jQ+b2s5S
3TUUXEp3r7/Vf81PBrhDJ9vnLpFB4bgN+V77+SsngOQt4LgTX7Oap+wE8PiGEGv3
kekKltZ8eWNx+DkNBz911PsTxUGxj21udt/U6iP9EStzlXWbX9Cpd93jcro9qgoL
Hj+jl+vLT3SgIkSJSkt3cMCi+ZtHUw==
=Ms6W
-----END PGP SIGNATURE-----

--NUQpvC4p68Vc82UwueII3bOcL2FXiIS5P--

