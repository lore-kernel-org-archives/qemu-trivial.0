Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrjUc-00031p-BG
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 05:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZrjUZ-0002y7-6u
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 05:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZrjUY-0005aS-D4
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 05:27:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1ZrjUU-0005Zu-5k; Thu, 29 Oct 2015 05:27:26 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7274EA37CF;
	Thu, 29 Oct 2015 09:27:25 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9T9RN2L031342; Thu, 29 Oct 2015 05:27:23 -0400
Message-ID: <1446110842.5722.19.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 29 Oct 2015 10:27:22 +0100
In-Reply-To: <5631D48D.90007@msgid.tls.msk.ru>
References: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>
	<CAAOQwLqXeshTGTYxc+Hq62t+mvi=0nbHDg3Z+=87mCGXwYPFTQ@mail.gmail.com>
	<56010629.3080307@msgid.tls.msk.ru> <5631D48D.90007@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?L=E9o?= Grange <grangeleo@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] spice: fix checking for surface
	bpp match
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
X-List-Received-Date: Thu, 29 Oct 2015 09:27:32 -0000

On Do, 2015-10-29 at 11:10 +0300, Michael Tokarev wrote:
> 22.09.2015 10:41, Michael Tokarev wrote:
> > 17.09.2015 19:18, L=C3=A9o Grange wrote:
> >> Ping, as I had no feedback about this small patch.
> >> Please tell me if I need to do anything else.
> >=20
> > Hello!
> >=20
> > I've seen initial version of your patch, thought it isn't exactly tri=
vial ;),
> > and hoped someone will comment.  Only now I realized you sent it to -=
trivial
> > but not to -devel, so there's no one to comment on it.  Please don't =
do this,
> > always include qemu-devel when sending patches, so a patch will have =
a
> > chance to be reviewed.  I've added qemu-devel to Cc now.
> >=20
> > Here, I _think_ the patch is okay, but it'd be better for it to have =
some
> > review still.
>=20
> Gerd, Cc'ing you this time, can you please take a look at this patch?

Obsolete, commit b2af43cc379e1d4c30d92af257bedebf0e3f618a fixes this
(and a few more cases).

cheers,
  Gerd



