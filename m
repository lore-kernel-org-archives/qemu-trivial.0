Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSEO-0005YZ-FC
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:07:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSEM-0005YI-8d
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSEK-0003wK-PR
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:06:58 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:59606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSEK-0003w9-FS
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:06:56 -0400
Received: by weyt11 with SMTP id t11so2292138wey.4
	for <qemu-trivial@nongnu.org>; Sat, 22 Sep 2012 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zNe8G/PTyox5gxgnSIrP6Wi+rucWmMRiyEgNv/l9U1c=;
	b=JAH4Z+Erkwvpyf1FqJSQgCvBikNyHkzdexF9kBoaqQhEPzgbFAjlR0XBI3CW/aH6ls
	I3fgoFaFUy77WW/OA4DTfwCag2lEPsmiRwjVYXTc8nZ6YlUu1vntrfGzE11rqGoVLYes
	nFCqt4MQ2isVdR80oL5ySxWJVGKYvMf4uLRL7bOUQKlDCvTnKUUAw+QCZ5hiSVjpadt4
	fHteRmKAz4u54yNdOftAbTjMS+goJ0+4cq9HBqyJBjQA7A6Y07UG5cGgBZNT1hnlkcc+
	RKF22QoV6cNaA6g9+z5h8MC4989LSjabvU11V7PijDmomTHhuA1X09bF5pTPrnkq9zX3
	tu4A==
Received: by 10.180.82.230 with SMTP id l6mr3690380wiy.21.1348330015691;
	Sat, 22 Sep 2012 09:06:55 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l5sm4911625wix.5.2012.09.22.09.06.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:06:54 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:06:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hitoshi Mitake <h.mitake@gmail.com>
Message-ID: <20120922160652.GH13216@stefanha-thinkpad.localdomain>
References: <1347639341-4970-1-git-send-email-h.mitake@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1347639341-4970-1-git-send-email-h.mitake@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>
Subject: Re: [Qemu-trivial] [PATCH v2] curses: don't initialize curses when
 qemu is daemonized
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
X-List-Received-Date: Sat, 22 Sep 2012 16:06:59 -0000

On Sat, Sep 15, 2012 at 01:15:41AM +0900, Hitoshi Mitake wrote:
> Current qemu initializes curses even if -daemonize option is
> passed. This cause problem because shell prompt appears without
> calling endwin().
> 
> This patch adds new function, is_daemonized(), to OS dependent
> code. With this function, curses_display_init() can check that qemu is
> daemonized or not. If daemonized, curses_display_init() isn't called
> and the problem is avoided.
> 
> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
> pass the arguments at the same time. But the problem is very painful
> because Ctrl-C cannot be delivered to the terminal.
> 
> Cc: Andrzej Zaborowski  <balrog@zabor.org>
> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Signed-off-by: Hitoshi Mitake <h.mitake@gmail.com>
> ---
> 
> v2: is_daemonized() is now called in main(), not in curses_display_init()
> 
> 8<---
>  os-posix.c      |    5 +++++
>  qemu-os-posix.h |    2 ++
>  qemu-os-win32.h |    5 +++++
>  vl.c            |    3 ++-
>  4 files changed, 14 insertions(+), 1 deletions(-)

There has been no further discussion so this patch is ready to go.  I
have fixed up the coding style issues - please use scripts/checkpatch.pl
next time (and see ./CODING_STYLE and ./HACKING).

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

