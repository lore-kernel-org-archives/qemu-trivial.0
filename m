Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Se3e3-0006sl-9M
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2012 08:22:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Se3dv-0006Tm-EF
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2012 08:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Se3dp-0002yy-CE
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2012 08:22:47 -0400
Received: from mout.web.de ([212.227.17.11]:63807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1Se3dj-0002yD-7c; Mon, 11 Jun 2012 08:22:35 -0400
Received: from envy.site ([195.135.221.2]) by smtp.web.de (mrweb001) with
	ESMTPSA (Nemesis) id 0LgHau-1S80gd2v7k-00nxVW; Mon, 11 Jun 2012 14:22:32
	+0200
Message-ID: <4FD5E307.7030301@web.de>
Date: Mon, 11 Jun 2012 14:22:31 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120421 Thunderbird/12.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1338159200-7502-1-git-send-email-andreas.faerber@web.de>
In-Reply-To: <1338159200-7502-1-git-send-email-andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:rPkP/cgSuNvCGzW0zmxOA37ZlGlwS8cBMjPjvYZSYdf
	+ROz1uzMKUa00RnLW7dNbNf/O30HzNf19bAk/issCeCwAmHZbc
	Me7NOYnaSTwZ0l8RZpStaEwNiwHa0ZyXYpGSbUlFxktvrElxln
	bFE1nTj50dc6fXwqmD+ljSvbjIDmJNCNsl9Z7byIOz2bmOzYB8
	jh6TXW47Furqe8dRSk6+Q==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.11
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
	anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.1] libqtest: Fix
 socket_accept() to pass address_len
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
X-List-Received-Date: Mon, 11 Jun 2012 12:22:53 -0000

Am 28.05.2012 00:53, schrieb Andreas Färber:
> accept() expects address_len to point to the length of the sockaddr on
> input. Initialize it accordingly.
> 
> Resolves an assertion due to EFAULT on illumos.
> 
> Signed-off-by: Andreas Färber <andreas.faerber@web.de>

Ping? Verifiable by looking at the Linux man page.

/-F

> ---
>  tests/libqtest.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 6d333ef..1d73fd1 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -74,6 +74,7 @@ static int socket_accept(int sock)
>      socklen_t addrlen;
>      int ret;
>  
> +    addrlen = sizeof(addr);
>      do {
>          ret = accept(sock, (struct sockaddr *)&addr, &addrlen);
>      } while (ret == -1 && errno == EINTR);


