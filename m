Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d30vN-0002bx-Ai
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2017 09:54:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d30vL-0002aC-5r
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d30vK-0007aE-Al
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d30vF-0007ZZ-Ma; Tue, 25 Apr 2017 09:54:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AD72680E0;
	Tue, 25 Apr 2017 13:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6AD72680E0
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6AD72680E0
Received: from [10.10.123.177] (ovpn-123-177.rdu2.redhat.com [10.10.123.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2ADD19E8B;
	Tue, 25 Apr 2017 13:54:27 +0000 (UTC)
To: Kamil Rytarowski <n54@gmx.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170425131828.22480-1-n54@gmx.com>
	<CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
	<f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <0855b5b6-0aab-7f3a-33ce-8f289de3454f@redhat.com>
Date: Tue, 25 Apr 2017 08:54:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4evGgwtJrnws3rRlg0tD9A6RkwExOBHew"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 25 Apr 2017 13:54:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
 scripts/qemu-binfmt-conf.sh: Fix shell portability issue
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
X-List-Received-Date: Tue, 25 Apr 2017 13:54:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4evGgwtJrnws3rRlg0tD9A6RkwExOBHew
Content-Type: multipart/mixed; boundary="teL4vEMoBRMvOqut1LbFxeUBSLETDqcFp";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <0855b5b6-0aab-7f3a-33ce-8f289de3454f@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh:
 Fix shell portability issue
References: <20170425131828.22480-1-n54@gmx.com>
 <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
 <f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>
In-Reply-To: <f4837473-2112-fe0c-862c-ae4b77dc0bc8@gmx.com>

--teL4vEMoBRMvOqut1LbFxeUBSLETDqcFp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/25/2017 08:50 AM, Kamil Rytarowski wrote:
> On 25.04.2017 15:33, Peter Maydell wrote:
>> On 25 April 2017 at 14:18, Kamil Rytarowski <n54@gmx.com> wrote:
>>> Appease pkgsrc and use portable shell variable comparison.
>>> This switches "=3D=3D" to "=3D". It should not be a functional change=
=2E
>>>
>>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>>> ---
>>
>> Thanks for this patch; it's an easy bug to let slip in
>> if your /bin/sh happens to be bash.
>>
>> PS: you forgot to cc qemu-devel@ on this patch.
>>
>=20
> I assumed that qemu-trivial@ don't need to go to qemu-devel@. Thank you=

> for pointing it out.

ALL patches need to go to qemu-devel (so we have a one-stop-shop for all
pending patches), but some patches need to additionally go to secondary
lists for catching the attention of the right maintainers.

scripts/get_maintainer.pl is your friend, and it should always list
qemu-devel in its answer.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--teL4vEMoBRMvOqut1LbFxeUBSLETDqcFp--

--4evGgwtJrnws3rRlg0tD9A6RkwExOBHew
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY/1UTAAoJEKeha0olJ0NqIr4H/A/rkuxPp7StqgIaniTwDk+y
6kMEHIu8wW/rCogMtWzyxziK5CM9fwpEGw/hyoHTRENUS0lTboWdtGqhiKLmFtrM
DgedUfB78d5IIv8lbNvWJrSUIa0JMz+Rybc8DUqMy7wxerRAfybVGzGitxrh6R1s
Lm+A0RpLXi1iOUWhCOI7RDvTtZFEMUCR+3s2gFjsw7TZ266pxiEwgg6OkxzpRoUr
BbCBC/nyo97tDn41qPhLc+Q9sJr91Y0740bQ1/N57JIH2PDrccdkfYwQFF2WCIpf
Z7N61y2zSKFzLrM+Fo6tG5z/AwAl1PDMGoqi9QTxnRu8fJe74iwDvTnEcqAScsw=
=t4d+
-----END PGP SIGNATURE-----

--4evGgwtJrnws3rRlg0tD9A6RkwExOBHew--

