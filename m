Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWhVn-0006Ir-O7
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 03:29:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWhDv-0007N5-Q4
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 03:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWhDp-0003Ed-Ll
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 03:10:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWhDd-00039H-3b; Sun, 06 Apr 2014 03:10:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 892A440AFB;
	Sun,  6 Apr 2014 11:10:16 +0400 (MSK)
Message-ID: <5340FDD8.5050405@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 11:10:16 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-2-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1396019577-2013-2-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 1/3] hw/ide/ahci.c: Avoid shift left into
 sign bit
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
X-List-Received-Date: Sun, 06 Apr 2014 07:29:02 -0000

28.03.2014 19:12, Peter Maydell wrote:
> Add U suffix to avoid shifting left into the sign bit, which
> is undefined behaviour.

Applied to -trivial, thanks!

/mjt

