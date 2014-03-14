Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUz5-0008Fk-3d
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:29:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUyx-000833-4R
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUyr-0004bv-5c
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:29:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOUyS-0004Z9-O3; Fri, 14 Mar 2014 12:28:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0C7D941C8B;
	Fri, 14 Mar 2014 20:28:44 +0400 (MSK)
Message-ID: <53232E3B.7070703@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:28:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tests: Fix 'make test' for i686 hosts
 (build regression)
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
X-List-Received-Date: Fri, 14 Mar 2014 16:29:21 -0000

07.03.2014 14:11, Stefan Weil wrote:
> 'make test' is broken at least since commit
> baacf04799ace72a9c735dd9306a1ceaf305e7cf. Several source files were moved
> to util/, and some of them there split, so add the missing prefix and new
> files to fix the compiler and linker errors.
> 
> There remain more issues, but these changes allow running the test on a
> Linux i686 host.

Thanks, applied to -trivial.

/mjt

