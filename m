Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoWDX-0005pq-KQ
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 07:03:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoWDR-0005gQ-8v
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 07:03:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoWDM-0001No-0b
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 07:03:45 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:57236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WoWDB-0001Mq-AC; Sun, 25 May 2014 07:03:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id 7A60521DCF;
	Sun, 25 May 2014 11:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Sun, 25 May 2014 11:03:27 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 0BDAE204F1;
	Sun, 25 May 2014 07:03:27 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4PB3Q3E026209; 
	Sun, 25 May 2014 07:03:26 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4PB3Ouc026208;
	Sun, 25 May 2014 07:03:24 -0400
Date: Sun, 25 May 2014 07:03:24 -0400
From: Dave Mielke <dave@mielke.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140525110324.GJ1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
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
X-List-Received-Date: Sun, 25 May 2014 11:03:50 -0000

[quoted lines by Peter Maydell on 2014/05/25 at 10:11 +0100]

>Ah, I see. Still, I think it makes more sense for the queue and delay
>to be in the common key handling code, not in the curses frontend
>specifically.

Yes, you're right. While the curses UI is especially vulnerable to the problem, 
others could be as well, especially if they're driven by a software "user" 
rather than by a human being. Also, who's to say that there won't be a new UI 
in the future which won't run into the same problem. I'll move the code and 
submit a new patch.

Given that this'll require a brand new option, could you please let me know all 
the places that'll need updating insofar as documentation is concerned?

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

