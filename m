Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJM1Z-00061r-0j
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJM1T-0005z1-M2
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJM1N-0007VW-Po
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:40:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJM1H-0007TN-M7; Fri, 09 Jun 2017 11:40:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B43F13AA1;
	Fri,  9 Jun 2017 15:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6B43F13AA1
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6B43F13AA1
Received: from [10.10.121.94] (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD2C187BE;
	Fri,  9 Jun 2017 15:40:13 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	qemu-devel@nongnu.org
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-2-eblake@redhat.com>
	<CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f502b8ea-a3b0-1c9c-0c55-5a8b9cdecda6@redhat.com>
Date: Fri, 9 Jun 2017 10:40:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="T1gWRGVnUhhsaOO3Ugom6cXJBMJIMT7us"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Jun 2017 15:40:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qobject: Update
 coccinelle script to catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:40:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T1gWRGVnUhhsaOO3Ugom6cXJBMJIMT7us
Content-Type: multipart/mixed; boundary="wSL6oIjfchUiKJxIvsnuCLTVifT24fKq6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Message-ID: <f502b8ea-a3b0-1c9c-0c55-5a8b9cdecda6@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] qobject: Update coccinelle script to
 catch Q{INC, DEC}REF
References: <20170609152017.7286-1-eblake@redhat.com>
 <20170609152017.7286-2-eblake@redhat.com>
 <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>

--wSL6oIjfchUiKJxIvsnuCLTVifT24fKq6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/09/2017 10:28 AM, Marc-Andr=C3=A9 Lureau wrote:

> sadly, coccinelle is unabarebly slow on my machine,

Odd.  It's pretty fast for this series:

$ time spatch --sp-file scripts/coccinelle/qobject.cocci \
  --macro-file scripts/cocci-macro-file.h --dir . --in-place 2>/dev/null

real	0m2.136s
user	0m2.003s
sys	0m0.125s

This is on Fedora 25.  Although I _will_ grant that the time taken is
also dependent on the complexity of the script it is running on (some
scripts are inherently slower than others, and coccinelle takes
shortcuts like grepping for which files to even fully analyze, but not
all scripts are conducive to those shortcuts).

> not easy to grasp, and
> thereby fails to catch a lot of cases..

I agree with the 'not easy to grasp'. As for not catching cases, you
HAVE to use the --macro-file scripts/cocci-macro-file.h to avoid a lot
of skipped files.  But even so, you're probably right that it still
misses some things (although it often catches far more than "grep in
anger" is able to do).

> I am looking at alternative from
> clang tools/lib, by curiosity.

I'll be interested to see if it produces any (easy-to-reproduce) cleanup
results.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--wSL6oIjfchUiKJxIvsnuCLTVifT24fKq6--

--T1gWRGVnUhhsaOO3Ugom6cXJBMJIMT7us
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZOsFcAAoJEKeha0olJ0Nqk6IH/2M4NC88AqHgkSIsbxkUP6Fx
6tdfffI/T6fgN0H7gNB6q9UI8xlUHaOlefFCsNrmyCNP9EebajutF5fPVuovNA0W
pNjIlNjJ/81bkgo85CXE8ZTi73Hpec3oUy15Mgs/3abkaPu2/w9Ve9grha/AnUzX
m4Sb1iezld/rdEnTsIEH6C8hOSvRgVeox/IPdAmctYmSDLqJZxK4Spk8jmuB+AQN
EnAnHcYB9kDhQ28TSYqikpeMbjROiKhW2kr624OKk/o6WqIaohQAmFG6ipQ0bMN+
ax0zP+ur/SAZ0Z6Xu2pDzY2k92MikypZo0y7/dsz0R6fYzyXc6m/gkJ8Qus6X4M=
=/tyD
-----END PGP SIGNATURE-----

--T1gWRGVnUhhsaOO3Ugom6cXJBMJIMT7us--

