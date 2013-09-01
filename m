Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9co-0006gu-H1
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:31:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9ci-0006ZX-Bb
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9cd-0001Jg-Gq
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:31:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9cT-0001Iq-Gy; Sun, 01 Sep 2013 11:31:17 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CECA2400BA;
	Sun,  1 Sep 2013 19:31:15 +0400 (MSK)
Message-ID: <52235DC3.10305@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:31:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377630553-22051-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1377630553-22051-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/2] configure: Remove unneeded
 redirections of stderr (pkg-config --cflags, --libs)
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
X-List-Received-Date: Sun, 01 Sep 2013 15:31:37 -0000

27.08.2013 23:09, Stefan Weil wrote:
> For existing libraries, pkg-config --cflags and pkg-config --libs won't
> print error messages to stderr, so redirecting stderr is not necessary.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied both to the trivial-patches queue.  A little good cleanup.

/mjt

