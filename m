Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJo05-0008G7-0D
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:23:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo02-0008Cu-Tq
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJo02-0004HR-5b
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:23:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJnzx-00049a-Ts; Mon, 27 Jul 2015 15:23:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 922CD425AF;
	Mon, 27 Jul 2015 22:23:40 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 76C4FA57;
	Mon, 27 Jul 2015 22:23:40 +0300 (MSK)
Message-ID: <55B6853C.1060005@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:23:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1437338062-26577-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1437338062-26577-1-git-send-email-peter.maydell@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-common.h: Document cutils.c string
	functions
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
X-List-Received-Date: Mon, 27 Jul 2015 19:23:47 -0000

19.07.2015 23:34, Peter Maydell wrote:
> Add documentation comments for various utility string functions
> which we have implemented in util/cutils.c

Applied to -trivial, thanks!

/mjt

