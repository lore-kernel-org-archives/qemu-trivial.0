Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WowhH-0007uV-7K
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 11:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1Wowh8-0007ga-7J
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 11:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1Wowh2-00072E-Q8
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 11:20:10 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:32943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1Wowgs-0006qQ-6a; Mon, 26 May 2014 11:19:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id C35CA1F7E7;
	Mon, 26 May 2014 15:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Mon, 26 May 2014 15:19:52 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 2F3F2205A9;
	Mon, 26 May 2014 11:19:51 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4QFJoqZ030270; 
	Mon, 26 May 2014 11:19:50 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4QFJnPW030269;
	Mon, 26 May 2014 11:19:49 -0400
Date: Mon, 26 May 2014 11:19:48 -0400
From: Dave Mielke <dave@mielke.cc>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20140526151948.GA29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<1401111520.13567.8.camel@nilsson.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401111520.13567.8.camel@nilsson.home.kraxel.org>
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
X-List-Received-Date: Mon, 26 May 2014 15:20:18 -0000

[quoted lines by Gerd Hoffmann on 2014/05/26 at 15:38 +0200]

>Tried to make the curses ui a bit more clever?  You could try caching
>the modifier state, then send only the changes.  That gets the number of
>events down to 6 max (4 to update modifier state, 2 for the actual key).

Yes, except that, in my case, the problem already occurs on simple typing of 
lowercase letters, i.e. just two events.

Also, that approach could introduce new problems due to modifeir keys appearing 
to be stuck.

>Other question: has "git revert
>2858ab09e6f708e381fc1a1cc87e747a690c4884" any effect?

That gives me:

   could not revert 2858ab0... ps2: set ps/2 output buffer size as the same as kernel

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

