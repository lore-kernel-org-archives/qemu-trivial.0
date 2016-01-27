Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOPL8-0002z3-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jan 2016 07:36:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aOPL5-0002s6-4e
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 07:36:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aOPL4-0001w7-9q
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 07:36:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aOPKz-0001ss-UZ; Wed, 27 Jan 2016 07:36:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 249D341445;
	Wed, 27 Jan 2016 15:36:39 +0300 (MSK)
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
References: <1453894822-4172-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20160127131531.2c5f75e8@bahia.huguette.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56A8B9D6.4020304@msgid.tls.msk.ru>
Date: Wed, 27 Jan 2016 15:36:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160127131531.2c5f75e8@bahia.huguette.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] remove libtool support
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
X-List-Received-Date: Wed, 27 Jan 2016 12:36:48 -0000

27.01.2016 15:15, Greg Kurz wrote:
[]
> Just a few remarks:
> 
> [greg@palmb qemu-master]$ grep -r libtool
> qemu-doc.texi:@item libtool: @uref{http://www.gnu.org/software/libtool/}
> 
> Maybe we should drop that line as well ?

Hm, it looks like I forgot to commit that change,
qemu-doc.texi is left locally modified but not comitted.
Yes, definitely we should do that.

btw, there's a handy tool `git grep' for that.

> Also, when reading http://wiki.qemu.org/Contribute/TrivialPatches, I
> wonder if this can be considered a trivial patch... Can you clarify ?

well, I dunno.  To me it is trivial, removing a bunch of unused code
without touching the rest.  Dunno.

Thanks,

/mjt

