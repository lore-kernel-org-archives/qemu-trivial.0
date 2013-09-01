Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9hF-0008Lx-Im
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9h8-0008Dx-Jc
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9h2-0002kK-Lr
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:36:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9gq-0002ip-A4; Sun, 01 Sep 2013 11:35:48 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 97A8A400BA;
	Sun,  1 Sep 2013 19:35:47 +0400 (MSK)
Message-ID: <52235ED3.8000108@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:35:47 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] target-arm: Report unimplemented opcodes
 (LOG_UNIMP)
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
X-List-Received-Date: Sun, 01 Sep 2013 15:36:12 -0000

28.08.2013 08:39, Stefan Weil wrote:
> These unimplemented opcodes are handled like illegal opcodes, but
> they are used in existing code. We should at least report when they
> are executed.

Thanks, applied to the trivial-patches queue.

/mjt

