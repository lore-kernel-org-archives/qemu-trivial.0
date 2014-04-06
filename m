Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWnrM-000809-CR
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 10:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWnrF-0007Zj-Ew
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWnr8-0004lX-QL
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:15:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWnqw-0004af-6T; Sun, 06 Apr 2014 10:15:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 95F7A40B7D;
	Sun,  6 Apr 2014 18:15:17 +0400 (MSK)
Message-ID: <53416175.9080103@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 18:15:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1396019577-2013-4-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 3/3] xbzrle.c: Avoid undefined behaviour
 with signed arithmetic
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
X-List-Received-Date: Sun, 06 Apr 2014 14:15:43 -0000

28.03.2014 19:12, Peter Maydell wrote:
> Use unsigned types for doing bitwise arithmetic in the xzbrle
> calculations, to avoid undefined behaviour:
> 
>  xbzrle.c:99:49: runtime error: left shift of 72340172838076673
>  by 7 places cannot be represented in type 'long'

Aplied to -trivial, thanks!

/mjt

