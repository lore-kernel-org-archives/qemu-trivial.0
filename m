Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9L6l-00024g-Ce
	for mharc-qemu-trivial@gnu.org; Tue, 13 Aug 2013 16:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V9L6f-00020t-71
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 16:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V9L6Z-0007VL-8r
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 16:22:17 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:41213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V9L6Z-0007V1-2Y
	for qemu-trivial@nongnu.org; Tue, 13 Aug 2013 16:22:11 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BE1567281C14; Tue, 13 Aug 2013 22:22:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CFGbi4i7ErCS; Tue, 13 Aug 2013 22:21:57 +0200 (CEST)
Received: from [192.168.0.103] (p5484327F.dip0.t-ipconnect.de [84.132.50.127])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	2CCB17281C0F; Tue, 13 Aug 2013 22:21:57 +0200 (CEST)
Message-ID: <520A9563.20307@weilnetz.de>
Date: Tue, 13 Aug 2013 22:21:55 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Taimoor <taimoor.mrza@gmail.com>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
In-Reply-To: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Port redirection
 option behave differently on Linux and Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 20:22:22 -0000

Am 13.08.2013 22:00, schrieb Taimoor:
> From: Taimoor Mirza <tmirza@codesourcery.com>
>
> port redirection code uses SO_REUSEADDR socket option before binding to
> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
> Relaunching QEMU with same host and guest port redirection values on Linux
> throws error but on Windows it does not throw any error.
> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
>
> Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
> ---
>  slirp/socket.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/slirp/socket.c b/slirp/socket.c
> index 8e8819c..23780b3 100644
> --- a/slirp/socket.c
> +++ b/slirp/socket.c
> @@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
>  	addr.sin_port = hport;
>  
>  	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
> +#ifdef _WIN32

Shouldn't this be replaced by #ifndef _WIN32?

>  	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
> +#endif
>  	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
>  	    (listen(s,1) < 0)) {
>  		int tmperrno = errno; /* Don't clobber the real reason we failed */


