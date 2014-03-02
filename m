Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WK6Dq-00058m-Q7
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 08:14:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6Dj-0004yW-7t
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6Dd-00036C-4j
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:14:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WK6DQ-00034H-VK; Sun, 02 Mar 2014 08:14:01 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 67C3C4045C;
	Sun,  2 Mar 2014 17:14:00 +0400 (MSK)
Message-ID: <53132E98.6090404@msgid.tls.msk.ru>
Date: Sun, 02 Mar 2014 17:14:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1392923311-14194-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1392923311-14194-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] stubs: Optimize dependencies for
	gdbstub.c
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
X-List-Received-Date: Sun, 02 Mar 2014 13:14:25 -0000

20.02.2014 23:08, Stefan Weil wrote:
> It does not need qemu-common.h. Including exec/gdbstub.h fixes a warning
> from static code analyzers and avoids mismatching declarations for
> xml_builtin.

Applied to -trivial, thanks!

/mjt

