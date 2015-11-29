Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zM9-00072F-Ht
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:37:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zM7-0006yT-8X
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:37:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zM6-0007mr-FN
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:37:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zM0-0007mW-H4; Sun, 29 Nov 2015 05:37:12 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 06FD243237;
	Sun, 29 Nov 2015 13:37:12 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E8852A68;
	Sun, 29 Nov 2015 13:37:11 +0300 (MSK)
Message-ID: <565AD557.3080703@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:37:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1448626105-29540-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1448626105-29540-2-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-2.5] bt: avoid unintended sign
	extension
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
X-List-Received-Date: Sun, 29 Nov 2015 10:37:20 -0000

27.11.2015 15:08, Paolo Bonzini wrote:
> In the case of a 4-byte length, shifting a value by 24 may cause
> an unintended sign extension when converting from int to size_t.
> Use a uint32_t variable instead.

Applied to -trivial, thank you!

/mjt

