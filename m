Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgZ3G-0003lP-EB
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 06:56:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ38-0003ZG-UI
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ32-0001j7-UZ
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:55:58 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgZ2p-0001fA-4j; Wed, 13 Nov 2013 06:55:39 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4452341736;
	Wed, 13 Nov 2013 15:55:38 +0400 (MSK)
Message-ID: <528368BA.70003@msgid.tls.msk.ru>
Date: Wed, 13 Nov 2013 15:55:38 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384089617-4084-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384089617-4084-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] trace: Remove trace.h from console.h
 (less dependencies)
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
X-List-Received-Date: Wed, 13 Nov 2013 11:56:05 -0000

10.11.2013 17:20, Stefan Weil wrote:
> This reduces the dependencies on trace.h.
> Only two source files which need console.h also need trace.h.

Thanks, applied both patches to the trivial patches queue,
after actually verifying that the result is sane ;)

/mjt

