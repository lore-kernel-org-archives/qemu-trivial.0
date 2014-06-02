Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrS6O-0008S0-Fi
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 09:16:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WrS6H-0008Jw-Mk
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 09:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WrS6C-0003X8-4w
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 09:16:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WrS5w-0003RY-PV; Mon, 02 Jun 2014 09:16:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 74A7F40457;
	Mon,  2 Jun 2014 17:16:07 +0400 (MSK)
Message-ID: <538C7917.5010703@msgid.tls.msk.ru>
Date: Mon, 02 Jun 2014 17:16:07 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>	<1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>	<CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
	<87mwdv8nle.fsf@blackfin.pond.sub.org>
In-Reply-To: <87mwdv8nle.fsf@blackfin.pond.sub.org>
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
X-List-Received-Date: Mon, 02 Jun 2014 13:16:35 -0000

02.06.2014 17:09, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
[]
>> because none of these bsd-user files include a header which
>> gives a prototype for error_report. Also, these are just
>> straightforward reporting of command line errors, and I
>> think that, like the linux-user code, we should handle
>> these in the obvious way by printing to stderr. There's no
>> need to drag in the error-handling framework for this,
>> especially since user-mode doesn't have the "maybe we
>> need to send this to the monitor" issues system emulation
>> does.
> 
> Not much of a "framework", really.
> 
> Even in straightforward command line cases, error_report() adds value,
> namely a uniform error message format that includes the program name.

> Its ability to point to the offending option is useful when the command
> line gets long (and ours are prone to get really, really long).

Please note the talk is about bsd-USER, not a SYSTEM emulation.

And for -user. the command line is usually just the opposite - very
short, consisting of the original command line with qemu-foo prepended.

When I encountered this phenomenon (lack of any #includes declaring
error_report()) I thought that maybe an alternative channel for error
reporting might be useful there, like QEMU_LOG=$TMPDIR/foo qemu-foo ...,
so that the output produced by qemu can be separated from the output
produced by the program it runs, but just as Peter pointed out, we're
far from there yet, and indeed, we should start elsewhere.


Thanks,

/mjt

