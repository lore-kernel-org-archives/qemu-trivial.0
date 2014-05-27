Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpCBF-0007oh-V9
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 03:52:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WpCBA-0007i3-Ib
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 03:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WpCB6-0001Pi-7D
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 03:52:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1WpCAx-0001KL-6U; Tue, 27 May 2014 03:51:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4R7puRv021690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 27 May 2014 03:51:56 -0400
Received: from work-vm (vpn1-5-235.ams2.redhat.com [10.36.5.235])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4R7pqcJ027282
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 27 May 2014 03:51:54 -0400
Date: Tue, 27 May 2014 08:51:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140527075151.GB2427@work-vm>
References: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
	<537FB30A.9000303@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537FB30A.9000303@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, wdauchy@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] Fix 'name' option to work with
	-readconfig
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
X-List-Received-Date: Tue, 27 May 2014 07:52:17 -0000

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> 06.05.2014 15:15, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The 'name' option silently failed when used in config files
> > ( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Reported-by: William Dauchy <wdauchy@gmail.com>
> 
> Applied to -trivial, after:
> 
>  1. Changing Reported/Tested-by as asked by William Dauchy
>  2. Adding a subject prefix (vl)
>  3. Adding commit message as suggested by Marcus
>  4. Adding Marcus's Reviewed-by.
> 
> Oh ma... ;)
> 
> Thank you!  And please excuse me for it took so long.  It'd be
> faster if I hadn't do all th e above ;)

Thanks, and apologies for not fixing those up.

Dave
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

