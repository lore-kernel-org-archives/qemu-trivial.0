Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpMwg-0006ML-IB
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 13:49:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMwZ-0006E2-7S
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:49:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMwT-0001SX-5E
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:49:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpMwG-0001M0-Ot; Sat, 07 Dec 2013 13:49:16 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2FE0240CDB;
	Sat,  7 Dec 2013 22:49:06 +0400 (MSK)
Message-ID: <52A36DA2.4050508@msgid.tls.msk.ru>
Date: Sat, 07 Dec 2013 22:49:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1386334344-24620-1-git-send-email-agraf@suse.de>
In-Reply-To: <1386334344-24620-1-git-send-email-agraf@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] x86: only allow real mode to access
	32bit without LMA
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
X-List-Received-Date: Sat, 07 Dec 2013 18:49:41 -0000

06.12.2013 16:52, Alexander Graf wrote:
> When we're running in non-64bit mode with qemu-system-x86_64 we can
> still end up with virtual addresses that are above the 32bit boundary
> if a segment offset is set up.
> 
> GNU Hurd does exactly that. It sets the segment offset to 0x80000000 and
> puts its EIP value to 0x8xxxxxxx to access low memory.
> 
> This doesn't hit us when we enable paging, as there we just mask away the
> unused bits. But with real mode, we assume that vaddr == paddr which is
> wrong in this case. Real hardware wraps the virtual address around at the
> 32bit boundary. So let's do the same.
> 
> This fixes booting GNU Hurd in qemu-system-x86_64 for me.

Since i386 tcg code has no active maintainer and since this is a rather
simple change, I'll queue it up to trivial-patches.

Thank you!

/mjt

