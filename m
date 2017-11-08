Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCRaM-0004PW-Mc
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 09:44:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eCRaF-0004KN-Ki
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 09:44:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eCRaE-0002dv-Ii
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 09:44:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eCRa8-0002bG-Fa; Wed, 08 Nov 2017 09:43:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B0FF25C2C;
	Wed,  8 Nov 2017 14:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5B0FF25C2C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=stefanha@redhat.com
Received: from localhost (ovpn-116-145.ams2.redhat.com [10.36.116.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9536E60BE3;
	Wed,  8 Nov 2017 14:43:52 +0000 (UTC)
Date: Wed, 8 Nov 2017 14:43:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20171108144351.GB6118@stefanha-x1.localdomain>
References: <20171108032052.20029-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <20171108032052.20029-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 08 Nov 2017 14:43:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Makefile: simpler/faster "make help"
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
X-List-Received-Date: Wed, 08 Nov 2017 14:44:09 -0000


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 12:20:52AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Using obscure black magic introduced in eaa2ddbb767 :)
>=20
> In an out-of-tree directory, running "../configure && make help" will gen=
erate
> some required files (.mak), then clone some submodules, compile at least
> the capstone submodule, generate QMP and Trace files, and finally display
> the help.
>=20
> On an outdated computer (Sun Blade workstation), running "make help" took
> more than 5h :) With this patch it took roughly 37min.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaAxgnAAoJEJykq7OBq3PIdcUH/iZB2q2ZFqsXIQDGUwF6IFNG
sDQAATsZFoVU2AqmuITmKvpXUDKh1pGpA2CDaYKyWCf1q5G6BPt5ycqjKwVc33kC
9R62/ufUj1PxnLWW3CBXx6be/YJ5sdvITwWCTgPpMpJu+ghK8vHmimNvszkHgDh4
4gnptlb8DrH/EOZLJbaNtt5NePjAIooBlxZWc/07+iZgIR12CaHAMOZSyW2CzXnH
NYY6Aj8yPMiwospUSD+xqMJ9I5UuRTGnxN9gPV2dMdu7uypy7i8mGLBEiZ8KPIDY
dk63fS4503v8HDvLtZXNQ/IYrrjDcmusaA5bgaq6R00/Wt2C9ga4QLj1Kpv9ry4=
=AtsM
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

