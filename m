Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzVrm-0003wr-HK
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 14:54:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1WzVre-0003nV-VH
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 14:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1WzVrY-0004jD-RU
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 14:54:42 -0400
Received: from afflict.kos.to ([92.243.29.197]:51606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>)
	id 1WzVrK-0004gf-Fw; Tue, 24 Jun 2014 14:54:22 -0400
Received: by afflict.kos.to (Postfix, from userid 1000)
	id D370926552; Tue, 24 Jun 2014 20:54:20 +0200 (CEST)
Date: Tue, 24 Jun 2014 21:54:20 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140624185420.GA23788@afflict.kos.to>
References: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>
	<53A9A02C.7030601@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A9A02C.7030601@msgid.tls.msk.ru>
X-message-flag: Warning: message not sent with a DRM-Certified client
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 92.243.29.197
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, riku.voipio@iki.fi,
	Hunter Laux <hunterlaux@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] Add support for the arm breakpoint
 syscall
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
X-List-Received-Date: Tue, 24 Jun 2014 18:54:49 -0000

On Tue, Jun 24, 2014 at 07:58:36PM +0400, Michael Tokarev wrote:
> 20.06.2014 15:13, Hunter Laux wrote:
> > OABI arm used a software interrupt(0xef9f0001) for breakpoints.
> > Since 2005 gdb has used the break instruction(0xe7f001f0) for EABI.
> > Apparently Steel Bank Common Lisp still uses the swi instruction.
 
> Applied to -trivial, despite the ugliness with the goto.  Oh well.

It was already in my yesterdays linux-user pull req ( which I need
to resend with the name_to_handle_at/open_by_handle_at syscalls fixed ).

Riku

