Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDKDJ-0003L5-Na
	for mharc-qemu-trivial@gnu.org; Thu, 29 Mar 2012 14:36:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SDKDG-0003D5-Cf
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 14:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SDKDE-00063j-6i
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 14:36:45 -0400
Received: from goliath.siemens.de ([192.35.17.28]:23236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1SDKDD-00061y-TA; Thu, 29 Mar 2012 14:36:44 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q2TIacvi004716;
	Thu, 29 Mar 2012 20:36:38 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q2TIacuT017226;
	Thu, 29 Mar 2012 20:36:38 +0200
Message-ID: <4F74ABB5.5070708@siemens.com>
Date: Thu, 29 Mar 2012 20:36:37 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <weil@mail.berlios.de>
References: <4F735EE6.4080106@siemens.com> <4F74A3B8.5040805@mail.berlios.de>
In-Reply-To: <4F74A3B8.5040805@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
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
X-List-Received-Date: Thu, 29 Mar 2012 18:36:47 -0000

On 2012-03-29 20:02, Stefan Weil wrote:
> Am 28.03.2012 20:56, schrieb Jan Kiszka:
>> Avoids lots of warnings.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>> qemu_socket.h | 2 ++
>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/qemu_socket.h b/qemu_socket.h
>> index fe4cf6c..51ad210 100644
>> --- a/qemu_socket.h
>> +++ b/qemu_socket.h
>> @@ -8,7 +8,9 @@
>> #include <ws2tcpip.h>
>>
>> #define socket_error() WSAGetLastError()
>> +#undef EWOULDBLOCK
>> #undef EINTR
>> +#undef EINPROGRESS
>> #define EWOULDBLOCK WSAEWOULDBLOCK
>> #define EINTR WSAEINTR
>> #define EINPROGRESS WSAEINPROGRESS
> 
> Hi,
> 
> I am curious: with which version of MinGW or Cygwin do you get warnings?
> I don't see them in my native and cross MinGW / MinGW-w64 builds.

Not sure if that is what you are looking for, but my runtime rpm claims
to be mingw32-runtime-20120126-1.4.

> 
> Where do the original definitions come from, and are they compatible with
> the redefined values? If yes, it might be possible to put the new 
> definitions
> in a conditionally compiled code block (#if !defined(EWOULDBLOCK) ... 
> #endif).

/usr/i686-w64-mingw32/sys-root/mingw/include/errno.h:158:0: note: this
is the location of the previous definition

And there we have e.g.

#ifndef EINPROGRESS
#define EINPROGRESS 112
#endif

vs.

#define WSAEINPROGRESS 10036L

> 
> Could slirp/slirp.h also use qemu_socket.h? That would simplify the code.
> Is it possible to move those definitions to qemu-os-win32.h? I'd prefer
> to have them in some w32 specific header file instead of qemu_socket.h and
> slirp/slirp.h.

/me too. But as I cannot test w32, I would welcome to receive a tested
patch for the slirp queue. :)

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

