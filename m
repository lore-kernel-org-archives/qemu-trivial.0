Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLtXR-0001AI-Ij
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 07:06:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WLtXL-0000zF-MW
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 07:06:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WLtXH-00064n-HX
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 07:05:59 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:56677 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WLtX0-00061f-3I; Fri, 07 Mar 2014 07:05:38 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WLtX8-000624-M5; Fri, 07 Mar 2014 13:05:46 +0100
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.50.11
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <871tyecixy.fsf@linaro.org>
In-reply-to: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
Date: Fri, 07 Mar 2014 12:06:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
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
X-List-Received-Date: Fri, 07 Mar 2014 12:06:04 -0000


Stefan Weil <sw@weilnetz.de> writes:

> 'make test' is broken at least since commit
> baacf04799ace72a9c735dd9306a1ceaf305e7cf. Several source files were moved
> to util/, and some of them there split, so add the missing prefix and new
> files to fix the compiler and linker errors.

I'm curious as why the Travis builds didn't pick this up?

https://travis-ci.org/qemu/qemu/builds

Does it require more libraries/features enabled to cause the breakage?

>
> There remain more issues, but these changes allow running the test on a
> Linux i686 host.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> 'make test' shows several problems where the results from native
> execution and user mode emulation differ. Obviously the TCG code
> or at least one helper function don't work as expected.
>
> The patch might be useful for QEMU stable, too. I did not use it
> with older versions, so I still don't know whether there was a TCG
> regression and when it occurred.
>
> Running 'make test' on an x86_64 host is currently not possible.
> There is at least one -m32 compiler option missing, and a 32 bit
> version of glib2.0 must be installed (not available for Debian
> wheezy, so I had to stop here).
>
> Regards
> Stefan
>
>  tests/tcg/test_path.c |   13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tests/tcg/test_path.c b/tests/tcg/test_path.c
> index a064eea..f8dd36a 100644
> --- a/tests/tcg/test_path.c
> +++ b/tests/tcg/test_path.c
> @@ -1,12 +1,15 @@
>  /* Test path override code */
>  #define _GNU_SOURCE
>  #include "config-host.h"
> -#include "iov.c"
> -#include "cutils.c"
> -#include "path.c"
> -#include "trace.c"
> +#include "util/cutils.c"
> +#include "util/hexdump.c"
> +#include "util/iov.c"
> +#include "util/path.c"
> +#include "util/qemu-timer-common.c"
> +#include "trace/control.c"
> +#include "../trace/generated-events.c"
>  #ifdef CONFIG_TRACE_SIMPLE
> -#include "../trace/simple.c"
> +#include "trace/simple.c"
>  #endif
>  
>  #include <stdarg.h>

-- 
Alex Bennée


