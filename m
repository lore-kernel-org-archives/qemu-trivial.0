Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNRz-0004Nh-JJ
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:13:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNRt-0004GD-Li
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:13:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNRp-0005u1-3w
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:13:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmNRl-0005rp-MA; Tue, 11 Jun 2013 08:13:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B76F14123A;
	Tue, 11 Jun 2013 16:13:08 +0400 (MSK)
Message-ID: <51B71454.7050909@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 16:13:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370896852-12473-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370896852-12473-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH] target-sparc: Replace free by g_free
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
X-List-Received-Date: Tue, 11 Jun 2013 12:13:22 -0000

Thanks, applied all 4(*) to trivial-patches queue.

(*)
 target-sparc: Replace free by g_free
 hw/scsi: Don't increment a boolean value
 device tree: Fix cppcheck warning
 hw/xen: Use g_free instead of free and fix potential memory leaks

(I think it wont hurt if the xen one will come from both -trivial
and xen trees, first one wins ;)

/mjt

