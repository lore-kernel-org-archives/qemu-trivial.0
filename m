Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0cz-0004V0-Ge
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 13:59:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0ct-0004K0-DS
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 13:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0co-0000nv-IR
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 13:59:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0cc-0000mX-UY; Fri, 06 Dec 2013 13:59:31 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6468A40D77;
	Fri,  6 Dec 2013 22:59:29 +0400 (MSK)
Message-ID: <52A21E91.7070404@msgid.tls.msk.ru>
Date: Fri, 06 Dec 2013 22:59:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>
References: <1386138449-1235-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1386138449-1235-1-git-send-email-antonynpavlov@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] eeprom93xx: fix coding style
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
X-List-Received-Date: Fri, 06 Dec 2013 18:59:52 -0000

04.12.2013 10:27, Antony Pavlov wrote:
> scripts/checkpatch.pl reports about some style problems,
> this commit fixes some of them:

Thanks, applied to trivial-patches queue.

I'm a bit afraid of this sort of patches - there are LOTS of
coding style issues in current qemu code base, and applying
a patch like this may open a really large can of worms...

Generally it has been agreed to fix coding style only when
doing some other code changes nearby, as far as I remember.

/mjt

