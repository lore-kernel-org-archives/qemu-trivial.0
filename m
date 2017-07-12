Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVI7m-00087P-3F
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVI7j-00085N-Hw
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVI7i-0000fs-Gb
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:56:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVI7f-0000eR-Ps; Wed, 12 Jul 2017 09:56:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D9F45F7B6;
	Wed, 12 Jul 2017 13:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9D9F45F7B6
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9D9F45F7B6
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8032760841;
	Wed, 12 Jul 2017 13:56:06 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20170609152017.7286-1-eblake@redhat.com>
	<1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, armbru@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <15dc487a-c340-e407-a7b0-b7159a5a49a2@redhat.com>
Date: Wed, 12 Jul 2017 08:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="04bNNjAeuEo5TLUJvU8fircCO5HfmaEVM"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 12 Jul 2017 13:56:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 0/2] qobject coccinelle followups
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
X-List-Received-Date: Wed, 12 Jul 2017 13:56:16 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--04bNNjAeuEo5TLUJvU8fircCO5HfmaEVM
Content-Type: multipart/mixed; boundary="rMqAU5C8k0QEWDGi0eid6fw4eCfBGkq8C";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, armbru@redhat.com
Message-ID: <15dc487a-c340-e407-a7b0-b7159a5a49a2@redhat.com>
Subject: Re: [PATCH 0/2] qobject coccinelle followups
References: <20170609152017.7286-1-eblake@redhat.com>
 <1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>
In-Reply-To: <1298d3b1-a6d6-499b-323b-b79c6e38bc7b@msgid.tls.msk.ru>

--rMqAU5C8k0QEWDGi0eid6fw4eCfBGkq8C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/12/2017 08:35 AM, Michael Tokarev wrote:
> 09.06.2017 18:20, Eric Blake wrote:
>> Inspired by https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg0=
2505.html
>>
>> Surprisingly, the updated script didn't find any existing longhand
>> use as candidates for QDECREF() (our last such use was cleaned up
>> as a side effect, in commit b72fe9e), but it DID find another straggle=
r
>> missed in commit 579cf1d1.
>>
>> Eric Blake (2):
>>   qobject: Update coccinelle script to catch Q{INC,DEC}REF
>>   qobject: Catch another straggler for use of qdict_put_str()
>=20
> Applied to -trivial, thanks!

Markus has taken v2 of these patches through his qapi-next tree:
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05589.html

so you can drop this v1 from -trivial

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--rMqAU5C8k0QEWDGi0eid6fw4eCfBGkq8C--

--04bNNjAeuEo5TLUJvU8fircCO5HfmaEVM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZip1AAoJEKeha0olJ0Nq8poH/RFOTX5SVP0jvziqSIgO9GK6
SoLpxNhiPKCZxkHJQmYKEijURIrCLtmv4evX1aw+tM+5ur6FuaGpO9nSHWiftQir
60jai8Lnclae4BGFRkM0thw872GThRYraZuDgwzfRSlM1ZKIlFJxVhK/VDGu3705
xAshIE35ykVLMcBbI3f/ZnY54LUjvIx9m6YjtfKz6C5Q8+9ZD4lUqTBTUgo2XeE9
SEQBJbGe8KCUJl456F9jhR0EMCL/vPQDcUhU5RTUWy/ZIfiH9Ef5KmxpVNhfKui+
XohePHZFgfvY/yIXPQyPnhY+ijY0XPWrmBZj9x5hQa1zVtDHt7yS2xyzubXegKc=
=3ct3
-----END PGP SIGNATURE-----

--04bNNjAeuEo5TLUJvU8fircCO5HfmaEVM--

