Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4Ic-0007x7-Nw
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:07:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4IV-0007oE-Dz
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4IP-0008MV-FJ
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:07:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vv4ID-0008Kb-9f; Mon, 23 Dec 2013 07:07:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B022342F83;
	Mon, 23 Dec 2013 16:07:28 +0400 (MSK)
Message-ID: <52B82780.9000701@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:07:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1387402226-20892-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1387402226-20892-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Python tests must be done
 before help message
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
X-List-Received-Date: Mon, 23 Dec 2013 12:07:53 -0000

19.12.2013 01:30, Stefan Weil wrote:
> The help message uses $python and displays its value, so that macro
> should be tested and set early.

Thanks, applied to the trivial-patches queue.

/mjt

