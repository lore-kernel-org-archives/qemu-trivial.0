Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoXzA-0007Ya-34
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 08:57:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoXz2-0007QD-Qk
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 08:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoXyx-0007ha-Cu
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 08:57:00 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:57524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WoXym-0007eZ-9Q; Sun, 25 May 2014 08:56:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id 8654A21E65;
	Sun, 25 May 2014 12:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Sun, 25 May 2014 12:56:42 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id ECB36204F1;
	Sun, 25 May 2014 08:56:41 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4PCufKN024954; 
	Sun, 25 May 2014 08:56:41 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4PCud4n024953;
	Sun, 25 May 2014 08:56:39 -0400
Date: Sun, 25 May 2014 08:56:39 -0400
From: Dave Mielke <dave@mielke.cc>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140525125639.GL1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<5381E4E4.9040406@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5381E4E4.9040406@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] patch: add delay=<msecs> suboption to -display
 curses
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
X-List-Received-Date: Sun, 25 May 2014 12:57:06 -0000

[quoted lines by Michael Tokarev on 2014/05/25 at 16:41 +0400]

>In addition to what Peter said, I think this suboption is named poorly.
>Maybe it can be named, say, kbddelay, or keydelay, or something like that.
>Just "delay" may be interpreted as _video_ delay, ie, delay updating picture
>for so many millisecs.  After all, this is -display, which is about video,
>and keyboard is a secondary function...

Yes, that makes good sense.

>Also, you still haven't told us what application is having problem with it,
>it is some mystery "some app".  

Where I ran into it is DJGPP termios input on MS-DOS.

>And provided this hasn't been a problem for so many years, 

Perhaps it hasn't been observed before because the curses UI may not have that 
many users. I myself must use it as, being blind, it's much easier for me to 
work in text mode than in graphics mode.

>maybe we shouldn't add it in the first place?

Given that this feature does resolve a problem, given that it's default retains 
the original behaviour, and given that we have no idea whatsoever regarding 
when the problem may strike again, my personal opinion is that implementing it 
now would be a reasonable thing to do, especially since the current situation 
is that no one is being asked to figure it out, code it, etc.

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

