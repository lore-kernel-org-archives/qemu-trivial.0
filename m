Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPYmj-0003zw-BE
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 10:45:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYmc-0003jO-BI
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WPYmW-0004lY-7g
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 10:44:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WPYmH-0004hS-VM; Mon, 17 Mar 2014 10:44:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EE0742766;
	Mon, 17 Mar 2014 18:44:33 +0400 (MSK)
Message-ID: <53270A51.3040409@msgid.tls.msk.ru>
Date: Mon, 17 Mar 2014 18:44:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394993275-23154-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394993275-23154-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-arm: Add missing 'static'
	attribute
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
X-List-Received-Date: Mon, 17 Mar 2014 14:45:00 -0000

16.03.2014 22:07, Stefan Weil wrote:
> This fixes a warning from the static code analysis (smatch).

Thanks, applied to -trivial.

/mjt

