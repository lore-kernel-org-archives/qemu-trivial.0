Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQkd4-0005ga-HN
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 22:26:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQkd2-0005fK-Dx
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQkd1-0001mB-AE
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 22:26:20 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:45068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQkcv-0001h8-Ie; Wed, 06 Jun 2018 22:26:13 -0400
Received: by mail-ua0-x243.google.com with SMTP id k14-v6so5425131uao.12;
	Wed, 06 Jun 2018 19:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=bGIbdgOM5Qcpv8ee8Wy5NFCD+6kUC1QsBy9zQJJ7j1k=;
	b=WKnOW0ef4Yo9C5iP8trK6W8QG8hKrlm9s898tiWd/p+u8uJTUC9Wlxsq2k6w6vUoGd
	M7SWn4ZqD+SoCVDoF33sRwk+xPq+VJisDR7roriBB65brpCOrftkdW/hnSIobddlLtxx
	zHahWM+hewuMo4vXo6FwsBIzbyfIAxizzYg8xOL56AwCSwswakidG9ayZO7O3QTV4Pw6
	J24ENx4JEwU6C3SaiA9xbreCvIxaBaMbjwYrFtiURMHKWtsVLyfkYnOrPADbjq2bDzsT
	37kScQbGm97Wyue4pCH3Anq0nPnU3hfxhPf7re4C+QsHQccdXjr6PQK6MKb0AztcnKIa
	fpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=bGIbdgOM5Qcpv8ee8Wy5NFCD+6kUC1QsBy9zQJJ7j1k=;
	b=b9jHFrZChug1t25psCjXIRwEJZ1n/+d0bI9LldFjhHrUZbrKNZR08Gg3rZZAK6nubW
	LepmUvwhD+r07epCOyJoByursrQPh/EEMDtGrZN8NBZNM7kvVPIzgpKRKuaqCx0eXT8B
	jBniDskuPAPyMD5upvjdR4VcTadt25sEkRp2MNkEHsr5rCoRSTcYBsdaWeZBaVcHN6aL
	S6PSZj2BPFC633RsGQLZSIKGLzTHXYm8u/+ITvdK3VhYwHJSxJ77UhfP+BC8GHSYqHyF
	fcB8KjosDhPBTitDUCCI2bdn80uN6SVaIqlxtDgkz79exXDBlvOX6Gk0gHpbokznJrmD
	8alw==
X-Gm-Message-State: APt69E1IeU47T32kFvyPuIM3RGRO0+qPtyZmkZA/HI6CzmD2NUa27x9p
	EXv+aFjBMrfq6KTjxFRw/JDpkeJj
X-Google-Smtp-Source: ADUXVKI+MMgIAHcUvXx02s/nJxzexN6smkg4gFJVa556GGl72JVEEA70wj4jawS89vX8FFpl+Pb4Ug==
X-Received: by 2002:ab0:d94:: with SMTP id i20-v6mr3809276uak.67.1528338372729;
	Wed, 06 Jun 2018 19:26:12 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h19-v6sm1613021vke.15.2018.06.06.19.26.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 19:26:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-5-f4bug@amsat.org>
	<20180607021658.GB3166@umbus.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6dd6bc7b-739d-0824-644c-36f3e7d6056b@amsat.org>
Date: Wed, 6 Jun 2018 23:26:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180607021658.GB3166@umbus.fritz.box>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="8au7FAvUjXr7iuYnGmfCaATqAYtjROO7R"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-trivial] [PATCH 04/11] ppc/pnv: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Thu, 07 Jun 2018 02:26:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8au7FAvUjXr7iuYnGmfCaATqAYtjROO7R
Content-Type: multipart/mixed; boundary="LIR31PhSGEezLE3NmTjWlieaDUlubRDTk";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <6dd6bc7b-739d-0824-644c-36f3e7d6056b@amsat.org>
Subject: Re: [PATCH 04/11] ppc/pnv: Add trailing '\n' to qemu_log() calls
References: <20180606152128.449-1-f4bug@amsat.org>
 <20180606152128.449-5-f4bug@amsat.org>
 <20180607021658.GB3166@umbus.fritz.box>
