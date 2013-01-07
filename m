Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsGeV-0006Fx-Rr
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 12:38:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TsGeS-00064P-4Z
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:38:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TsGeR-0004gO-97
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:38:20 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TsGeN-0004ev-L3; Mon, 07 Jan 2013 12:38:15 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BBB75728004F; Mon,  7 Jan 2013 18:38:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HExxvNg71be2; Mon,  7 Jan 2013 18:38:14 +0100 (CET)
Received: from flocke.fritz.box (p5086F544.dip.t-dialin.net [80.134.245.68])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	50D42728004E; Mon,  7 Jan 2013 18:38:14 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TsGeL-0001KI-UI; Mon, 07 Jan 2013 18:38:13 +0100
Message-ID: <50EB0805.604@weilnetz.de>
Date: Mon, 07 Jan 2013 18:38:13 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121215 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/channel-posix.c:
 Explicitly include string.h
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
X-List-Received-Date: Mon, 07 Jan 2013 17:38:21 -0000

Am 07.01.2013 18:29, schrieb Peter Maydell:
> Explicitly include string.h to avoid warnings under MacOS X/clang
> about implicit declarations of strerror() and strlen().
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I assume under Linux these are implicitly dragged in via one of the
> other headers.
>
>   qga/channel-posix.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> index d4fd628..ca9e4aa 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -4,6 +4,7 @@
>   #include<unistd.h>
>   #include<fcntl.h>
>   #include<stdlib.h>
> +#include<string.h>
>   #include "qemu/osdep.h"
>   #include "qemu/sockets.h"
>   #include "qga/channel.h"
>    

Better: include qemu-common.h first and remove all
three standard includes.

- Stefan


