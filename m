Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGAq-0005cU-M6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:08:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGAo-0005YH-Ho
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGAn-0000PP-Oi
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:08:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLGAj-0000OW-20; Tue, 10 Feb 2015 14:08:33 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 88998419B0;
	Tue, 10 Feb 2015 22:08:32 +0300 (MSK)
Message-ID: <54DA5730.3060506@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 22:08:32 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1423406448-31918-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1423406448-31918-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] hmp: Fix warning from smatch (wrong
 argument in function call)
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
X-List-Received-Date: Tue, 10 Feb 2015 19:08:39 -0000

08.02.2015 17:40, Stefan Weil wrote:
> Fix this warning:
> hmp.c:414:38: warning: Using plain integer as NULL pointer
> 
> qmp_query_block expects a pointer argument, so passing false is wrong.

Applied to -trivial.  It turns out zero and zero are different! :)

Thanks,

/mjt

