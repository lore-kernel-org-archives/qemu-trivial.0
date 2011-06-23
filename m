Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZcMr-0007jd-2i
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 01:22:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZcMo-0007j2-57
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 01:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZcMl-0007qH-TM
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 01:22:13 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZcMi-0007pK-Dw; Thu, 23 Jun 2011 01:22:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	03D5872818A6; Thu, 23 Jun 2011 07:22:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kUm9hrsfv1qw; Thu, 23 Jun 2011 07:22:04 +0200 (CEST)
Received: from [192.168.178.20] (p5086FB6F.dip.t-dialin.net [80.134.251.111])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1754072818A4; Thu, 23 Jun 2011 07:22:04 +0200 (CEST)
Message-ID: <4E02CD7B.40307@mail.berlios.de>
Date: Thu, 23 Jun 2011 07:22:03 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Matthew Fernandez <matthew.fernandez@gmail.com>
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
In-Reply-To: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
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
X-List-Received-Date: Thu, 23 Jun 2011 05:22:15 -0000

Am 23.06.2011 02:59, schrieb Matthew Fernandez:
> Fix a couple of typos in comments.
>
> Signed-off-by: Matthew Fernandez<matthew.fernandez@gmail.com>
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
>    * Copyright (c) 2006-2007 CodeSourcery.
>    * Written by Paul Brook
>    *
> - * This code is licenced under the GPL.
> + * This code is licensed under the GPL.
>    */
>
>   #include "sysbus.h"
> @@ -14,7 +14,7 @@
>
>   /* Bitbanded IO.  Each word corresponds to a single bit.  */
>
> -/* Get the byte address of the real memory for a bitband acess.  */
> +/* Get the byte address of the real memory for a bitband access.  */
>   static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
>   {
>       uint32_t res;


Acked-by: Stefan Weil <weil@mail.berlios.de>


Hi,

would you mind sending a patch which fixes all other "licenced", too?
There are 65 files which contain this spelling :-)

Cheers,
Stefan W.


