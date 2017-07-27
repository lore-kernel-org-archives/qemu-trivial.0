Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dah5J-0006ZB-8X
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 07:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dah5H-0006XV-Fd
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dah5E-000506-PE
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 07:36:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dah5C-0004um-93; Thu, 27 Jul 2017 07:35:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40BCB40250;
	Thu, 27 Jul 2017 11:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 40BCB40250
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F98C6F43A;
	Thu, 27 Jul 2017 11:35:56 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
	qemu-devel@nongnu.org
References: <1501150174-19431-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d4584a14-ff65-b10e-03bf-417235065e9f@redhat.com>
Date: Thu, 27 Jul 2017 06:35:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501150174-19431-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6TuasVrtnB22bbDeHU3rK7WS0CgJaj5Ac"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 27 Jul 2017 11:35:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Improve the
 NetBSD regex pattern
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
X-List-Received-Date: Thu, 27 Jul 2017 11:36:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6TuasVrtnB22bbDeHU3rK7WS0CgJaj5Ac
Content-Type: multipart/mixed; boundary="wIiRsr7IRw9KsVb8lenLDSWQ1TQcncWGi";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <d4584a14-ff65-b10e-03bf-417235065e9f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Improve the NetBSD regex
 pattern
References: <1501150174-19431-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1501150174-19431-1-git-send-email-thuth@redhat.com>

--wIiRsr7IRw9KsVb8lenLDSWQ1TQcncWGi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/27/2017 05:09 AM, Thomas Huth wrote:
> Currently get_maintainers.pl claims that the configure script is
> maintained by Kamil:
>=20
>  $ scripts/get_maintainer.pl -f configure
>  Kamil Rytarowski <kamil@netbsd.org> (maintainer:NETBSD)
>  qemu-devel@nongnu.org (open list:All patches CC here)
>=20
> This happens because the regex pattern for the NETBSD entry triggers
> on everything that contains the keyword "NetBSD". Ease the situation
> a little bit by restricting this to "Subject:" lines only, like
> we do it in the "trivial patches" section already.
>=20
> Reported-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--wIiRsr7IRw9KsVb8lenLDSWQ1TQcncWGi--

--6TuasVrtnB22bbDeHU3rK7WS0CgJaj5Ac
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll50BsACgkQp6FrSiUn
Q2qqJAf9FS2sI0TSPaGTrd60ak2KGGiA3sbdOm01Cjgbc1kXJOWZt5ZU89J+0N40
wZTSpX62m7iDZion6ijpMQokKulQYg9p/324GtQPF116k7gorY/BksWv69j7EDAT
lnK8+TXg9GgnbiCBpvduZtITe8k2elW4RKq86qPdsvMPK+ryLmKTeeQ+oztxOZna
FUM5y+XQ4Zm5OgspRh3NjAxvNvKjStxTUnMNDnmu3yEqJkdcl6agd8PqdiF+FHmQ
uXSIyimHnQHADrS0gQXOuy4Uxzy2mRMy3PE7SL1790Z8MNdcG1YdV+vOx9bZ13Hx
or1+Kw1JBeUR0k0wgudJnkeLye5WiQ==
=DVq4
-----END PGP SIGNATURE-----

--6TuasVrtnB22bbDeHU3rK7WS0CgJaj5Ac--

