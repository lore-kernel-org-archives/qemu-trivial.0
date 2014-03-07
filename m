Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLuhL-0001cI-0h
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 08:20:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WLuhC-0001Fh-2l
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 08:20:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WLuh6-0005rR-3f
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 08:20:14 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:57489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WLugf-0005HJ-Ct; Fri, 07 Mar 2014 08:19:41 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2C63E72800C8; Fri,  7 Mar 2014 14:19:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id LmP23RCViR7E; Fri,  7 Mar 2014 14:19:38 +0100 (CET)
Received: from [192.168.178.35] (p54AD87DD.dip0.t-ipconnect.de
	[84.173.135.221])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7E33872800C7; Fri,  7 Mar 2014 14:19:37 +0100 (CET)
Message-ID: <5319C768.2000903@weilnetz.de>
Date: Fri, 07 Mar 2014 14:19:36 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>	<871tyecixy.fsf@linaro.org>	<5319BE2C.7040801@weilnetz.de>
	<5319C21A.6010705@suse.de>
In-Reply-To: <5319C21A.6010705@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
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
X-List-Received-Date: Fri, 07 Mar 2014 13:20:20 -0000

Am 07.03.2014 13:56, schrieb Andreas F=C3=A4rber:
> Am 07.03.2014 13:40, schrieb Stefan Weil:
>> Am 07.03.2014 13:06, schrieb Alex Benn=C3=A9e:
>>>
>>> Stefan Weil <sw@weilnetz.de> writes:
>>>
>>>> 'make test' is broken at least since commit
>>>> baacf04799ace72a9c735dd9306a1ceaf305e7cf. Several source files were =
moved
>>>> to util/, and some of them there split, so add the missing prefix an=
d new
>>>> files to fix the compiler and linker errors.
> [...]
>> In the meantime I tried older versions. Even version 1.1 already shows
>> unwanted differences between native and QEMU emulated FPU operations.
>>
>> The test binary is now available from this URL:
>> http://qemu.weilnetz.de/test/user/i386/test-i386
>>
>> Run it native and with qemu-i386 and compare the output of both runs
>> to see the problems.
>=20
> So... is QEMU or the test mistaken? :)
>=20
> Regards,
> Andreas


Hi Andreas,

test-i386 does some calculations and prints the results (see source code
tests/tcg/test-i386.c). If the user mode emulation of QEMU works, it
should not matter whether that executable runs native or emulated and
both outputs be identical. They aren't - that's why I think we have a
TCG problem to solve.

Regards
Stefan



