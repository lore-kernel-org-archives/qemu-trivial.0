Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpCXr-0001fw-Lg
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 04:15:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WpCXk-0001Ux-Se
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 04:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WpCXe-0000bt-Qx
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 04:15:32 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:34283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WpCXS-0000Yj-Rv; Tue, 27 May 2014 04:15:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id 3B0D520F66;
	Tue, 27 May 2014 08:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Tue, 27 May 2014 08:15:13 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 7AB8220545;
	Tue, 27 May 2014 04:15:12 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4R8FB2m022416; 
	Tue, 27 May 2014 04:15:11 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4R8FA8A022415;
	Tue, 27 May 2014 04:15:10 -0400
Date: Tue, 27 May 2014 04:15:09 -0400
From: Dave Mielke <dave@mielke.cc>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20140527081509.GG29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<1401111520.13567.8.camel@nilsson.home.kraxel.org>
	<20140526151948.GA29934@beta.private.mielke.cc>
	<1401169474.25475.3.camel@nilsson.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401169474.25475.3.camel@nilsson.home.kraxel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
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
X-List-Received-Date: Tue, 27 May 2014 08:15:38 -0000

[quoted lines by Gerd Hoffmann on 2014/05/27 at 07:44 +0200]

>What exactly is the problem?

At the user level, the keyboard appears to be dead. An inspection of the 
udnerlying code reveals that the application itsllf is querying the MS-DOS 
keyboard input buffer in a bad way. Those apps can't be fixed, though, because 
the bad code is in a library which is statically linked into every app using 
it, which means lots of apps, many of which, as is always the case, may not 
even have source code anymore.

Another thing to consider is that this, really, is a general problem. Most 
keyboard input code, especially in older days, would've nly ever been tested at 
typing speed. It should be expected, therefore, that there might be problems in 
some of it when input events arrive faster - in this case, "infinitely" fater. 
The solution I'm proposing, therefore, tackles it in a general way, and does 
nothing more than allow the user to request that, regardless of what the UI 
needs to do underneath, the keyboard events still arrive at the speed of a 
typist.

Did you see my other question abot either adding -kbddelay [duration=]msecs or 
merging it into -k (-k [language=]language[,delay=msecs]? Which would be the 
better approach?

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

