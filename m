Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpAXA-0006GC-HY
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 02:06:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WpAX3-00067T-JF
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 02:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WpAWy-0001xY-Bn
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 02:06:41 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:48109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WpAWn-0001vm-AP; Tue, 27 May 2014 02:06:25 -0400
Received: from blackfin.pond.sub.org (p5B32A348.dip0.t-ipconnect.de
	[91.50.163.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 6D6CC24DB5;
	Tue, 27 May 2014 08:06:22 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 71C3A30403AF; Tue, 27 May 2014 08:06:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dave Mielke <dave@mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
	<20140525110324.GJ1904@beta.private.mielke.cc>
	<20140526125932.GD1207@beta.private.mielke.cc>
	<20140527014514.GD29934@beta.private.mielke.cc>
Date: Tue, 27 May 2014 08:06:21 +0200
In-Reply-To: <20140527014514.GD29934@beta.private.mielke.cc> (Dave Mielke's
	message of "Mon, 26 May 2014 21:45:15 -0400")
Message-ID: <87sinviwma.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add -kbddelay option
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
X-List-Received-Date: Tue, 27 May 2014 06:06:46 -0000

Dave Mielke <dave@mielke.cc> writes:

> [quoted lines by Dave Mielke on 2014/05/26 at 08:59 -0400]
>
> I'm sorry for quoting myself, but I'm doing it for context since I have a
> question:
>
>>This patch, attached as qemu-kbddelay-1.patch, is a rework of the former curses
>>UI patch so that the delay applies to key events in general. A new option,
>>-kbddelay [duration=]msecs, controls it. As before, the default is 0, meaning
>>no delay, in which case the timer and queue aren't used thus retaining the
>>original behaviour.
>
> I've currently coded it so that there's a new option - -kbddelay. So, we have
> the following two options:
>
>   (old) -k <language>
>   (new) -kbddelay [duration=]<msecs>
>
> My question is if this is the best way to do it, or if the two options should
> be merged. For example:
>
>    -k [language=]<language>,delay=<msecs>
>
> What do you think?

*If* the feature is deemed useful: better extend -k.  We generally
prefer extensible options based on QemuOpts to proliferating ad hoc
single-purpose options.

