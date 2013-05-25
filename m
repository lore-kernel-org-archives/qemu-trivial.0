Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgAhU-0004PJ-1p
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 05:23:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAhM-0004Ie-L1
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAhF-0003bl-WE
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:23:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UgAh1-0003OO-59; Sat, 25 May 2013 05:23:15 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 48A444197A;
	Sat, 25 May 2013 13:23:14 +0400 (MSK)
Message-ID: <51A08301.7010903@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 13:23:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Voevodin <e.voevodin@samsung.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Remove unnecessary break statements
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
X-List-Received-Date: Sat, 25 May 2013 09:23:42 -0000

24.05.2013 14:19, Stefan Weil wrote:
> Fix these warnings from cppcheck:

Thanks, applied to the trivial patches tree.

/mjt

