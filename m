Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5XKl-0000XE-W8
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 06:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z5XKf-0000NM-Ci
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 06:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z5XKe-0005dq-JF
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 06:46:05 -0400
Received: from mx5-phx2.redhat.com ([209.132.183.37]:52287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>)
	id 1Z5XKT-0005Z9-K7; Thu, 18 Jun 2015 06:45:53 -0400
Received: from zmail25.collab.prod.int.phx2.redhat.com
	(zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id t5IAjqkV026456;
	Thu, 18 Jun 2015 06:45:52 -0400
Date: Thu, 18 Jun 2015 06:45:52 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <789608027.17460503.1434624352586.JavaMail.zimbra@redhat.com>
In-Reply-To: <1434622723.4968.16.camel@redhat.com>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
	<1434028677-26160-2-git-send-email-fziglio@redhat.com>
	<5581CA0E.6080906@msgid.tls.msk.ru>
	<834587703.17443662.1434621536154.JavaMail.zimbra@redhat.com>
	<1434622723.4968.16.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.7.76]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF38 (Linux)/8.0.6_GA_5922)
Thread-Topic: Check value for invalid negative values
Thread-Index: w99+YQJHl8U89/3v9BIS5zA6hl2yzQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.37
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Check value for invalid
 negative values
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
X-List-Received-Date: Thu, 18 Jun 2015 10:46:10 -0000

 
> On Do, 2015-06-18 at 05:58 -0400, Frediano Ziglio wrote:
> > For the same reason there is the v >= l test.
> > The v >= l test state that the value can be out of range so it not always a
> > constant in the range.
> > Adding the v < 0 check for every invalid value. As these are executed only
> > for logging should not be a performance penalty.
> > I also hope the compiler is able to optimize
> > 
> > if (v < 0 || v >= l)
> > 
> > with
> > 
> > if ((unsigned) v >= l)
> 
> Just make v explicitly unsigned?
> 
> cheers,
>   Gerd
> 

Do you mean in the prototype? Well, this could have side effect due to different conversions so is not a so trivial patch.
Explicitly casting to unsigned would do but is IMHO less easy to read that an explicit check.

Frediano

