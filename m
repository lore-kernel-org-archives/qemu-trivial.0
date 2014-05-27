Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpAC0-0004C5-UU
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 01:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WpABs-00042Z-Jd
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 01:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WpABm-0002c1-Fv
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 01:44:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WpABm-0002aT-63; Tue, 27 May 2014 01:44:42 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4R5ibVM007109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 27 May 2014 01:44:37 -0400
Received: from [10.36.116.31] (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4R5iZl7013553; Tue, 27 May 2014 01:44:36 -0400
Message-ID: <1401169474.25475.3.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Mielke <dave@mielke.cc>
Date: Tue, 27 May 2014 07:44:34 +0200
In-Reply-To: <20140526151948.GA29934@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<1401111520.13567.8.camel@nilsson.home.kraxel.org>
	<20140526151948.GA29934@beta.private.mielke.cc>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
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
X-List-Received-Date: Tue, 27 May 2014 05:44:55 -0000

On Mo, 2014-05-26 at 11:19 -0400, Dave Mielke wrote:
> [quoted lines by Gerd Hoffmann on 2014/05/26 at 15:38 +0200]
> 
> >Tried to make the curses ui a bit more clever?  You could try caching
> >the modifier state, then send only the changes.  That gets the number of
> >events down to 6 max (4 to update modifier state, 2 for the actual key).
> 
> Yes, except that, in my case, the problem already occurs on simple typing of 
> lowercase letters, i.e. just two events.

What exactly is the problem?

> Also, that approach could introduce new problems due to modifeir keys appearing 
> to be stuck.

Indeed.

> >Other question: has "git revert
> >2858ab09e6f708e381fc1a1cc87e747a690c4884" any effect?
> 
> That gives me:
> 
>    could not revert 2858ab0... ps2: set ps/2 output buffer size as the same as kernel

Given that only two keys already problematic this probably wouldn't
change things anyway.

cheers,
  Gerd



