Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2F0N-0002Vd-4q
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2013 02:26:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2F0K-0002Ri-GE
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 02:26:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2F0J-0005T0-Hk
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 02:26:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2F0H-0005Se-M9; Thu, 25 Jul 2013 02:26:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EC25042D74;
	Thu, 25 Jul 2013 10:26:20 +0400 (MSK)
Message-ID: <51F0C50C.2050603@msgid.tls.msk.ru>
Date: Thu, 25 Jul 2013 10:26:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374688136-7733-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374688136-7733-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] misc: Fix new typos in comments and
	strings
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
X-List-Received-Date: Thu, 25 Jul 2013 06:26:25 -0000

24.07.2013 21:48, Stefan Weil wrote:
> All these typos were found by codespell.
> 
> sould -> should
> emperical -> empirical
> intialization -> initialization
> successfuly -> successfully
> gaurantee -> guarantee
> 
> Fix also another error (before before) in the same context.

Thanks, applied to the trivial patches queue.

/mjt

