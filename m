Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XLA-0004N7-9n
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:58:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XL3-0004E3-42
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XKx-0000hP-5B
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:58:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XKk-0000et-Rm; Sat, 01 Feb 2014 04:57:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1490740053;
	Sat,  1 Feb 2014 13:57:54 +0400 (MSK)
Message-ID: <52ECC522.6040406@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:57:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
References: <1390811181-21772-1-git-send-email-famz@redhat.com>
	<87wqhl8yep.fsf@linaro.org>
In-Reply-To: <87wqhl8yep.fsf@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore:
	Ignoretests/check-qom-interfacee
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2014 09:58:19 -0000

27.01.2014 15:20, Alex Benn=C3=A9e wrote:
> famz@redhat.com writes:
>=20
>> Signed-off-by: Fam Zheng <famz@redhat.com>
>> ---
>>  tests/.gitignore | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/.gitignore b/tests/.gitignore
>> index 1aed224..9ba9d96 100644
>> --- a/tests/.gitignore
>> +++ b/tests/.gitignore
>> @@ -4,6 +4,7 @@ check-qint
>>  check-qjson
>>  check-qlist
>>  check-qstring
>> +check-qom-interface
>>  test-aio
>>  test-bitops
>>  test-throttle

I've applied this change for now to trivial-patches queue.

> Are these generated test files? I've been looking at the tcg-tests and
> while architecture ones won't clash there are a bunch of generic linux
> tests that should probably be built one per target architecture. Should
> we just be building all test files in the per-target build directories
> like we do with qemu itself?

Or allow running whole testsuite in a separate directory.
This makes sense, but it is a much larger change, so for
now let's pick smaller changes which lets to build stuff
cleanly.

Thanks,

/mjt
>=20
> Cheers,
>=20
> --
> Alex Benn=C3=A9e
> QEMU/KVM Hacker for Linaro
>=20
>=20


