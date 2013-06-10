Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um1wY-00077y-U1
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 09:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um1wX-00075h-An
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um1wV-0002L6-Vj
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:15:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Um1wO-0002K2-Ow; Mon, 10 Jun 2013 09:15:20 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ADFIdV029316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 09:15:18 -0400
Received: from dhcp-200-207.str.redhat.com (dhcp-192-246.str.redhat.com
	[10.33.192.246])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id r5ADFHWo024358; Mon, 10 Jun 2013 09:15:17 -0400
Date: Mon, 10 Jun 2013 15:15:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Wu <lekensteyn@gmail.com>
Message-ID: <20130610131517.GG3636@dhcp-200-207.str.redhat.com>
References: <11837115.9GZ72nQAUt@al>
	<20130610123328.GF3636@dhcp-200-207.str.redhat.com>
	<2282258.ks7pGhyqjl@al>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2282258.ks7pGhyqjl@al>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: implement -full-screen
	and -no-frame
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
X-List-Received-Date: Mon, 10 Jun 2013 13:15:30 -0000

Am 10.06.2013 um 14:43 hat Peter Wu geschrieben:
> On Monday 10 June 2013 14:33:28 Kevin Wolf wrote:
> > Am 09.06.2013 um 12:30 hat Peter Wu geschrieben:
> > > --- a/include/ui/console.h
> > > +++ b/include/ui/console.h
> > > @@ -339,6 +339,6 @@ int index_from_keycode(int code);
> > >
> > >  
> > >  /* gtk.c */
> > >  void early_gtk_display_init(void);
> > >
> > > -void gtk_display_init(DisplayState *ds);
> > > +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);
> > 
> > Should the new arguments be bool?
> 
> Probably yes, but for consistency with the existing types I kept it as int. A 
> future patch could change all uses of "int" to "bool" where 1 or 0 are used, 
> do you prefer to use bool here anyway?

Yes, if you have to respin anyway, I would prefer if you changed it to
bool. I mean it's not a big deal, but it moves us one step closer to
consistent use of bool for boolean values, so it can't be bad.

I don't think we'll ever see one big conversion patch, but as the code
is touched over time, ints abused as bools will slowly disappear if we
don't introduce new instances.

Kevin

