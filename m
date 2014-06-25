Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WziRo-0007nS-9V
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 04:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WziRf-0007gB-1l
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 04:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WziRX-0006QW-Im
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 04:20:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WziRF-0006LV-4w; Wed, 25 Jun 2014 04:20:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F61D441B8;
	Wed, 25 Jun 2014 12:20:16 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id DF20D674;
	Wed, 25 Jun 2014 12:20:15 +0400 (MSK)
Message-ID: <53AA863F.9000306@msgid.tls.msk.ru>
Date: Wed, 25 Jun 2014 12:20:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Riku Voipio <riku.voipio@iki.fi>
References: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>	<53A9A02C.7030601@msgid.tls.msk.ru>
	<20140624185420.GA23788@afflict.kos.to>
In-Reply-To: <20140624185420.GA23788@afflict.kos.to>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
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
X-List-Received-Date: Wed, 25 Jun 2014 08:20:50 -0000

24.06.2014 22:54, Riku Voipio wrote:
> On Tue, Jun 24, 2014 at 07:58:36PM +0400, Michael Tokarev wrote:
>> 20.06.2014 15:13, Hunter Laux wrote:
>>> OABI arm used a software interrupt(0xef9f0001) for breakpoints.
>>> Since 2005 gdb has used the break instruction(0xe7f001f0) for EABI.
>>> Apparently Steel Bank Common Lisp still uses the swi instruction.
>  
>> Applied to -trivial, despite the ugliness with the goto.  Oh well.
> 
> It was already in my yesterdays linux-user pull req ( which I need
> to resend with the name_to_handle_at/open_by_handle_at syscalls fixed ).

If it is the same patch, git should do the Right Thing when
pulling your branch, without causing conflicts.

You could notify me about you applying this patch to -linux-user
branch.  I haven't noticed this patch in your pull req, -- I don't
always watch all pull requests.

Thanks,

/mjt

