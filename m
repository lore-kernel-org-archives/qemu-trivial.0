Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGMOi-0006uj-Sy
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 06:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fGMOg-0006tC-1s
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 06:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fGMOf-000716-3g
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 06:32:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58642 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fGMOZ-0006qO-OQ; Wed, 09 May 2018 06:32:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9604406802F;
	Wed,  9 May 2018 10:32:26 +0000 (UTC)
Received: from [10.36.116.204] (ovpn-116-204.ams2.redhat.com [10.36.116.204])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD81D1EB1;
	Wed,  9 May 2018 10:32:20 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
References: <20180418075045.27393-1-olaf@aepfle.de>
	<41df38a4-dc02-7c17-4877-26541fddd209@redhat.com>
	<d058d5e6-710b-2f34-9828-9ddde18069a1@redhat.com>
	<20180509074434.23de9dab.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e823b03a-7269-7b43-99cb-6b734f5105db@redhat.com>
Date: Wed, 9 May 2018 12:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180509074434.23de9dab.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="n6Orlz0luk8fBsPrdZI5HD37hUyeMmbmL"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 10:32:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 10:32:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: recognize
 more rpmbuild macros
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
X-List-Received-Date: Wed, 09 May 2018 10:32:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n6Orlz0luk8fBsPrdZI5HD37hUyeMmbmL
Content-Type: multipart/mixed; boundary="LaEHG2st1bDJq2ZfLRnuHuZJy1RNEInOn";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <e823b03a-7269-7b43-99cb-6b734f5105db@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1] configure: recognize more rpmbuild macros
References: <20180418075045.27393-1-olaf@aepfle.de>
 <41df38a4-dc02-7c17-4877-26541fddd209@redhat.com>
 <d058d5e6-710b-2f34-9828-9ddde18069a1@redhat.com>
 <20180509074434.23de9dab.olaf@aepfle.de>
In-Reply-To: <20180509074434.23de9dab.olaf@aepfle.de>

--LaEHG2st1bDJq2ZfLRnuHuZJy1RNEInOn
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/05/2018 07:44, Olaf Hering wrote:
> Am Wed, 9 May 2018 00:15:42 +0200
> schrieb Paolo Bonzini <pbonzini@redhat.com>:
>=20
>> Actually, --program-prefix=3D and --exec-prefix=3D have a meaning, the=
y
>> cannot just be ignored.  For now I've removed this line; what is the
>> exact incantation used by SUSE Linux?
>=20
> Like in every other rpm.rpm I guess:
>=20
> /usr/lib/rpm/macros:%_exec_prefix               %{_prefix}
> /usr/lib/rpm/macros:    --program-prefix=3D%{?_program_prefix} \\\
> /usr/lib/rpm/macros:    --exec-prefix=3D%{_exec_prefix} \\\
>=20
> Are you saying your %configure is different from my %configure?
> In any case, qemu has to tolerate both options.

I agree that it's a worthwhile improvement but it also has to fail if
use an argument other than the default (or implement them, which I'm
probably not advising here).  Otherwise packaging breaks if someone for
whatever reason overrides the %_program_prefix and %_exec_prefix macros.

Paolo


--LaEHG2st1bDJq2ZfLRnuHuZJy1RNEInOn--

--n6Orlz0luk8fBsPrdZI5HD37hUyeMmbmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAlryzjAACgkQv/vSX3jH
roN66Af+PP2rpTKeAtkkai2+rNwOxrt62UJcJyfWKFWPB4Ggq3SbFhBKNHO62xgP
xTVWAS6bGI5/5LCa8FziBbaPjza/UtU5FQGOnLjLonK0qS+03T0da+RXF7EkYCIA
O7mO2INRFi4xaAYYY9VvRSR/JF3ykRqvGuSR14Y1YgmIBstxjRQ8BNSSlr58+tER
VoC+nMOBH6VmIK2dwNGls1G+dYiZkTqbx8uWvGgLUrfziwZUjccB05SkxFbaXy2K
ZrHRgznc6Hp6fUyIUVAnMZHn4rwOWPg535Pbjks9hLSUPDn+JrDFOKy5tMmGGGOR
VZbitER70jN9rwEg1q0bSIakRu5WiA==
=OcrH
-----END PGP SIGNATURE-----

--n6Orlz0luk8fBsPrdZI5HD37hUyeMmbmL--

