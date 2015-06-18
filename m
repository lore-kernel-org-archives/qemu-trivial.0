Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5aJK-0005A7-Ld
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 09:56:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z5aJI-00057G-4u
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 09:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z5aJH-0002GF-8w
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 09:56:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Z5aJ9-0002AP-9I; Thu, 18 Jun 2015 09:56:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D13FD2F6687;
	Thu, 18 Jun 2015 13:56:42 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5IDuerS003644; Thu, 18 Jun 2015 09:56:41 -0400
Message-ID: <1434635799.4968.33.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>
Date: Thu, 18 Jun 2015 15:56:39 +0200
In-Reply-To: <789608027.17460503.1434624352586.JavaMail.zimbra@redhat.com>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
	<1434028677-26160-2-git-send-email-fziglio@redhat.com>
	<5581CA0E.6080906@msgid.tls.msk.ru>
	<834587703.17443662.1434621536154.JavaMail.zimbra@redhat.com>
	<1434622723.4968.16.camel@redhat.com>
	<789608027.17460503.1434624352586.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 18 Jun 2015 13:56:53 -0000

On Do, 2015-06-18 at 06:45 -0400, Frediano Ziglio wrote:
>  > On Do, 2015-06-18 at 05:58 -0400, Frediano Ziglio wrote:
> > > For the same reason there is the v >= l test.
> > > The v >= l test state that the value can be out of range so it not always a
> > > constant in the range.
> > > Adding the v < 0 check for every invalid value. As these are executed only
> > > for logging should not be a performance penalty.
> > > I also hope the compiler is able to optimize
> > > 
> > > if (v < 0 || v >= l)
> > > 
> > > with
> > > 
> > > if ((unsigned) v >= l)
> > 
> > Just make v explicitly unsigned?
> > 
> > cheers,
> >   Gerd
> > 
> 
> Do you mean in the prototype?

Yes.

> Well, this could have side effect due to different conversions so is not a so trivial patch.

What side effects?  I don't expect any for in-range values, and how
exactly we catch out-of-range values doesn't really matter ...

cheers,
  Gerd



