Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoOR3-0002fx-6a
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 22:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoN8c-00045j-5B
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 21:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoN8W-0007cP-T8
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 21:22:10 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:56810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WoN8M-0007bU-7Y; Sat, 24 May 2014 21:21:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id E492121E66;
	Sun, 25 May 2014 01:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Sun, 25 May 2014 01:21:53 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id A459C203FF;
	Sat, 24 May 2014 21:21:52 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4P1LqsA014810; 
	Sat, 24 May 2014 21:21:52 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4P1LpRd014809;
	Sat, 24 May 2014 21:21:51 -0400
Date: Sat, 24 May 2014 21:21:51 -0400
From: Dave Mielke <dave@mielke.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140525012151.GI1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
X-Mailman-Approved-At: Sat, 24 May 2014 22:45:16 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add delay=<msecs> suboption
 to -display curses
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
X-List-Received-Date: Sun, 25 May 2014 01:22:15 -0000

[quoted lines by Peter Maydell on 2014/05/25 at 01:04 +0100]

>Why is this a problem only for the curses UI frontend, and not for
>any of the other UIs which might send key events?

One reason is that most UIs send key events as they receive them from the 
keyboard, one at a time, whereas the curses UI gets a single key event from 
curses and then sends all of the scancodes which it takes to represent that 
key. In other words, a single key event from curses could result in as many as 
10 actual key events needing to be passed along - both the press and release 
for the actual key plus up to four modifiers (shift, control, alt, altgr).

Another reason is that it's not a problem for a lot of applications. I happened 
to hit it in an application, and, therefore, coded a fix for it.

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

