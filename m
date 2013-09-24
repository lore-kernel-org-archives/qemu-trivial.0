Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOaeT-0002wK-3E
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 18:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOaeI-0002qF-CY
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 18:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOae8-0001Or-I6
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 18:00:02 -0400
Received: from e37.co.us.ibm.com ([32.97.110.158]:37481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOae8-0001OY-AL
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 17:59:52 -0400
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 24 Sep 2013 15:59:51 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 24 Sep 2013 15:59:49 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 773653E4003E;
	Tue, 24 Sep 2013 15:59:48 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r8OLxm4g312028; Tue, 24 Sep 2013 15:59:48 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r8OLxln5032333; Tue, 24 Sep 2013 15:59:47 -0600
Received: from localhost ([9.41.105.206])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r8OLxks8032304; Tue, 24 Sep 2013 15:59:46 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20130924215822.25429.16708@loki>
References: <1375789738-28034-1-git-send-email-stefanha@redhat.com>
	<20130924215822.25429.16708@loki>
Message-ID: <20130924215946.25429.75793@loki>
User-Agent: alot/0.3.4
Date: Tue, 24 Sep 2013 16:59:46 -0500
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13092421-7164-0000-0000-000001E47CB9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.158
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-stable] [PATCH for-1.6] qemu-timer: fix
 get_clock() gettimeofday() fallback #ifdef
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
X-List-Received-Date: Tue, 24 Sep 2013 22:00:11 -0000

Quoting Michael Roth (2013-09-24 16:58:22)
> Quoting Stefan Hajnoczi (2013-08-06 06:48:58)
> > If CLOCK_MONOTONIC is not defined by system headers we use
> > gettimeofday(2).  Apparently this is not used very often since no one
> > noticed the #ifdef was actually broken and left the function definition
> > unterminated.
> > =

> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> =

> Ping, looking to pull this in for stable.

Bah, ignore this. Didn't see previous discussion.

> =

> > ---
> >  include/qemu/timer.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> > index 9dd206c..e3299b8 100644
> > --- a/include/qemu/timer.h
> > +++ b/include/qemu/timer.h
> > @@ -125,8 +125,8 @@ static inline int64_t get_clock(void)
> >             changes, so it should be avoided. */
> >          return get_clock_realtime();
> >      }
> > -}
> >  #endif
> > +}
> > =

> >  void qemu_get_timer(QEMUFile *f, QEMUTimer *ts);
> >  void qemu_put_timer(QEMUFile *f, QEMUTimer *ts);
> > -- =

> > 1.8.1.4


