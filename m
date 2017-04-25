Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d32Q5-0004A8-6w
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2017 11:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47611)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1d30pn-0000GY-Fi
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1d30pk-0004WD-E4
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:48:51 -0400
Received: from mout.gmx.net ([212.227.15.15]:59019)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1d30pk-0004TN-3J; Tue, 25 Apr 2017 09:48:48 -0400
Received: from [192.168.1.2] ([185.58.161.191]) by mail.gmx.com (mrgmx001
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M0y8F-1c8AYD0AuN-00v4SD;
	Tue, 25 Apr 2017 15:48:46 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170425131828.22480-1-n54@gmx.com>
	<CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>
Date: Tue, 25 Apr 2017 15:50:46 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9aku9c902OxXrjs8oMtSGPxhXbQGCEsB0"
X-Provags-ID: V03:K0:z+OhP3KBj7oIAyuwq+JxzKOngRLzKWEWtTWHUqoWxj+5HQmITDU
	uffyn6MyMcZMT8RfcQpYFO/XatH4Gtwa5VfXko6gu02WCElQOVobZcqveRl5uXJ5wCmutAq
	JZuPiHKnE+f7wCPxg6SvN/PkwoznlW+cKcweh1PTEQyMr01zHt0vXE94akQ+XuqPXPD7hPu
	uBRldgyAdTJgusTEznL+g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lU6KTjwm7Bk=:TgfyBZbiAUGd23NV7m8rW2
	maEo6D688an7uQmXHWM5Is1trnXzbMUK1bYPA2DU0MHMK5dhzt6D1+0UIFGaUsffjoyUJl/Pg
	9XmHNISPrgcc+TBQrgX1iqiifNdpseze8Nd5pXAh0jnxudjvssuiXQ2UjPs806Uukh0qnqlv3
	5cTbDaZ5cAeCDCmOlk58zExIpcz+Kl76K2DsOstxujBvVZIjcqTuFcIcLFyDvlMKV8jZGqUcc
	A6ytE7y3COIs/5M0LJmWZsDrx6U2qhFvBytSwQ45lMluhrCcVOJ4hwx4k6q5HrDO2dXXLlHzv
	VdbnZ12GITweP1oU1RLoqpdLfMKMGStNZml1CenmLeRl87BtFrk+pbiiH1boBv64Fdj6oRosK
	99CPl+V22h6EG3AIqkO6tCRDzMnVZ7IqhGZ8XRABlASmCbLEoWj83aH8utOfk4JT2FCRsprTr
	PoQfnfh8Re6xb89r14hmsjN0sERjfMeRuFDBoTwZgPEliKuJFR0Pp/GM1hRbrrZNVEQvE7Cia
	6/l5i3xe1uha31p7Thnb6nMrol8FFnxVs8f/oHyAf5XR6V3gDObKf+sTkTltCbT23GYlfkYE6
	SyzxB5cUBvnMZXE8XhggdEfIcrMjY/kJ+Z/tviHF/j7eD+hbT3c4QuMW2vIYlIBnBHAKge575
	1TrOVZP0f6LLfC3V0a4mBNChdiNy1zQsgy8Ap0qmdJUC1M4EYcQRHlxjF8owr2tQ5maKEd5Ld
	bZ9mdVk81+/Li+vOuV7FvlNjTUmsqwrYbbplnEDU5X/prjfE5lwiHI7UFCg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.15
X-Mailman-Approved-At: Tue, 25 Apr 2017 11:30:23 -0400
Subject: Re: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
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
X-List-Received-Date: Tue, 25 Apr 2017 13:48:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9aku9c902OxXrjs8oMtSGPxhXbQGCEsB0
Content-Type: multipart/mixed; boundary="afnGq2E2IuWwlgnHB2VW8gkChulN35pxS";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>
Subject: Re: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
References: <20170425131828.22480-1-n54@gmx.com>
 <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
In-Reply-To: <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>

--afnGq2E2IuWwlgnHB2VW8gkChulN35pxS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.04.2017 15:33, Peter Maydell wrote:
> On 25 April 2017 at 14:18, Kamil Rytarowski <n54@gmx.com> wrote:
>> Appease pkgsrc and use portable shell variable comparison.
>> This switches "=3D=3D" to "=3D". It should not be a functional change.=

>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>> ---
>=20
> Thanks for this patch; it's an easy bug to let slip in
> if your /bin/sh happens to be bash.
>=20
> PS: you forgot to cc qemu-devel@ on this patch.
>=20

I assumed that qemu-trivial@ don't need to go to qemu-devel@. Thank you
for pointing it out.

>>  scripts/qemu-binfmt-conf.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh=

>> index 0f1aa63872..8afc3eb5bb 100755
>> --- a/scripts/qemu-binfmt-conf.sh
>> +++ b/scripts/qemu-binfmt-conf.sh
>> @@ -284,12 +284,12 @@ while true ; do
>>          shift
>>          # check given cpu is in the supported CPU list
>>          for cpu in ${qemu_target_list} ; do
>> -            if [ "$cpu" =3D=3D "$1" ] ; then
>> +            if [ "$cpu" =3D "$1" ] ; then
>>                  break
>>              fi
>>          done
>>
>> -        if [ "$cpu" =3D=3D "$1" ] ; then
>> +        if [ "$cpu" =3D "$1" ] ; then
>>              qemu_target_list=3D"$1"
>>          else
>>              echo "ERROR: unknown CPU \"$1\"" 1>&2
>> --
>> 2.12.2
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> thanks
> -- PMM
>=20



--afnGq2E2IuWwlgnHB2VW8gkChulN35pxS--

--9aku9c902OxXrjs8oMtSGPxhXbQGCEsB0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY/1Q2AAoJEEuzCOmwLnZsrWEP/iDVdXKf17n91y8hq0DqWpym
y1pfx5A5HZvbKjgDwTXK0xhgvym+69pRfLHuiRF6Icz2/Qa2niuUBn78lZACMEcm
hRtnftezW6rFdLQ8lwjCnnt7z1aEJSAqiIXbHM8xP/qUDn5GIQ1bme94/4RdGkPY
sKOjwYQYnvn0djPggM8I0+r1AUTMj75A/mdItq+ax54ndoGoGru0YuBY2sB1n+jc
UrcqQqDEeVeHY4rP4g1UthY5Gf4rCmzJU+4y44EOpBwQf7G9/mKYtZAnFdxbsMkV
zso9y5TA/78TzQnPXFuOL+16uEhsWahL/BzMFONg1nbMhP2b4sBcLLfR4MrOV6FN
pKaOMj2KEjCQX5tt51Nqkt3QQuXBfKRObnSCZSacadGnxWKicB/Fni45381C+bM0
3o4GNykkPnTax3ZphJ7lsl3mziyK4B+KCDXajx+tz1T7Jxs9R0reW1DCfqC6jNc4
Dsl0lxPmJfRLki4p0JUZA44QesfOqgpM38hyjXAg3v4MAsR7ATe7UsiXZO63DhcV
HvMOGFi2JcayicKDK8Sgz45oIQ6afjs5b6BPW+bvihrQ7+nDNLYBN0FciBsjyKCM
2MkYmPI4fftVp7FZHeq74qop24GzJ5Zl42OYe0PFUfWMVXzqO0zDJ/ynNGUu1V8S
wJ5mrAYbBEDK245RvKJY
=iTJj
-----END PGP SIGNATURE-----

--9aku9c902OxXrjs8oMtSGPxhXbQGCEsB0--

