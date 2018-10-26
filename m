Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG3zJ-0001r3-8M
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:25:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gG3zG-0001ot-Mh
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gG3zA-0007qs-Ul
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:25:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gG3z4-0007Dm-2M; Fri, 26 Oct 2018 11:25:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2084B37E8F;
	Fri, 26 Oct 2018 15:25:08 +0000 (UTC)
Received: from localhost (unknown [10.33.36.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE1DD271BF;
	Fri, 26 Oct 2018 15:25:02 +0000 (UTC)
Date: Fri, 26 Oct 2018 12:25:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
Message-ID: <20181026152501.GG3902@habkost.net>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-10-crosa@redhat.com>
	<b590e7a3-c0e8-f39b-8a9b-b56d4804a6bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b590e7a3-c0e8-f39b-8a9b-b56d4804a6bc@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 26 Oct 2018 15:25:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH 09/10]
 scripts/qemu.py: use a more consistent docstring style
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 15:25:23 -0000

On Mon, Oct 08, 2018 at 03:44:14PM -0400, John Snow wrote:
> 
> 
> On 10/04/2018 12:18 PM, Cleber Rosa wrote:
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  dtc             |  2 +-
> >  scripts/qemu.py | 65 +++++++++++++++++++++++++++++++------------------
> >  2 files changed, 42 insertions(+), 25 deletions(-)
> > 
> > diff --git a/dtc b/dtc
> > index 88f18909db..e54388015a 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 88f18909db731a627456f26d779445f84e449536
> > +Subproject commit e54388015af1fb4bf04d0bca99caba1074d9cc42
> > diff --git a/scripts/qemu.py b/scripts/qemu.py
> > index f099ce7278..7abe26de69 100644
> > --- a/scripts/qemu.py
> > +++ b/scripts/qemu.py
> > @@ -53,9 +53,9 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
> >      """
> >  
> >  class MonitorResponseError(qmp.qmp.QMPError):
> > -    '''
> > +    """
> >      Represents erroneous QMP monitor reply
> > -    '''
> > +    """
> 
> This seems obviously correct, as per the Python Dogma Handbook ...
> 
[...]
> >      def add_fd(self, fd, fdset, opaque, opts=''):
> > -        '''Pass a file descriptor to the VM'''
> > +        """
> > +        Pass a file descriptor to the VM
> > +        """
> 
> However, is it established practice among ne'er-do-wells to format
> one-line docstrings as three-liners? (And without punctuation to boot --
> for shame!)
> 
> PEP257 suggests that one-liners are allowed, but doesn't seem to
> necessitate their usage. Does this kind of change have any kind of benefit?

I don't mind having one-line docstrings.  But if we're already
touching multiple docstrings, consistency with the rest of the
module code sounds nice.

I'm queueing this on python-next.

-- 
Eduardo

