Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WX5i2-0001AI-76
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 05:19:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX5hu-00010m-L7
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX5ho-0003ee-El
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:19:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WX5hb-0003ci-NN; Mon, 07 Apr 2014 05:18:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2675C40C36;
	Mon,  7 Apr 2014 13:18:51 +0400 (MSK)
Message-ID: <53426D7B.7090401@msgid.tls.msk.ru>
Date: Mon, 07 Apr 2014 13:18:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394827873-28729-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394827873-28729-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove redundant message for
 -Werror
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
X-List-Received-Date: Mon, 07 Apr 2014 09:19:17 -0000

15.03.2014 00:11, Stefan Weil wrote:
> The compiler flag -Werror is printed (or not printed) as any other
> compiler flag which is part of QEMU_CFLAGS.
> 
> Therefore an extra output line for -Werror is redundant and can be removed.

Applied - finally - to -trivial, thank you!

/mjt

