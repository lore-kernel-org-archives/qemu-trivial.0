Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2ypM-00058w-O2
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:22:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2ypK-00054l-5W
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2ypJ-0002XP-EX
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:22:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2ypH-0002Ww-3I; Sat, 27 Jul 2013 03:22:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 824B342F73;
	Sat, 27 Jul 2013 11:22:02 +0400 (MSK)
Message-ID: <51F37519.2010303@msgid.tls.msk.ru>
Date: Sat, 27 Jul 2013 11:22:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove assignment to a
 variable which is never used
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
X-List-Received-Date: Sat, 27 Jul 2013 07:22:07 -0000

26.07.2013 00:10, Stefan Weil wrote:
> This assignment causes a compiler warning for compilations with the compiler
> option -Wunused-but-set-variable (which is included with -Wextra).
> 
> Removing it allows using -Wextra for QEMU code without suppressing too many
> extra warnings.

Thanks, applied to the trivial patches queue.

/mjt

