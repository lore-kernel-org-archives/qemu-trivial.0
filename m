Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wp6SS-0002bG-Qx
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 21:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1Wp6SM-0002ST-LC
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 21:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1Wp6SH-0006lG-Dy
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 21:45:34 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:33896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1Wp6S6-0006hg-HU; Mon, 26 May 2014 21:45:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id EDE5F20F6A;
	Tue, 27 May 2014 01:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Tue, 27 May 2014 01:45:17 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 75B7620900;
	Mon, 26 May 2014 21:45:16 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4R1jGBY010740; 
	Mon, 26 May 2014 21:45:16 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4R1jFhh010739;
	Mon, 26 May 2014 21:45:15 -0400
Date: Mon, 26 May 2014 21:45:15 -0400
From: Dave Mielke <dave@mielke.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140527014514.GD29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
	<20140525110324.GJ1904@beta.private.mielke.cc>
	<20140526125932.GD1207@beta.private.mielke.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140526125932.GD1207@beta.private.mielke.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Tue, 27 May 2014 01:45:40 -0000

[quoted lines by Dave Mielke on 2014/05/26 at 08:59 -0400]

I'm sorry for quoting myself, but I'm doing it for context since I have a
question:

>This patch, attached as qemu-kbddelay-1.patch, is a rework of the former curses
>UI patch so that the delay applies to key events in general. A new option,
>-kbddelay [duration=]msecs, controls it. As before, the default is 0, meaning
>no delay, in which case the timer and queue aren't used thus retaining the
>original behaviour.

I've currently coded it so that there's a new option - -kbddelay. So, we have
the following two options:

  (old) -k <language>
  (new) -kbddelay [duration=]<msecs>

My question is if this is the best way to do it, or if the two options should
be merged. For example:

   -k [language=]<language>,delay=<msecs>

What do you think?

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

