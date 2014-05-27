Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpDOf-0002ay-0o
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 05:10:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WpDOV-0002Sj-GD
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 05:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WpDON-0003xN-TP
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 05:10:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WpDON-0003wv-Ld; Tue, 27 May 2014 05:09:55 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4R99oKn001899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 27 May 2014 05:09:50 -0400
Received: from [10.36.116.31] (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4R99lrG028851; Tue, 27 May 2014 05:09:48 -0400
Message-ID: <1401181786.25475.38.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Mielke <dave@mielke.cc>
Date: Tue, 27 May 2014 11:09:46 +0200
In-Reply-To: <20140527081509.GG29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<1401111520.13567.8.camel@nilsson.home.kraxel.org>
	<20140526151948.GA29934@beta.private.mielke.cc>
	<1401169474.25475.3.camel@nilsson.home.kraxel.org>
	<20140527081509.GG29934@beta.private.mielke.cc>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 27 May 2014 09:10:11 -0000

On Di, 2014-05-27 at 04:15 -0400, Dave Mielke wrote:
> [quoted lines by Gerd Hoffmann on 2014/05/27 at 07:44 +0200]
> 
> >What exactly is the problem?
> 
> At the user level, the keyboard appears to be dead. An inspection of the 
> udnerlying code reveals that the application itsllf is querying the MS-DOS 
> keyboard input buffer in a bad way.

Which means exactly?  They are not prepared to find data for more than
one key event in the buffer?

> Those apps can't be fixed, though, because 
> the bad code is in a library which is statically linked into every app using 
> it, which means lots of apps, many of which, as is always the case, may not 
> even have source code anymore.

Sure.

> Another thing to consider is that this, really, is a general problem. Most 
> keyboard input code, especially in older days, would've nly ever been tested at 
> typing speed. It should be expected, therefore, that there might be problems in 
> some of it when input events arrive faster - in this case, "infinitely" fater. 
> The solution I'm proposing, therefore, tackles it in a general way, and does 
> nothing more than allow the user to request that, regardless of what the UI 
> needs to do underneath, the keyboard events still arrive at the speed of a 
> typist.

I don't like the idea to do it in the UI code.  I don't think the
problem is as generic as you think it is.  HID keyboards (usb,
bluetooth) report keys in a completely different way, and probably your
problem is specific to the ps/2 keyboard.

I'd try to do it in the ps/2 code, and try to do it without a timer.

Idea:  Split the ps/2 keyboard queue into two.  One will be
guest-visible.  The existing ps2 queue will do the job.  The other, new
queue will not be visible to the guest.  Simliar to the queue you've
added to the ui code.  Put not more than one key event (1-3 scancodes)
into the guest visible queue.  Wait for the guest read the status
register (signaling "no more data") once.  Then go refill the
guest-visible queue from the invisible queue.  With some luck this makes
things work without a delay.

If not we are not so lucky we have to fire a timer for queue refill
after signaling "no more data" to the guest.  Even in case we need a
timer this is better than doing it in the ui code as we can arm the
timer when we know the guest has actually seen the key event.  So the
guest being busy with something else and not polling the kbd for a time
span longer than the delay will not break things, so we can use a pretty
short delay.

cheers,
  Gerd



