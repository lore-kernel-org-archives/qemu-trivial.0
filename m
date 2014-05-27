Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpHty-0000SB-VF
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 09:58:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WpHtp-0000QY-Os
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WpHti-00016r-9d
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:58:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WpHti-00016l-1O; Tue, 27 May 2014 09:58:34 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4RDwWBJ001997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 27 May 2014 09:58:32 -0400
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4RDwUH4009241; Tue, 27 May 2014 09:58:31 -0400
Date: Tue, 27 May 2014 15:58:30 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140527135830.GH31463@stefanha-thinkpad.redhat.com>
References: <1401068643-28655-1-git-send-email-tamlokveer@gmail.com>
	<20140526123922.GF10187@stefanha-thinkpad.redhat.com>
	<87k398twfd.fsf@blackfin.pond.sub.org>
	<20140526151624.GB3813@noname.str.redhat.com>
	<87vbssr0oo.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87vbssr0oo.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, peter.crosthwaite@xilinx.com,
	qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	mjt@tls.msk.ru, Le Tan <tamlokveer@gmail.com>,
	qemu-devel@nongnu.org, jan.kiszka@web.de, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] block: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Tue, 27 May 2014 13:58:49 -0000

On Mon, May 26, 2014 at 05:59:03PM +0200, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 26.05.2014 um 17:02 hat Markus Armbruster geschrieben:
> >> Stefan Hajnoczi <stefanha@gmail.com> writes:
> >> 
> >> > On Mon, May 26, 2014 at 09:44:03AM +0800, Le Tan wrote:
> >> >> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
> >> >> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
> >> >> have been removed because @fmt of error_report() should not
> >> >> contain newline.
> >> >> 
> >> >> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> >> >> ---
> >> >>  block-migration.c      |    6 +--
> >> >>  block.c                |    4 +-
> >> >>  block/qcow2-refcount.c |  115 +++++++++++++++++++++---------------------
> >> >>  block/qcow2.c          |   16 +++---
> >> >>  block/raw-posix.c      |    8 ++-
> >> >>  block/raw-win32.c      |    6 +--
> >> >>  block/ssh.c            |    2 +-
> >> >>  block/vdi.c            |   14 +++---
> >> >>  block/vmdk.c           |   15 +++---
> >> >>  block/vpc.c            |    4 +-
> >> >>  block/vvfat.c | 129
> >> >> ++++++++++++++++++++++++------------------------
> >> >>  blockdev.c             |    6 +--
> >> >>  12 files changed, 159 insertions(+), 166 deletions(-)
> >> >
> >> > There is one thing that worries me about this:
> >> >
> >> > error_report() assumes that the QEMU global mutex is held in order to
> >> > access the "current monitor".
> >> 
> >> Global variable cur_mon, non-null while we're executing a monitor
> >> command.
> >
> > The important part here is that it's indeed global and not thread-local.
> >
> >> > This is problematic for code in the read/write/flush path (like qcow2
> >> > refcount allocation) since it can be invoked from a virtio-blk
> >> > data-plane thread (where the QEMU global mutex is not held).
> >> 
> >> error_report() reports to the current monitor when "in monitor context",
> >> i.e. while executing a monitor command, i.e. while cur_mon isn't null.
> >> 
> >> Can we ever be in monitor context (cur_mon not null) without holding the
> >> global mutex?
> >
> > The right question is: Can a thread (= the main loop thread) ever be in
> > monitor context while another thread (= dataplane thread) is executing
> > block driver code and doesn't hold the global mutex?
> >
> > If I understand dataplane correctly, the whole point of it is that the
> > answer to this is yes.
> 
> Well, the answer used to be "no".  Once upon a time because there was
> just a single thread, later on because only one thread ever executed
> "interesting" code.
> 
> I'm *not* saying this should remain the case.  I'm trying to find out
> what needs to be done around cur_mon when we break the assumption behind
> it.
> 
> Would making cur_mon thread-local suffice?

It would suffice.

I think there is no code that invokes error_report() from another thread
on purpose (i.e. it knows the main thread is waiting), so making it
thread-local should not introduce a regression.

Stefan

