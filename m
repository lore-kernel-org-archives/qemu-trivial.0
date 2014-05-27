Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpJEi-0001Ch-S5
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 11:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WpJEb-0000yO-Nu
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 11:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WpJEV-0001Vw-QW
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 11:24:13 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:35578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WpJEK-0001Rd-7P; Tue, 27 May 2014 11:23:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id 7223B205AC;
	Tue, 27 May 2014 15:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Tue, 27 May 2014 15:23:53 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 38287205B2;
	Tue, 27 May 2014 11:23:53 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4RFNqia025592; 
	Tue, 27 May 2014 11:23:52 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4RFNmI9025591;
	Tue, 27 May 2014 11:23:48 -0400
Date: Tue, 27 May 2014 11:23:48 -0400
From: Dave Mielke <dave@mielke.cc>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20140527152348.GH29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<1401111520.13567.8.camel@nilsson.home.kraxel.org>
	<20140526151948.GA29934@beta.private.mielke.cc>
	<1401169474.25475.3.camel@nilsson.home.kraxel.org>
	<20140527081509.GG29934@beta.private.mielke.cc>
	<1401181786.25475.38.camel@nilsson.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401181786.25475.38.camel@nilsson.home.kraxel.org>
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
X-List-Received-Date: Tue, 27 May 2014 15:24:19 -0000

[quoted lines by Gerd Hoffmann on 2014/05/27 at 11:09 +0200]

>Which means exactly?  They are not prepared to find data for more than
>one key event in the buffer?

Not exactly. The bad code is an attempt to do a nonblocking keyboard read in 
MS-DOS. It goes like this:

1) Peek the DOS keyboard buffer start and end pointers. If the buffer is empty 
   then return "no input".

2) If no key is pressed then return "no input".

3) Use the blocking MS-DOS interface to wait for the next key and return it.

So, as you can see, there's a serious problem. Let's say that a key press and 
release go in together. That give us the following situation:

1) Peek the DOS input buffer. It isn't empty so proceed to the next step.

2) No key is pressed so return "no input".

I really do think, therefore, that the only way to deal with this is to slow 
down the input to typing speed.

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

