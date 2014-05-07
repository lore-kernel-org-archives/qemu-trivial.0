Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi1JB-0003Pl-TW
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 08:50:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi1J5-0003I1-BO
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 08:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi1Iy-0000R8-TU
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 08:50:43 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:57766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi1Iy-0000P0-Mr
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 08:50:36 -0400
Received: by mail-lb0-f182.google.com with SMTP id q8so1273777lbi.13
	for <qemu-trivial@nongnu.org>; Wed, 07 May 2014 05:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=08Bt4L9DteNhd2FAldW4ws2uvvE1YS4VTvB/+DBVcGs=;
	b=iWNNn7viUzsxyyNHivPTpS4aI9crlA/RzVZHSnkZWTQU7SlgH6L0fFvpdj3DwX9FNh
	vWpgT9VgLq/BcT0dyu40aXE2dPHqODaxRZOBJ0TSLl4wFR5IClicP9F6ulPRezlDO6Y0
	binAuJW82kijPchkKVPRS4HBkE+aUZ3d8JREbtxOuM+AUCCOczwBiGSrVAZoB7nDj6bb
	hGmEL8H0joZhUh7KNdzt65HtY985M7cMpbA/HcmIMxfZ/oyjR+/zXXiNENml9ZwIg0aa
	7JZLlC5mKlZMYACBykvwoYO4r2AX7H40asj3SPvDBT+mI4ldtcs9zkcAH5LJI3CcHtOP
	qnTQ==
X-Gm-Message-State: ALoCoQmzPv0oj8biIB0zs1lmu3OdN+MFAwwr04Abdg8ENz7qZXCDB9HCnOt4cShmlj9AjR15/zIp
X-Received: by 10.112.35.14 with SMTP id d14mr4032295lbj.43.1399467035078;
	Wed, 07 May 2014 05:50:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Wed, 7 May 2014 05:50:13 -0700 (PDT)
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 May 2014 13:50:13 +0100
Message-ID: <CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/22] Trivial patches for
	2014-05-05
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
X-List-Received-Date: Wed, 07 May 2014 12:50:48 -0000

On 5 May 2014 19:01, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another pull request for trival patches.
> This time, it includes:
>
>  - many cleanups from Stefan Weil, mostly adding `static' attrs
>  - some more trivial patches from glib cleanups, by me and Stefan Hajnoczi
>  - some more trivial changes for libcacard, from me and Alon Levy
>  - small fixes from Chen Gang (debug) and Peter Maydell (tests)
>  - little makefile cleanups and configure fix from me
>  - documentation fixes from Fam Zheng
>  - and some more random things
>
> All are little things here and there, just how -trivial tree should really be.

Hi; I'm afraid this pull breaks the build of the A64 disassembler:

c++ -I/home/petmay01/linaro/qemu-for-merges/tcg
-I/home/petmay01/linaro/qemu-for-merges/tcg/i386
-I/home/petmay01/linaro/qemu-for-merges/linux-headers
-I/home/petmay01/linaro/qemu-for-merges/build/alldbg/linux-headers -I.
-I/home/petmay01/linaro/qemu-for-merges
-I/home/petmay01/linaro/qemu-for-merges/include
-I/home/petmay01/linaro/qemu-for-merges/libcacard
-I/home/petmay01/linaro/qemu-for-merges/disas -Idisas
-D__STDC_LIMIT_MACROS -Werror -fPIE -DPIE -m64 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wall -Wundef
-Wwrite-strings -fno-strict-aliasing -fno-common -Wendif-labels
-Wmissing-include-dirs -Wempty-body -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wtype-limits -fstack-protector-all
-I/usr/include/p11-kit-1 -I/usr/include/libpng12 -I/usr/include/nss
-I/usr/include/nspr -pthread -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1
-I/home/petmay01/linaro/qemu-for-merges/tests -MMD -MP -MT
disas/arm-a64.o -MF disas/arm-a64.d -pthread -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include   -g  -c -o
disas/arm-a64.o /home/petmay01/linaro/qemu-for-merges/disas/arm-a64.cc
/home/petmay01/linaro/qemu-for-merges/disas/arm-a64.cc:20:28: fatal
error: a64/disasm-a64.h: No such file or directory
compilation terminated.
make: *** [disas/arm-a64.o] Error 1

>       Makefiles: convert some obj-specific CFLAGS to use new foo.o-cflags syntax

git bisect says it's this makefile change.

I think the problem here is that the rune for applying obj-specific
CFLAGS is only in the Rules.make line for %.o: %.c, and not in
the lines for building a .o file from a .cc, .cpp or .m file. That
should probably be fixed.

thanks
-- PMM

