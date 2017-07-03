Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dS0PX-0006HE-IR
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jul 2017 08:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dS0PU-0006FT-TC
	for qemu-trivial@nongnu.org; Mon, 03 Jul 2017 08:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dS0PR-0007rU-QW
	for qemu-trivial@nongnu.org; Mon, 03 Jul 2017 08:25:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dS0PH-0007mP-Ov; Mon, 03 Jul 2017 08:24:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AACC6FB9E;
	Mon,  3 Jul 2017 12:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AACC6FB9E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AACC6FB9E
Received: from [10.10.120.36] (ovpn-120-36.rdu2.redhat.com [10.10.120.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B585968D9D;
	Mon,  3 Jul 2017 12:24:33 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20170630195831.26087-1-eblake@redhat.com>
	<6ff70225-77c3-84ce-ada9-ce44192de608@redhat.com>
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e14abe31-3133-1e86-d5ea-fb0161058d88@redhat.com>
Date: Mon, 3 Jul 2017 07:24:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <6ff70225-77c3-84ce-ada9-ce44192de608@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QNUROahhEfOtO7a78cEORuUU4m6t66wGc"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Jul 2017 12:24:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] tests: Avoid non-portable 'echo -ARG'
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
X-List-Received-Date: Mon, 03 Jul 2017 12:25:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QNUROahhEfOtO7a78cEORuUU4m6t66wGc
Content-Type: multipart/mixed; boundary="nnIlV3cnVh6N8ciaUAcpeXCwkWo4FSxuk";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, stefanha@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <e14abe31-3133-1e86-d5ea-fb0161058d88@redhat.com>
Subject: Re: [PATCH v2] tests: Avoid non-portable 'echo -ARG'
References: <20170630195831.26087-1-eblake@redhat.com>
 <6ff70225-77c3-84ce-ada9-ce44192de608@redhat.com>
In-Reply-To: <6ff70225-77c3-84ce-ada9-ce44192de608@redhat.com>

--nnIlV3cnVh6N8ciaUAcpeXCwkWo4FSxuk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/02/2017 09:49 AM, Max Reitz wrote:
> On 2017-06-30 21:58, Eric Blake wrote:
>> POSIX says that backslashes in the arguments to 'echo', as well as
>> any use of 'echo -n' and 'echo -e', are non-portable; it recommends
>> people should favor 'printf' instead.  This is definitely true where
>> we do not control which shell is running (such as in makefile snippets=

>> or in documentation examples).  But even for scripts where we
>> require bash (and therefore, where echo does what we want by default),=

>> it is still possible to use 'shopt -s xpg_echo' to change bash's
>> behavior of echo.  And setting a good example never hurts when we are
>> not sure if a snippet will be copied from a bash-only script to a
>> general shell script (although I don't change the use of non-portable
>> \e for ESC when we know the running shell is bash).
>>
>> Replace 'echo -n "..."' with 'printf %s "..."', and 'echo -e "..."'
>> with 'printf %b "...\n"', with the optimization that the %s/%b
>> argument can be omitted if the string being printed contains no
>> substitutions that could result in '%' (trivial if there is no
>> $ or `, but also possible when using things like $ret that are
>> known to be numeric given the assignment to ret just above).
>=20
> Well, yes, possible, but it's no longer trivial... And just using '%s'
> or '%b' in these cases would make reading the code simpler, in my opini=
on.
>=20
> Sure, omitting it makes sense for constant format strings, but for
> variable the cost outweighs the benefit, in my opinion.
>=20
> (And since this is a bit supposed to go through qemu-trivial, it should=

> be trivial, right? :-))

I can spin up a v3 that adds more %s/%b anywhere a $ appears where the
variable being printed is not obviously assigned in the immediately
preceding context.


>> +++ b/tests/qemu-iotests/check
>=20
> [...]
>=20
>> @@ -281,9 +281,9 @@ do
>>          rm -f $seq.out.bad
>>          lasttime=3D`sed -n -e "/^$seq /s/.* //p" <$TIMESTAMP_FILE`
>>          if [ "X$lasttime" !=3D X ]; then
>> -                echo -n " ${lasttime}s ..."
>> +                printf " ${lasttime}s ..."
>=20
> You cannot prove this doesn't contain a %. In fact, I can very easily
> put a % into the timestamp file and let printf print it here.
>=20
> Sure, there shouldn't be one there, but on one hand it's still possible=

> and on the other, finding out that there shouldn't be a % there is very=

> much non-trivial.

Indeed, any variable whose contents are provided from the filesystem
rather than directly by the script are suspects for abuse. In a
testsuite, it's often feasible to assume that abuse is not happening,
but being robust doesn't hurt.

>> +++ b/tests/tcg/cris/Makefile
>> @@ -150,17 +150,17 @@ check_addcv17.tst: crtv10.o sysv10.o
>>  build: $(CRT) $(SYS) $(TESTCASES)
>>
>>  check: $(CRT) $(SYS) $(TESTCASES)
>> -	@echo -e "\nQEMU simulator."
>> +	@printf "\nQEMU simulator.\n"
>>  	for case in $(TESTCASES); do \
>> -		echo -n "$$case "; \
>> +		printf "$$case "; \
>=20
> This is another rather non-trivial case: Checking that this doesn't
> contain a % means reading through the whole list defining TESTCASES.

We'd be crazy to define TESTCASES with %, but I agree that the context
is not close, so being robust doesn't hurt.

Sounds like a v3 is coming up.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--nnIlV3cnVh6N8ciaUAcpeXCwkWo4FSxuk--

--QNUROahhEfOtO7a78cEORuUU4m6t66wGc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZWjd/AAoJEKeha0olJ0NqOPsH/04hyB8VLr1fBbxgdXyPYlUF
lTwEZmnnGpG9apLqbDXwb+BSY3481s84vrCTn+5oFIGvWEBxcw6IVVA1vhLTFKTF
CyD4D5EyLaQYDFRTIEV9YDQrW0MS3CEvEB7SnM9aBbTwcw8DAwNWBXN7pcG1PjHf
xJuuSE6Uwt1JyCc+JLURyFjaPp6bc+Hn5y0kIVeebzcElQZ3vBaxx3qvhlXDiUKm
0crW4nNeEV7rVKSK0YgFYOPOuACqKUjo9JJYs/+vhdEb2l0ve58dt8mRhFCt0ChS
tdR2L6LC3v3iuU1WGqJ0kPdwBgV7gpl3qyI3WTUZmn5kSJ3ssaAUrseGPqQyabY=
=vmBJ
-----END PGP SIGNATURE-----

--QNUROahhEfOtO7a78cEORuUU4m6t66wGc--

