Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq5kK-0005Zu-MS
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:07:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5kI-0005T3-2M
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5kH-0001HI-5p
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:07:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq5kF-0001GG-5h; Fri, 21 Jun 2013 14:07:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9C7A541DCF;
	Fri, 21 Jun 2013 22:07:25 +0400 (MSK)
Message-ID: <51C4965C.8020003@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:07:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1371819617-27232-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1371819617-27232-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	patches@linaro.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] Makefile: pass include directives to dtc
 via CPPFLAGS, not CFLAGS
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
X-List-Received-Date: Fri, 21 Jun 2013 18:07:39 -0000

21.06.2013 17:00, Peter Maydell wrote:
> The dtc submodule's makefile expects -I include directives to be
> in CPPFLAGS, not CFLAGS. Getting this wrong meant that the include
> directive would not be applied when generating the dependency .d
> files. This in turn meant that we couldn't build libfdt when
> doing an out of tree build with clang. (gcc's dependency output
> is slightly different from clang in this situation so it happened
> to work.)

Thanks, applied to the trivial patches queue, should be in the todays
poll request.

/mjt

