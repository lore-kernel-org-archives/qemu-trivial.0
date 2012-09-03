Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8atc-0005LB-0p
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 13:57:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8ata-0005K5-Bd
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T8atZ-0005KT-95
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:57:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T8atY-0005KP-V7; Mon, 03 Sep 2012 13:57:09 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q83Hv6CS005859
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Sep 2012 13:57:06 -0400
Received: from doriath.home (ovpn-113-57.phx2.redhat.com [10.3.113.57])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q83Hv4xL025863; Mon, 3 Sep 2012 13:57:05 -0400
Date: Mon, 3 Sep 2012 14:57:52 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120903145752.5edfafa5@doriath.home>
In-Reply-To: <5044E29C.1030802@weilnetz.de>
References: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
	<20120903134920.2dff4a3d@doriath.home>
	<5044E29C.1030802@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: Remove unreachable
 code after g_error
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
X-List-Received-Date: Mon, 03 Sep 2012 17:57:11 -0000

On Mon, 03 Sep 2012 19:02:20 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Am 03.09.2012 18:49, schrieb Luiz Capitulino:
> > On Sat,  1 Sep 2012 09:34:15 +0200
> > Stefan Weil <sw@weilnetz.de> wrote:
> >
> >> Report from smatch:
> >> qemu-ga.c:117 register_signal_handlers(11) info: ignoring unreachable code.
> >> qemu-ga.c:122 register_signal_handlers(16) info: ignoring unreachable code.
> >>
> >> g_error calls abort which terminates the program.
> >>
> >> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >> ---
> >>   qemu-ga.c |    2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/qemu-ga.c b/qemu-ga.c
> >> index 7623079..b747470 100644
> >> --- a/qemu-ga.c
> >> +++ b/qemu-ga.c
> >> @@ -114,12 +114,10 @@ static gboolean register_signal_handlers(void)
> >>       ret = sigaction(SIGINT, &sigact, NULL);
> >>       if (ret == -1) {
> >>           g_error("error configuring signal handler: %s", strerror(errno));
> >> -        return false;
> > Good catch, but we should really drop g_error() usage as qemu-ga will not
> > fail gracefully otherwise (will leak the pidfile, for example). We either
> > just drop g_error() or replace it by fprintf().
> 
> Isn't that a classical case of an error which should never occur,
> something which could also be handled by an assert statement?
> 
> I don't expect a graceful exit after such errors. If they occur,
> that's something which must be fixed in the code.
> 
> When I read the documentation of sigaction, I don't see how
> it could fail with the given function arguments.
> 
> Therefore I'd apply the patch as it is.

Yes, taking a look at the sigaction() manpages shows you're obviously
correct. Please, disregard what I've said.

