Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QS4uK-0000ux-Rf
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 06:13:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QS4uD-0000ty-DB
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 06:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QS4uC-00079U-8B
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 06:13:33 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:60721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QS4u9-00078k-Ip; Thu, 02 Jun 2011 06:13:29 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate02.web.de (Postfix) with ESMTP id 1C70F1A12810C;
	Thu,  2 Jun 2011 12:13:28 +0200 (CEST)
Received: from [87.173.124.133] (helo=[10.0.1.1])
	by smtp04.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QS4u8-0006an-00; Thu, 02 Jun 2011 12:13:28 +0200
Message-Id: <C277121A-7515-4CD2-85E1-BEEE51AC3960@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 2 Jun 2011 12:13:26 +0200
References: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX185XOsue8y6lnEdVTeKrEJU8b+DgnZ/v1PiTSwv
	QaHaJZEIOAEpT7u1k1N6MomISRwBovAXjC2Sye8FuHkxVarxMu
	lvpmhELCSSVQwj/p3ASQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
	to missing header for sigaction
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
X-List-Received-Date: Thu, 02 Jun 2011 10:13:38 -0000

Am 02.06.2011 um 04:21 schrieb Alexandre Raymond:

> Fix the following warning by including signal.h directly in qemu-=20
> common.h
> ----8<----
> iohandler.c: In function =91qemu_init_child_watch=92:
> iohandler.c:172: warning: implicit declaration of function =91sigaction=92=

> iohandler.c:172: warning: nested extern declaration of =91sigaction=92
> ----8<----
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>

Tested-by: Andreas F=E4rber <andreas.faerber@web.de>

Why in qemu-common.h and not in iohandler.c though?
If we put it into qemu-common.h, you should remove other inclusions of =20=

signal.h.

Andreas

> ---
> qemu-common.h |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/qemu-common.h b/qemu-common.h
> index b851b20..39fabc9 100644
> --- a/qemu-common.h
> +++ b/qemu-common.h
> @@ -39,6 +39,7 @@ typedef struct Monitor Monitor;
> #include <sys/stat.h>
> #include <sys/time.h>
> #include <assert.h>
> +#include <signal.h>
>
> #ifdef _WIN32
> #include "qemu-os-win32.h"
> --=20
> 1.7.5
>
>


