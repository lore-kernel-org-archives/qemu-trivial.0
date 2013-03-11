Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UEzAe-00067I-ND
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2013 05:37:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UEzAc-00064W-4T
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2013 05:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UEzAa-000856-Ae
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2013 05:37:26 -0400
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a]:59401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UEzAW-000843-TX; Mon, 11 Mar 2013 05:37:21 -0400
Received: by mail-we0-f170.google.com with SMTP id z53so3413316wey.1
	for <multiple recipients>; Mon, 11 Mar 2013 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=E0LVlwVSmonMeJMtMoox8Fngb6r37dauwzgfHllVXHk=;
	b=bj6VyWWH/qL1Ud7Fo6NlPMkgVl96NHbwqMI4zz5kouk6bettTmSNNzOt6wXxg84WeZ
	4JyhVo8qWf9fekN5PvzM7hgesBr/4CNDvoBY9gjs3Isg7iVK1MVjQNJkgC3dluavGtwa
	d3whTVz5X5y1y3SyQurzycHaSnzYGftFfCCDf/zu9W6j1NQlg800TmLTu0d0aeiIADO4
	2zPy2mSOhfJY2+HxAGDDKz64P17r0GtPGijAqDm34DtbIpEq/JNBVlsV5KZxRVAJ4s/4
	DI/q0Qvfj4deM9+dc5GvnBu+UJ51UXptRo5ljAn85K0RaBXUpz7hPfeYI/nznI9Se/mh
	NaKw==
X-Received: by 10.194.173.167 with SMTP id bl7mr17600241wjc.50.1362994634795; 
	Mon, 11 Mar 2013 02:37:14 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2dd0:fe29:43ae:5394])
	by mx.google.com with ESMTPS id dm9sm14456610wib.3.2013.03.11.02.37.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 02:37:13 -0700 (PDT)
Date: Mon, 11 Mar 2013 10:37:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130311093711.GA2543@stefanha-thinkpad.redhat.com>
References: <1362769112-6097-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1362769112-6097-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] MinGW: Replace setsockopt by
 qemu_setsocketopt
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
X-List-Received-Date: Mon, 11 Mar 2013 09:37:28 -0000

On Fri, Mar 08, 2013 at 07:58:32PM +0100, Stefan Weil wrote:
> Instead of adding missing type casts which are needed by MinGW for the
> 4th argument, the patch uses qemu_setsockopt which was invented for this
> purpose.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I did not fix some coding style issues in modified slirp code
> (tabs, line length). Nor did I replace setsockopt in code which
> is unused for MinGW (linux-user, tests).
> 
> - Stefan W.
> 
> 
>  bt-host.c           |    2 +-
>  gdbstub.c           |    2 +-
>  net/socket.c        |   21 ++++++++++-----------
>  slirp/misc.c        |    4 ++--
>  slirp/socket.c      |    4 ++--
>  slirp/tcp_subr.c    |    8 ++++----
>  slirp/udp.c         |    2 +-
>  util/osdep.c        |    4 ++--
>  util/qemu-sockets.c |   10 +++++-----
>  9 files changed, 28 insertions(+), 29 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

