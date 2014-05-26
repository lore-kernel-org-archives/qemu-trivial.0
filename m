Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wov7H-0004sx-MZ
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 09:39:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Wov79-0004sk-Ki
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 09:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Wov72-0003n8-3n
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 09:38:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Wov71-0003mx-Qu; Mon, 26 May 2014 09:38:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4QDchr1006317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 26 May 2014 09:38:44 -0400
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4QDcfjb010077; Mon, 26 May 2014 09:38:42 -0400
Message-ID: <1401111520.13567.8.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Mielke <dave@mielke.cc>
Date: Mon, 26 May 2014 15:38:40 +0200
In-Reply-To: <20140525012151.GI1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
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
X-List-Received-Date: Mon, 26 May 2014 13:39:03 -0000

On Sa, 2014-05-24 at 21:21 -0400, Dave Mielke wrote:
> [quoted lines by Peter Maydell on 2014/05/25 at 01:04 +0100]
> 
> >Why is this a problem only for the curses UI frontend, and not for
> >any of the other UIs which might send key events?
> 
> One reason is that most UIs send key events as they receive them from the 
> keyboard, one at a time, whereas the curses UI gets a single key event from 
> curses and then sends all of the scancodes which it takes to represent that 
> key. In other words, a single key event from curses could result in as many as 
> 10 actual key events needing to be passed along - both the press and release 
> for the actual key plus up to four modifiers (shift, control, alt, altgr).

Tried to make the curses ui a bit more clever?  You could try caching
the modifier state, then send only the changes.  That gets the number of
events down to 6 max (4 to update modifier state, 2 for the actual key).

Other question: has "git revert
2858ab09e6f708e381fc1a1cc87e747a690c4884" any effect?

cheers,
  Gerd



