Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi5Hg-0001j5-38
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 13:05:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5HZ-0001g4-Er
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5HU-0002D6-12
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:05:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wi5HI-00028O-Nu; Wed, 07 May 2014 13:05:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D94CF40AB0;
	Wed,  7 May 2014 21:05:07 +0400 (MSK)
Message-ID: <536A67C3.1010700@msgid.tls.msk.ru>
Date: Wed, 07 May 2014 21:05:07 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Wed, 07 May 2014 17:05:31 -0000

07.05.2014 16:50, Peter Maydell wrote:

> Hi; I'm afraid this pull breaks the build of the A64 disassembler:
> 
> c++ -I/home/petmay01/linaro/qemu-for-merges/tcg
> -I/home/petmay01/linaro/qemu-for-merges/tcg/i386
> -I/home/petmay01/linaro/qemu-for-merges/linux-headers
> -I/home/petmay01/linaro/qemu-for-merges/build/alldbg/linux-headers -I.
> -I/home/petmay01/linaro/qemu-for-merges
> -I/home/petmay01/linaro/qemu-for-merges/include
> -I/home/petmay01/linaro/qemu-for-merges/libcacard
> -I/home/petmay01/linaro/qemu-for-merges/disas -Idisas
> -D__STDC_LIMIT_MACROS -Werror -fPIE -DPIE -m64 -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wall -Wundef
> -Wwrite-strings -fno-strict-aliasing -fno-common -Wendif-labels
> -Wmissing-include-dirs -Wempty-body -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wtype-limits -fstack-protector-all
> -I/usr/include/p11-kit-1 -I/usr/include/libpng12 -I/usr/include/nss
> -I/usr/include/nspr -pthread -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1
> -I/home/petmay01/linaro/qemu-for-merges/tests -MMD -MP -MT
> disas/arm-a64.o -MF disas/arm-a64.d -pthread -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include   -g  -c -o
> disas/arm-a64.o /home/petmay01/linaro/qemu-for-merges/disas/arm-a64.cc
> /home/petmay01/linaro/qemu-for-merges/disas/arm-a64.cc:20:28: fatal
> error: a64/disasm-a64.h: No such file or directory
> compilation terminated.
> make: *** [disas/arm-a64.o] Error 1
> 
>>       Makefiles: convert some obj-specific CFLAGS to use new foo.o-cflags syntax
> 
> git bisect says it's this makefile change.
> 
> I think the problem here is that the rune for applying obj-specific
> CFLAGS is only in the Rules.make line for %.o: %.c, and not in
> the lines for building a .o file from a .cc, .cpp or .m file. That
> should probably be fixed.

Interesting.  It looks like I should add C++ compiler to my test environment,
because I really verified the change and it builds here just fine, but it does
not detect C++ so does not try to build C++ files.

Lovely.

I'm resending the patchset without this patch, will work on it more.

Thank you, and sorry for the noize.

/mjt

