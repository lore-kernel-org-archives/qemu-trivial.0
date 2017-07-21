Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYWxq-0007ma-FI
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 08:23:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYWxo-0007lZ-Vr
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 08:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYWxo-0000sn-3x
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 08:23:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYWxi-0000qB-Nv; Fri, 21 Jul 2017 08:23:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C114883BC;
	Fri, 21 Jul 2017 12:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8C114883BC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8C114883BC
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B502060F84;
	Fri, 21 Jul 2017 12:23:16 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
	<b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
	<CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <dabe4865-05a0-eb85-f9db-8948db3e14bf@redhat.com>
Date: Fri, 21 Jul 2017 07:23:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4X6gfLNI5Ubw6XR5RQI7IBswIsFgokxjR"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 21 Jul 2017 12:23:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 4/4]
 bsd-user/main.c: Fix unused variable warning
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
X-List-Received-Date: Fri, 21 Jul 2017 12:23:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4X6gfLNI5Ubw6XR5RQI7IBswIsFgokxjR
Content-Type: multipart/mixed; boundary="mQ95rteVBJNwGoBolW900eEn8GgpKuIXB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Message-ID: <dabe4865-05a0-eb85-f9db-8948db3e14bf@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10 4/4] bsd-user/main.c: Fix unused
 variable warning
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
 <1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
 <b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
 <CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
In-Reply-To: <CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>

--mQ95rteVBJNwGoBolW900eEn8GgpKuIXB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/19/2017 03:19 AM, Peter Maydell wrote:
> On 18 July 2017 at 23:01, Eric Blake <eblake@redhat.com> wrote:
>> On 07/18/2017 11:26 AM, Peter Maydell wrote:
>>> On OpenBSD the compiler warns:
>>> bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wu=
nused-but-set-variable]
>>>
>>> This is because a lot of the signal delivery code is #if-0'd
>>> out as unused. Reshuffle #ifdefs a bit to silence the warning.
>>
>> Why not just nuke the #if 0 code instead (we can always 'git revert' i=
t
>> later as a starting point for someone that wants to implement it).
>=20
> I went for the minimal change, especially given we know
> that the freebsd folks have a big patchset on top of
> us fixing a lot of bsd-user code and it didn't seem worth
> giving them a more awkward rebase task.

Perhaps worth mentioning in the commit message that keeping the #if 0 is
intentional, then. At any rate,

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--mQ95rteVBJNwGoBolW900eEn8GgpKuIXB--

--4X6gfLNI5Ubw6XR5RQI7IBswIsFgokxjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllx8jQACgkQp6FrSiUn
Q2pn1gf/eDSlDieGM6x0aZfLbzw/FBk3Dc6pDothmIG+46rKJ2s1bQL1s9agTjyC
a1pxqzX3guJhH1gPoJJS8DHxrQkl13WdbXBucVUIzfN7laH6fRtHZs49Wx/5xB7p
HjBqzKM6S/V5Kz6E98xPK6txYGGfmPwQ9Gq0kaqVYK3T1en8Cx8EFl1/M3qEfuId
24fAjT8ojZSomDlMQhb5YFcWDbzTOsgs7aSQ17Z1qhi6uzVwCsZfKslAe7UtxBVM
Hf76+/FGkZr7ol25yviqwZtCPoixWEqc2LOXigozzDiA4EyCwx8D+ci9XYIZh3Pg
Ho+aJBauctMAiY6vveiSk4pcNBOAUA==
=f0Em
-----END PGP SIGNATURE-----

--4X6gfLNI5Ubw6XR5RQI7IBswIsFgokxjR--

