Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKPQm-0000QB-AA
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 05:49:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKPQk-0000M9-55
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:49:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKPQj-0006AH-9g
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:49:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YKPQd-00068N-6i; Sun, 08 Feb 2015 05:49:27 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 35643414D8;
	Sun,  8 Feb 2015 13:49:18 +0300 (MSK)
Message-ID: <54D73F2E.10501@msgid.tls.msk.ru>
Date: Sun, 08 Feb 2015 13:49:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 00/10] Fix warnings (undeclared global
 symbols)
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
X-List-Received-Date: Sun, 08 Feb 2015 10:49:35 -0000

07.02.2015 00:43, Stefan Weil wrote:
> All warnings were reported by the Sparse static analysis tool.
> 
> [PATCH 01/10] disas/cris: Fix warning caused by missing 'static'
> [PATCH 02/10] disas/sh4: Fix warning caused by missing 'static'
> [PATCH 03/10] migration: Fix warning caused by missing declaration of
> [PATCH 04/10] migration: Fix warnings caused by missing 'static'
> [PATCH 05/10] moxie: Fix warning caused by missing include statement
> [PATCH 06/10] serial: Fix warnings caused by missing 'static'
> [PATCH 07/10] spice: Add missing 'static' attribute
> [PATCH 08/10] stubs: Fix warning caused by missing include statement
> [PATCH 09/10] vga: Fix warning caused by missing 'static' attribute
> [PATCH 10/10] virtio: Fix warning caused by missing 'static'


Applied all 10 to -trivial, good stuff!
Thanks,

/mjt


