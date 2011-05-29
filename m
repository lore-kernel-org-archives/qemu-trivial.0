Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQhJp-0004dT-7E
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 10:50:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQhJm-0004Yl-O6
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 10:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQhJl-0001vO-Ue
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 10:50:14 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:39209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQhJj-0001uo-Jq; Sun, 29 May 2011 10:50:11 -0400
Received: from smtp06.web.de  ( [172.20.5.172])
	by fmmailgate01.web.de (Postfix) with ESMTP id E2DB518F88045;
	Sun, 29 May 2011 16:50:08 +0200 (CEST)
Received: from [87.173.127.118] (helo=[10.0.1.1])
	by smtp06.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQhJg-0001wT-00; Sun, 29 May 2011 16:50:08 +0200
Message-Id: <E3869720-39F6-4B6C-AD9A-E566DEE2005E@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <1306516951-31105-2-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 29 May 2011 16:50:07 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-2-git-send-email-cerbere@gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1/VcT40Q6KmhyNiALmNaClwYoOOeULO7vBtnk6F
	ykAzFnXNa3ERYicgSZInv9hpcQhbmRabhX4MD5MtLP/9kv0Ep1
	cYHYVcaXZ5+nWAYctNlw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] Fix incorrect check for
	fdatasync() in configure
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
X-List-Received-Date: Sun, 29 May 2011 14:50:15 -0000

Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:

> For some reason, darwin provides a symbol for fdatasync(), but
> doesn't officially support it.
>
> The manpage for fdatasync on Linux states the following:
>
> "On POSIX  systems  on  which fdatasync() is available,
> _POSIX_SYNCHRONIZED_IO is defined in <unistd.h> to a value greater  
> than 0."

The Open Group Base Specification Issue 7 says this on fdatasync():

"The functionality shall be equivalent to fsync() with the symbol  
_POSIX_SYNCHRONIZED_IO defined, with the exception that all I/O  
operations shall be completed as defined for synchronized I/O data  
integrity completion."

On unistd.h it goes on to say:

"_POSIX_SYNCHRONIZED_IO
[SIO]
The implementation supports the Synchronized Input and Output option.  
If this symbol is defined in <unistd.h>, it shall be defined to be -1,  
0, or 200809L."

The change history has nothing on that define and its value -1, so I'm  
not convinced that this really is The Right Way to check.

> In fact, unistd.h defines this value to "-1", at least on OSX 10.6.7.
>
> Add this check to the configure file.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>

Andreas

> ---
> configure |    8 +++++++-
> 1 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index a318d37..b21ef75 100755
> --- a/configure
> +++ b/configure
> @@ -2477,7 +2477,13 @@ fi
> fdatasync=no
> cat > $TMPC << EOF
> #include <unistd.h>
> -int main(void) { return fdatasync(0); }
> +int main(void) {
> +#if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
> +return fdatasync(0);
> +#else
> +#abort Not supported
> +#endif
> +}
> EOF
> if compile_prog "" "" ; then
>     fdatasync=yes
> -- 
> 1.7.5


