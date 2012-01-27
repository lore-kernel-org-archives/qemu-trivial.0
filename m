Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqj0h-0000K9-8Q
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 05:26:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Rqj0c-0000EN-Nn
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 05:26:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Rqj0W-0005k7-AT
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 05:26:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Rqj0W-0005jx-3v; Fri, 27 Jan 2012 05:26:12 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0RAQAaa010217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 05:26:10 -0500
Received: from redhat.com (dhcp-1-188.lcy.redhat.com [10.32.224.188])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0RAQ7nJ006863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 27 Jan 2012 05:26:09 -0500
Date: Fri, 27 Jan 2012 10:26:06 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120127102606.GC6522@redhat.com>
References: <1327613801-5828-1-git-send-email-lersek@redhat.com>
	<20120127063639.GA22748@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20120127063639.GA22748@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] keep the PID file locked
 for the lifetime of the process
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 10:26:21 -0000

On Fri, Jan 27, 2012 at 06:36:39AM +0000, Stefan Hajnoczi wrote:
> On Thu, Jan 26, 2012 at 10:36:41PM +0100, Laszlo Ersek wrote:
> > The lockf() call in qemu_create_pidfile() aims at ensuring mutual
> > exclusion. We shouldn't close the pidfile on success, because that drops
> > the lock as well [1]:
> > 
> >     "File locks shall be released on first close by the locking process
> >     of any file descriptor for the file."
> > 
> > Coverity may complain again about the leaked file descriptor; let's
> > worry about that later.
> > 
> > [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html
> > 
> > Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > ---
> 
> Isn't the normal way to do pidfiles O_CREAT | O_EXCL?  It may not work
> on all NFS versions but putting the pidfile on NFS doesn't really make
> sense.
> 
> Then we can drop the lockf(3) completely.

IMHO it is preferable to use lockf because that makes sure you are crash
safe, so you don't get later bogus startup failures due to stale pidfiles


Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

