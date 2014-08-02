Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDZTm-0005tn-9m
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 09:36:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZTe-0005lE-QM
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZTY-0006KX-NA
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:36:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XDZTM-0006Jn-4O; Sat, 02 Aug 2014 09:35:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6999240630;
	Sat,  2 Aug 2014 17:35:43 +0400 (MSK)
Message-ID: <53DCE92F.3060507@msgid.tls.msk.ru>
Date: Sat, 02 Aug 2014 17:35:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
	stefanha@redhat.com
References: <53B90C35.6070501@gmail.com>
In-Reply-To: <53B90C35.6070501@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH-trivial] qemu-img: Check getchar() return
 value in read_password() for WIN32
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
X-List-Received-Date: Sat, 02 Aug 2014 13:36:09 -0000

06.07.2014 12:43, Chen Gang wrote:
> getchar() is a standard c library function which may return with failure
> (e.g. -1), so like another platforms, also need check it under WIN32.

Applied to -trivial queue, with a slight modification:

> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -185,15 +185,21 @@ static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
>  static int read_password(char *buf, int buf_size)
>  {
>      int c, i;
> +
>      printf("Password: ");
>      fflush(stdout);
>      i = 0;
>      for(;;) {
>          c = getchar();
> -        if (c == '\n')
> +        if (c < 0) {
> +            buf[i] = '\0';
> +            return -1;
> +        } else if (c == '\n') {
>              break;
> -        if (i < (buf_size - 1))
> +        }
> +        if (i < (buf_size - 1)) {

I've added an 'else' there and merged with the previous line,
to match with the above code which is being added.

>              buf[i++] = c;
> +        }
>      }
>      buf[i] = '\0';
>      return 0;

Thanks,

/mjt


