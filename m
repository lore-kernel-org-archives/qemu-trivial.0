Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yno9y-0002ZA-IK
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 09:05:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yno9s-0002Wa-1s
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yno9n-0003Gx-A9
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:05:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yno9d-0003F4-CG; Thu, 30 Apr 2015 09:05:25 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B9674176F;
	Thu, 30 Apr 2015 16:05:24 +0300 (MSK)
Message-ID: <55422893.9000504@msgid.tls.msk.ru>
Date: Thu, 30 Apr 2015 16:05:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
In-Reply-To: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL 00/42] Trivial patches for 2015-04-30
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
X-List-Received-Date: Thu, 30 Apr 2015 13:05:45 -0000

30.04.2015 15:58, Peter Maydell wrote:
[]
> Hi. I'm afraid this fails to build the tests on OSX:
>   CC    tests/i440fx-test.o
> /Users/pm215/src/qemu/tests/i440fx-test.c:229:21: warning: implicit declaration
>       of function 'ARRAY_SIZE' is invalid in C99

So much for trivial ;)

Let's remove this one and add another tiny dead code removal patch
instead, which went in meanwhile, to complete half-removal of unused
functions.  I'll resend another pull request in a moment.

Thanks,  and sorry for the noize.  I wanted to verify if this array_size
definition is really unnecessary here but something distracted me.

/mjt

