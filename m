Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIp7A-0002zs-FI
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 00:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIp75-0002xV-7j
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 00:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIp74-0003L6-8f
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 00:32:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53675)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIp6y-0003JO-Qd; Thu, 08 Jun 2017 00:31:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8ABBC19C32C;
	Thu,  8 Jun 2017 04:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8ABBC19C32C
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8ABBC19C32C
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 391BD8C7F1;
	Thu,  8 Jun 2017 04:31:52 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1496862674-23626-1-git-send-email-thuth@redhat.com>
	<df973d1f-cbb1-22c1-5763-f29001a16fd8@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <41c49a06-d8ce-ebd5-8956-2e6e1f010c36@redhat.com>
Date: Thu, 8 Jun 2017 06:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <df973d1f-cbb1-22c1-5763-f29001a16fd8@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="dGLupwaRi0R5qaVpbaklkpq3x7lhN4Uxc"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 08 Jun 2017 04:31:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Do not generate
 files if "configure" has not been run yet
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
X-List-Received-Date: Thu, 08 Jun 2017 04:32:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dGLupwaRi0R5qaVpbaklkpq3x7lhN4Uxc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07.06.2017 22:59, Eric Blake wrote:
> On 06/07/2017 02:11 PM, Thomas Huth wrote:
>> When doing a "make -j10" in the vanilla QEMU source tree (without
>> running "configure first), the Makefile currently generates two
>=20
> s/"configure/"configure"/
>=20
>> files already, qemu-version.h and qemu-options.def. This should not
>> happen, so let's make these targets depend on config-host.mak.
>> Also the python files can not be executed without $(PYTHON), so
>> these scripts should depend on config-host.mak, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  Makefile | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index c830d7a..6786dc2 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -286,7 +286,7 @@ endif
>> =20
>>  all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules
>> =20
>> -qemu-version.h: FORCE
>> +qemu-version.h: config-host.mak FORCE
>=20
> This one makes sense.
>=20
>> @@ -393,6 +394,8 @@ gen-out-type =3D $(subst .,-,$(suffix $@))
>> =20
>>  qapi-py =3D $(SRC_PATH)/scripts/qapi.py $(SRC_PATH)/scripts/ordereddi=
ct.py
>> =20
>> +$(qapi-py): config-host.mak
>=20
> But this one is weird. How can a pre-existing file have a dependency?
> Remember, $(qapi-py) is not the list of built files, but the list of
> files used to build other files.  It seems like you either want
> config-host.mak includes in $(qapi-py), or...
>=20
>> +
>>  qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types=
=2Eh :\
>>  $(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(=
qapi-py)
>=20
> ...that THIS should be the rule that depends on config-host.mak in
> addition do depending on $(qapi-py).

Yes, it's all those targets that use $(PYTHON) which should depend on
config-host.mak instead. But there are lots of them, and all of them
depend on $(qapi-py) already, so it seemed simpler to make $(qapy-py)
depend on config-host.mak instead of adding that dependency to all those
targets ... but maybe that's too confusing in the long run, so I'll add
it to those targets instead.

 Thomas


--dGLupwaRi0R5qaVpbaklkpq3x7lhN4Uxc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJZONM2AAoJEC7Z13T+cC212a0QAJPQoyQDASit4KgDe3JhL7l/
NPmNIu3wAi85KS+E3YYJpiKM4Y2TUE7W8MajLwiMJnC8jlDQvQGbnsFuAASnqPCa
/uoS+EQp3wNRQ4XbA3lkIufHdIGKUTWhlzIoML2A6nCcVTxuL0B+Wum+sCGNGAPI
HVknAbYMFi+GfhYVNDCwQk42am6HLOYdfgQqJMjkLvQZxb2Pe7BLaeXIo3mXrgIf
tlYJ0QxvW4PAuDSMlfcH1PsobTX3o0ss56PjOGIq+uILkIpiAqiVRL8N7uUL8r5g
ISHs2tt6vxDN7jLz1nTIhPCVP/Oe+Bnd9OVcsBasrwtSeF9QGqqfAZs71f+CabQb
qiOZcM1ybmw2ZY1JQ8SbYS7zGNmNJ3+i2NA1JiCDyzVez8Kf6uq/Khpl+rSsFzwy
ae1ZmN4NnfUPIp7SRnJIW/2naJhT4tYlWnewRpjCtaOWr9w0VOGvKEfqv1B3vJwf
W5hnSfxbBWRnf7rLFE/5xjIgmdx8m0KA/y8bLL+I8Ew8z3nMVQTeevtxFOWliUCb
7ZR0z4Pq2/gYKHMbzC4Eb7wkg5ZsFiaybdRu7eeRbd+ovID45TC5Cp1NaDIOOJyk
GTDtmzjtn3vNCQYB2QwV8Exsp372xMFSH8u6iU8dNXGFUIH5okhuvyay6ZTtm7aj
E+Q9c5ETQS0oiYdLSv2M
=HVmM
-----END PGP SIGNATURE-----

--dGLupwaRi0R5qaVpbaklkpq3x7lhN4Uxc--

