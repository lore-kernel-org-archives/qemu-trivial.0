Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVUG-0003ob-W9
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 04:40:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVU9-0003eK-5b
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVU3-0004bV-2H
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:39:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVTq-0004ZK-IG; Sat, 03 May 2014 04:39:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D96AA4027E;
	Sat,  3 May 2014 12:39:33 +0400 (MSK)
Message-ID: <5364AB45.9010106@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 12:39:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1398769764-25493-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1398769764-25493-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] tests/tcg: Fix compilation of
	test_path
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
X-List-Received-Date: Sat, 03 May 2014 08:39:59 -0000

29.04.2014 15:09, Peter Maydell wrote:
> The test_path binary is (unlike the other test binaries in tests/tcg)
> actually intended to be compiled with the same compiler used to build
> the main QEMU executables. It actually #includes a number of the
> QEMU source files in an attempt to unit-test the util/path.c functions,
> and so if it is not compiled with the same compiler used by configure
> to set CONFIG_ settings then it is liable to fail to build.
> Fix the makefile to build it with the default C compiler rules, not
> CC_I386, and fix the test itself not to include a lot of unnecessary
> trace related source files which cause the build to fail if the trace
> backend is anything other than 'simple'.

Yay, ACK!

Applies to -trivial, thank you!

/mjt

