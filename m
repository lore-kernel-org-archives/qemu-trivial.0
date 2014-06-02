Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrR2f-0001TP-1b
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 08:08:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WrR2Y-0001Lr-DE
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WrR2T-0002Nk-7y
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:08:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WrR2H-0002KZ-9C; Mon, 02 Jun 2014 08:08:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB9824044E;
	Mon,  2 Jun 2014 16:08:14 +0400 (MSK)
Message-ID: <538C692E.9090000@msgid.tls.msk.ru>
Date: Mon, 02 Jun 2014 16:08:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>	<1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
In-Reply-To: <CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Le Tan <tamlokveer@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 21/23] bsd-user: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Mon, 02 Jun 2014 12:08:39 -0000

01.06.2014 02:39, Peter Maydell wrote:
> On 26 May 2014 08:20, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> From: Le Tan <tamlokveer@gmail.com>
>>
>> Replace fprintf(stderr,...) with error_report() in files bsd-user/*.
>> The trailing "\n"s of the @fmt argument have been removed
>> because @fmt of error_report() should not contain newline.
>>
>> Signed-off-by: Le Tan <tamlokveer@gmail.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Was this patch tested? Building on FreeBSD the compiler
> complains:
> "warning: implicit declaration of function 'error_report' is invalid in C99"
> 
> because none of these bsd-user files include a header which
> gives a prototype for error_report. Also, these are just
> straightforward reporting of command line errors, and I
> think that, like the linux-user code, we should handle
> these in the obvious way by printing to stderr. There's no
> need to drag in the error-handling framework for this,
> especially since user-mode doesn't have the "maybe we
> need to send this to the monitor" issues system emulation
> does.

Umm.  it is a Very Good call.

I applied it and actually tried to compile-check it, on kFreeBSD.
Compile went successfully, and I was satisfied, until I figured
that my kFreeBSD test script only builds qemu-system.  So I went
back and enabled this, and actually found the issue and even
fixed it locally, by adding the #includes.  While doing this, I
wondered, why such a basic/common subsystem is not included in
there to start with, and so isn't used?  Maybe this is something
which shouldn't be done?

But I got distracted from all this due to other issues, and when
I come back I just pushed the whole thing without noticing the
added #includes aren't committed, and forgetting about my doubts.
That's what you get when doing stuff in a hurry.

> In short, I think we need to revert this commit
> (1fba509527beb).

Yes, that's what I think too.  Should I send a formal patch
submission, or is `git revert' easy enough?  Even with my
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
if needed?

Thanks,

/mjt


