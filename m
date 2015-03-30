Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcSL8-0003u5-4D
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2015 01:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YcSL5-0003qj-ND
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 01:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YcSL4-0001qf-LK
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 01:34:19 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:50806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YcSKz-0001pw-4s; Mon, 30 Mar 2015 01:34:13 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6E5B811810A8; Mon, 30 Mar 2015 07:34:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CvlLLOaYpiOk; Mon, 30 Mar 2015 07:33:59 +0200 (CEST)
Received: from [192.168.178.24] (p54AC85EB.dip0.t-ipconnect.de
	[84.172.133.235])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A81C31180041; Mon, 30 Mar 2015 07:33:59 +0200 (CEST)
Message-ID: <5518E047.5030303@weilnetz.de>
Date: Mon, 30 Mar 2015 07:33:59 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>, 
 "Emilio G. Cota" <cota@braap.org>
References: <5518742e.451f460a.1d9b.66ce@mx.google.com>
In-Reply-To: <5518742e.451f460a.1d9b.66ce@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: optimise memory layout
	of TCGTemp
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
X-List-Received-Date: Mon, 30 Mar 2015 05:34:20 -0000

Am 29.03.2015 um 23:52 schrieb Richard Henderson:
> On Mar 27, 2015 14:09, "Emilio G. Cota" <cota@braap.org> wrote:
>> On Fri, Mar 27, 2015 at 09:55:03 +0000, Alex Benn=C3=A9e wrote:
>>> Have you been able to measure any performance improvement with these =
new
>>> structures? In theory, if aligned with cache lines, performance shoul=
d
>>> improve but real numbers would be nice.
>> I haven't benchmarked anything, which makes me very uneasy. All
>> I've checked is that the system boots, and FWIW I appreciate no
>> difference in boot time.
> No decrease in boot time is good. We /know/ we're saving memory, after =
all.
>  =20
>> Is there a benchmark suite to test TCG changes?
> No, sorry.
>
>
> r~

Benchmarking TCG with QEMU's system emulation is nearly impossible
because operating systems usually contain lots of timer based operations.
The TCG interpreter for example is really slow, but a BIOS will boot
faster than expected with it.

The user mode emulation is much better for benchmarks.
Run some command line Linux application which mainly does
computations (not file i/o) using user mode emulation on Linux.
The OpenSSL package contains bntest which can be used
as a benchmark for TCG. Redirect all output to /dev/null when
you run it.

Binaries for i386 and x86_64 are available from
http://qemu.weilnetz.de/test/user/.

Stefan


