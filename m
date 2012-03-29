Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDJgP-0004w3-14
	for mharc-qemu-trivial@gnu.org; Thu, 29 Mar 2012 14:02:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1SDJgM-0004oV-BF
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 14:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1SDJgK-0005p3-Ke
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 14:02:45 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1SDJgD-0005nt-9a; Thu, 29 Mar 2012 14:02:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D2B4972800B0; Thu, 29 Mar 2012 20:02:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qgYw-mVVIS7i; Thu, 29 Mar 2012 20:02:33 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FA49.dip.t-dialin.net [80.134.250.73])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5036372800AF; Thu, 29 Mar 2012 20:02:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1SDJg8-00015d-Q7; Thu, 29 Mar 2012 20:02:32 +0200
Message-ID: <4F74A3B8.5040805@mail.berlios.de>
Date: Thu, 29 Mar 2012 20:02:32 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120317 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4F735EE6.4080106@siemens.com>
In-Reply-To: <4F735EE6.4080106@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] w32: Undefine error
 constants before their redefinition
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
X-List-Received-Date: Thu, 29 Mar 2012 18:02:47 -0000

Am 28.03.2012 20:56, schrieb Jan Kiszka:
> Avoids lots of warnings.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> qemu_socket.h | 2 ++
> 1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/qemu_socket.h b/qemu_socket.h
> index fe4cf6c..51ad210 100644
> --- a/qemu_socket.h
> +++ b/qemu_socket.h
> @@ -8,7 +8,9 @@
> #include <ws2tcpip.h>
>
> #define socket_error() WSAGetLastError()
> +#undef EWOULDBLOCK
> #undef EINTR
> +#undef EINPROGRESS
> #define EWOULDBLOCK WSAEWOULDBLOCK
> #define EINTR WSAEINTR
> #define EINPROGRESS WSAEINPROGRESS

Hi,

I am curious: with which version of MinGW or Cygwin do you get warnings?
I don't see them in my native and cross MinGW / MinGW-w64 builds.

Where do the original definitions come from, and are they compatible with
the redefined values? If yes, it might be possible to put the new 
definitions
in a conditionally compiled code block (#if !defined(EWOULDBLOCK) ... 
#endif).

Could slirp/slirp.h also use qemu_socket.h? That would simplify the code.
Is it possible to move those definitions to qemu-os-win32.h? I'd prefer
to have them in some w32 specific header file instead of qemu_socket.h and
slirp/slirp.h.

If the current two patches help you for the moment, I don't mind when they
are committed, but we should have a better solution later.

Regards,

Stefan W.


