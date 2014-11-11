Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo6Vb-0006t2-KX
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 03:09:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo6VT-0006g2-Ex
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 03:09:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo6VH-00029e-J0
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 03:08:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xo6V3-00026x-Ca; Tue, 11 Nov 2014 03:08:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BF43941CA0;
	Tue, 11 Nov 2014 11:08:27 +0300 (MSK)
Message-ID: <5461C3FB.9090209@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 11:08:27 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Willem Pinckaers <willem_qemu@lekkertech.net>
References: <545D935F.3070300@lekkertech.net>
	<CAFEAcA8gyg=jjbJ0v4iRx+1aTDWFQWFNGwXXa49LZ_WWSA76_Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8gyg=jjbJ0v4iRx+1aTDWFQWFNGwXXa49LZ_WWSA76_Q@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine-sigaltstack:
 Change jmp_buf to sigjmp_buf
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
X-List-Received-Date: Tue, 11 Nov 2014 08:09:02 -0000

Applied to -trivial, adding Peter's comment.

Thanks,

/mjt

