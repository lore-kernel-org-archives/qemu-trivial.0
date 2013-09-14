Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvlC-00040z-LD
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:44:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvl5-0003rc-HK
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvkz-0005fD-JM
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:43:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvkn-0005cZ-9B; Sat, 14 Sep 2013 15:43:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C9AD24114E;
	Sat, 14 Sep 2013 23:43:35 +0400 (MSK)
Message-ID: <5234BC67.4020701@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 23:43:35 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379174107-4128-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379174107-4128-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: Enable extra
	compiler warnings
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
X-List-Received-Date: Sat, 14 Sep 2013 19:44:01 -0000

14.09.2013 19:55, Stefan Weil wrote:
> Compiler option -Wextra enables an additional set of compiler warnings.
>
> Some of these warnings were already enabled explicitly in QEMU:
> -Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
> -Wempty-body are now redundant and can be removed.
>
> Others don't work with the current code and must be disabled to
> avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
> -Wno-sign-compare and -Wno-unused-parameter.

Thanks, applied to the trivial-patches queue, and (minimally) verified
that the result builds on FreeBSD 9.

/mjt

