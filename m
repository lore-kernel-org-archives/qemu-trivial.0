Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WesUz-0000o1-0G
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 16:50:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WesUs-0000as-0H
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 16:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WesUm-0001aa-Hf
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 16:49:53 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=55725
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WesUb-0001Yy-BN; Mon, 28 Apr 2014 16:49:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C5E5911822B5; Mon, 28 Apr 2014 22:49:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id eK7RtdewGx8r; Mon, 28 Apr 2014 22:49:24 +0200 (CEST)
Received: from [192.168.178.35] (p54AD86D3.dip0.t-ipconnect.de
	[84.173.134.211])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6C31D11822B4; Mon, 28 Apr 2014 22:49:24 +0200 (CEST)
Message-ID: <535EBED2.7030705@weilnetz.de>
Date: Mon, 28 Apr 2014 22:49:22 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1398713740-24446-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1398713740-24446-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] tests/tcg: Fix compilation of test_path
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
X-List-Received-Date: Mon, 28 Apr 2014 20:49:59 -0000

Am 28.04.2014 21:35, schrieb Peter Maydell:
> The test_path binary is (unlike the other test binaries in tests/tcg)
> actually intended to be compiled with the same compiler used to build
> the main QEMU executables. It actually #includes a number of the
> QEMU source files in an attempt to unit-test the util/path.c functions,
> and so if it is not compiled with the same compiler used by configure
> to set CONFIG_ settings then it is liable to fail to build.
> Fix the makefile to build it with CC, not CC_I386, and fix the test
> itself not to include a lot of unnecessary trace related source
> files which cause the build to fail if the trace backend is anything
> other than 'simple'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The particular build failure you usually hit is that CC is an
> x86-64 compiler supporting __int128_t whereas CC_I386 does not,
> and then the code in the headers using those types blows up.
> 
> The whole attempt to unit test by compiling bits of the .c files
> seems terribly fragile to me; this is the only test we have that
> does it, so if anybody has a better approach to testing these path.c
> functions I'd like to know.
> 
> Stefan, you added the trace .c files in commit 6d4adef48dd6bb but
> I can't work out why they're needed -- the test builds fine for
> me without them whether we configured using the default or simple
> backends, and it definitely doesn't compile if we used the default
> backend and the test includes the trace .c files...

Before my commit, a trace.c was included which was no longer available,
so I simply replaced it by its successor (which needed additional trace
.c files). I can confirm that removing those trace files also works.
That's of course a better solution.

Stefan




