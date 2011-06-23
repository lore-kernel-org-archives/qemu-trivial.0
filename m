Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZh3Q-0006tz-1f
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 06:22:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QZh3M-0006tL-UG
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:22:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QZh3L-0007xd-Q2
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:22:28 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:39917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QZh3I-0007wy-IM; Thu, 23 Jun 2011 06:22:24 -0400
Received: from smtp06.web.de  ( [172.20.5.172])
	by fmmailgate02.web.de (Postfix) with ESMTP id 3775A1A3907C4;
	Thu, 23 Jun 2011 12:22:23 +0200 (CEST)
Received: from [87.173.122.232] (helo=[10.0.1.1])
	by smtp06.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QZh3H-0005zX-00; Thu, 23 Jun 2011 12:22:23 +0200
Message-Id: <57FD980B-E6A3-4E1A-A83B-062B9954DB5C@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Matthew Fernandez <matthew.fernandez@gmail.com>
In-Reply-To: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 23 Jun 2011 12:22:21 +0200
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX198JRIDETfdaA73OeSYS5DXXPGWoqS72nZ9uzWQ
	/BLD5OdTvju1T8dx5nvmmB6PpMoYu2teQ+S4Rr1VK7mpW3IZVO
	5nUBxJQLUzmtLd/GVALA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel Developers <qemu-devel@nongnu.org>,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 10:22:30 -0000

Am 23.06.2011 um 02:59 schrieb Matthew Fernandez:

> Fix a couple of typos in comments.
>
> Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
> ----
> This patch doesn't touch any code and should (hopefully) not be
> controversial. There doesn't seem to be a maintainer for this file,
> but changes are trivial.
>
>
> diff --git a/hw/armv7m.c b/hw/armv7m.c
> index 72d010a..83f3393 100644
> --- a/hw/armv7m.c
> +++ b/hw/armv7m.c
> @@ -4,7 +4,7 @@
>  * Copyright (c) 2006-2007 CodeSourcery.
>  * Written by Paul Brook
>  *
> - * This code is licenced under the GPL.
> + * This code is licensed under the GPL.

Nack. Licence is British English, license American English. It's not  
wrong.

>  */
>
> #include "sysbus.h"
> @@ -14,7 +14,7 @@
>
> /* Bitbanded IO.  Each word corresponds to a single bit.  */
>
> -/* Get the byte address of the real memory for a bitband acess.  */
> +/* Get the byte address of the real memory for a bitband access.  */

This one's okay.

Andreas

> static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
> {
>     uint32_t res;
>


