Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvmTv-0006MM-Vr
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 10:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmTt-0006KX-C6
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvmTs-00070z-Qm
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 10:32:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvmTo-0006zj-KC; Sun, 16 Oct 2016 10:32:00 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7F1841E1A;
	Sun, 16 Oct 2016 17:32:00 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id BE36CB2A;
	Sun, 16 Oct 2016 17:31:59 +0300 (MSK)
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
Date: Sun, 16 Oct 2016 17:31:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Fix build for less common build
 directories names
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Oct 2016 14:32:06 -0000

13.10.2016 21:29, Stefan Weil wrote:
> scripts/tracetool generates a C preprocessor macro from the name of the
> build directory. Any characters which are possible in a directory name
> but not allowed in a macro name must be substituted, otherwise builds
> will fail.

Applied to -trivial, thank you!

/mjt

