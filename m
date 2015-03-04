Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT9Q0-0006Py-ST
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 08:32:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT9Pu-0006FM-Jo
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT9Po-0002gP-UQ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:32:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YT9Ph-0002dM-Q5; Wed, 04 Mar 2015 08:32:37 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t24DWb1L023284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 08:32:37 -0500
Received: from work-vm (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t24DWXCY026603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 4 Mar 2015 08:32:35 -0500
Date: Wed, 4 Mar 2015 13:32:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150304133232.GH2530@work-vm>
References: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150304121654.GC2530@work-vm> <54F6F919.9060905@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54F6F919.9060905@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration/rdma: clean up
 qemu_rdma_dest_init a bit
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
X-List-Received-Date: Wed, 04 Mar 2015 13:32:55 -0000

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> 04.03.2015 15:16, Dr. David Alan Gilbert wrote:
> > * Michael Tokarev (mjt@tls.msk.ru) wrote:
> >> Do not check for rdma->host being empty twice.  This removes a large
> >> "if" block, so code indentation is changed.  While at it, remove an
> >> ugly goto from the loop, replacing it with a cleaner if logic.  And
> >> finally, there's no need to initialize `ret' variable since is always
> >> has a value.
> >>
> >> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > 
> > Juan/Amit: There's a space at the end of a line that got in, so
> >            that just needs fixing in the merge;  it's after the 'break;'
> 
> I already fixed it in my tree two days ago.
> 
> > but the patch is a big improvement on what's there:
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > also tested on an RDMA system.
> 
> Thank you!
> 
> I think it's okay to merge it using the -trivial tree, I'm about to
> send a pull request today.

Yes, OK, although I'd generally prefer the RDMA stuff to go
through migration unless it's really trivial.

Dave

> 
> /mjt
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

