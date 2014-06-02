Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrRzw-0000kz-SQ
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 09:09:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WrRzq-0000VS-MD
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 09:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WrRzm-0001IE-1e
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 09:09:50 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:46743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WrRzc-0001GS-7v; Mon, 02 Jun 2014 09:09:36 -0400
Received: from blackfin.pond.sub.org (p5B329868.dip0.t-ipconnect.de
	[91.50.152.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 242DE2015B;
	Mon,  2 Jun 2014 15:09:34 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 73B0230403AF; Mon,  2 Jun 2014 15:09:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
Date: Mon, 02 Jun 2014 15:09:33 +0200
In-Reply-To: <CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
	(Peter Maydell's message of "Sat, 31 May 2014 23:39:00 +0100")
Message-ID: <87mwdv8nle.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
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
X-List-Received-Date: Mon, 02 Jun 2014 13:09:55 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

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

Not much of a "framework", really.

Even in straightforward command line cases, error_report() adds value,
namely a uniform error message format that includes the program name.

Its ability to point to the offending option is useful when the command
line gets long (and ours are prone to get really, really long).
Especially useful when -readconfig comes into play (config file
bisection is no fun).  Unfortunately, the location information can get
lost on its way from option parsing to option use, but that's just
carelessness on our part.

> In short, I think we need to revert this commit
> (1fba509527beb).

Not my bikeshed to paint; do what you think is best.

