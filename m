Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjPfd-0008CX-1o
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 03:59:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjPfS-000829-5B
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 03:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjPfK-0004X4-SW
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 03:59:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UjPf6-0004UG-FY; Mon, 03 Jun 2013 03:58:40 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r537wc7a022806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 03:58:39 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r537wb4p015453; Mon, 3 Jun 2013 03:58:38 -0400
Date: Mon, 3 Jun 2013 09:58:36 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130603075836.GC9435@stefanha-thinkpad.redhat.com>
References: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
	<51A89B9D.9010404@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51A89B9D.9010404@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] do not check pointers after
 dereferencing them
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
X-List-Received-Date: Mon, 03 Jun 2013 07:59:12 -0000

On Fri, May 31, 2013 at 06:46:21AM -0600, Eric Blake wrote:
> On 05/31/2013 06:00 AM, Paolo Bonzini wrote:
> > Two instances, both spotted by Coverity.  In one, two blocks were
> > swapped.  In the other, the check is not needed anymore.
> > 
> > Cc: qemu-stable@nongnu.org
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  monitor.c |  2 +-
> >  savevm.c  | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> This version of the savevm.c fix is nicer than Stefan's attempt:
> https://lists.gnu.org/archive/html/qemu-devel/2013-05/msg04506.html
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

I'll drop mine.  I didn't dare to swap the blocks just in case something
dependend on doing the popen() and bailing out afterwards, but it's hard
to imagine that.

Stefan

