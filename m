Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTAlI-0000g0-JC
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 11:03:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aTAlC-0000XY-7R
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aTAl8-0002wM-1h
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:03:26 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:39702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aTAl7-0002wG-Rz
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:03:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id A39F5118188E;
	Tue,  9 Feb 2016 17:03:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id nhuY4A4Hx5Gj; Tue,  9 Feb 2016 17:03:10 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC96CC.dip0.t-ipconnect.de
	[84.172.150.204])
	by mail.weilnetz.de (Postfix) with ESMTPSA id ED85211822A4;
	Tue,  9 Feb 2016 17:03:09 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56BA0DBD.3060206@weilnetz.de>
Date: Tue, 9 Feb 2016 17:03:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] w32: include winsock2.h
	before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 16:03:30 -0000

Am 09.02.2016 um 15:16 schrieb Paolo Bonzini:
> Recent Fedora complains while compiling ui/sdl.c:
>
>     /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:15:2: warning: #warning Please include winsock2.h before windows.h [-Wcpp]
>
> And with this patch we dutifully obey.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/os-win32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 400e098..fbed346 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -26,8 +26,8 @@
>  #ifndef QEMU_OS_WIN32_H
>  #define QEMU_OS_WIN32_H
>  
> -#include <windows.h>
>  #include <winsock2.h>
> +#include <windows.h>
>  
>  /* Workaround for older versions of MinGW. */
>  #ifndef ECONNREFUSED

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Without that patch, windows.h will include winsock.h
(which conflicts with winsock2.h) when compiling sdl.c.

Normally we define WIN32_LEAN_AND_MEAN, and
windows.h won't include winsock.h.

include/ui/sdl2.h and ui/sdl.c undefine that macro,
so the order of the include files is important.

Without testing this, I think that Paolo's patch is needed
since commit e16f4c8770b73f530dad842a31298963b6c7e41d.


