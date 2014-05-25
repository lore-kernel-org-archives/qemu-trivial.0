Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoXkF-0002qX-QU
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 08:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoXk8-0002hb-2h
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 08:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoXk1-0003I1-UZ
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 08:41:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WoXjp-0003Fa-E6; Sun, 25 May 2014 08:41:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E47C42E07;
	Sun, 25 May 2014 16:41:08 +0400 (MSK)
Message-ID: <5381E4E4.9040406@msgid.tls.msk.ru>
Date: Sun, 25 May 2014 16:41:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Dave Mielke <dave@mielke.cc>, qemu-devel@nongnu.org
References: <20140524232950.GH1904@beta.private.mielke.cc>
In-Reply-To: <20140524232950.GH1904@beta.private.mielke.cc>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
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
X-List-Received-Date: Sun, 25 May 2014 12:41:42 -0000

25.05.2014 03:29, Dave Mielke wrote:

> Add support for the "-display curses" option to accept suboptions (-display 
> curses[,option...), and add the "delay=<msecs>" suboption. This suboption 
> causes a millisecond-based delay to be inserted in between key events so that 

In addition to what Peter said, I think this suboption is named poorly.
Maybe it can be named, say, kbddelay, or keydelay, or something like that.
Just "delay" may be interpreted as _video_ delay, ie, delay updating picture
for so many millisecs.  After all, this is -display, which is about video,
and keyboard is a secondary function...

Also, you still haven't told us what application is having problem with it,
it is some mystery "some app".  And provided this hasn't been a problem for
so many years, maybe we shouldn't add it in the first place?

Thanks,

/mjt

