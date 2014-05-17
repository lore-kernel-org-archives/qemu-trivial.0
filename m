Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WlZO1-0004Nn-4o
	for mharc-qemu-trivial@gnu.org; Sat, 17 May 2014 03:50:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZNt-0004FM-6H
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZNn-0004CI-1u
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:50:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WlZNa-0003fV-Gk; Sat, 17 May 2014 03:50:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59AA24171A;
	Sat, 17 May 2014 11:49:52 +0400 (MSK)
Message-ID: <5377149F.8040702@msgid.tls.msk.ru>
Date: Sat, 17 May 2014 11:49:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1399564447-19473-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399564447-19473-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Alon Levy <alevy@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] libcacard: g_malloc cleanups
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
X-List-Received-Date: Sat, 17 May 2014 07:50:27 -0000

08.05.2014 19:54, Michael Tokarev wrote:
> This patch replaces g_malloc() in libcacard into g_new()
> or g_new0() where appropriate (removing some init-to-zero
> surrounding code), g_malloc+memcpy into g_memdup() and the
> like.

Applied to trivial-patches qeue, thanks!

/mjt