In-Reply-To: <20180607021658.GB3166@umbus.fritz.box>

--LIR31PhSGEezLE3NmTjWlieaDUlubRDTk
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/06/2018 11:16 PM, David Gibson wrote:
> On Wed, Jun 06, 2018 at 12:21:21PM -0300, Philippe Mathieu-Daud=E9 wrot=
e:
>> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> I'm not really sure what series this was part of, but I've applied it
> to ppc-for-3.0 anyway.

I did an effort to split the series, then add all the recipients to the
cover but I missed your mail indeed, sorry!

here is the cover:
http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01266.html

Thanks!

>=20
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>=20
>> ---
>>  hw/ppc/pnv_core.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
>> index cbb64ad9e7..13ad7d9e04 100644
>> --- a/hw/ppc/pnv_core.c
>> +++ b/hw/ppc/pnv_core.c
>> @@ -97,7 +97,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, hw=
addr addr,
>>          val =3D 0x24f000000000000ull;
>>          break;
>>      default:
>> -        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=3D0x%" HWADDR_=
PRIx,
>> +        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=3D0x%" HWADDR_=
PRIx "\n",
>>                    addr);
>>      }
>> =20
>> @@ -107,7 +107,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, =
hwaddr addr,
>>  static void pnv_core_xscom_write(void *opaque, hwaddr addr, uint64_t =
val,
>>                                   unsigned int width)
>>  {
>> -    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=3D0x%" HWADDR_P=
RIx,
>> +    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=3D0x%" HWADDR_P=
RIx "\n",
>>                    addr);
>>  }
>> =20
>=20


--LIR31PhSGEezLE3NmTjWlieaDUlubRDTk--

--8au7FAvUjXr7iuYnGmfCaATqAYtjROO7R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlsYl78ACgkQ4+MsLN6t
wN51SRAAwZLVBTOkFWqyol3YmxtzWVHBNrM9xmxaum1iDhk8vHBNZSzkPk/Znev2
TmkIfyBhr2Xkh1sU4nXTv0ZxnHIirQL4vMreihjQ24gEkedwqjuNn6qUJbZBaJSZ
cST9fNXlNqyrroZKrWQ1ZwlMDGCcjQg8/sSP1PLzq0kG1we8QXBX7ZNbZqXly8s3
6tCmSZBcioT+jmFz7wyMLAmh6Y6iPyWC1A8zKPjpUOYSY/zBWcPcGxrsY1s53i5Z
ajeo0TNWzlLdYmiaO2jBav7qNHFZRKT3NRc+KBHcurSM6Hh8BjocfUU4i7rgMe7w
Ea8wiF/9fsT0xyIYIVEn28OXxpGgaxTSLPrM9qGmuvGPysrhj5s6W+Ki17Re2cYI
aJz8R6xzpi4pb3o+M1BErbVH0Gf/ApgKVwkOXIZ+0dcRVUdOZqZdtiwMAXtIL7GE
qIIReWd1GNI9kH4yvvldp/NsKlPRDbkvWuae/K4JhMClS/TrRpiP6rrthhI27XEJ
/Ho0NOCsbsO8mB05LsQWzqI3hCCnYa9YTVS4EfBCdoS4z1PAwLU9I/8byht3Qk5X
GVmVU46TfHmRarfHeVFDXkfED6QdwP7bS/yd0yp6chG3aNWr88jgOJ2vEiJqmmnW
lDTF3Hcffel4XhsUu9JA3R37kpJtousARUGu1RDRLZcLzm1cHI4=
=Pi7U
-----END PGP SIGNATURE-----

--8au7FAvUjXr7iuYnGmfCaATqAYtjROO7R--

