Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0VES-0005go-36
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 09:30:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VEN-0005e2-P0
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VEJ-0007Az-CH
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:30:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Z0VEE-000798-HM; Thu, 04 Jun 2015 09:30:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 1DE93B8BCA;
	Thu,  4 Jun 2015 13:30:38 +0000 (UTC)
Received: from redhat.com (wlan-5-24.fab.redhat.com [10.33.5.24])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t54DUZ7d026742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Jun 2015 09:30:37 -0400
Date: Thu, 4 Jun 2015 14:30:35 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150604133034.GB27201@redhat.com>
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
	<87twupxmgj.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87twupxmgj.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
 configure emacs coding style
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
X-List-Received-Date: Thu, 04 Jun 2015 13:30:51 -0000

On Wed, Jun 03, 2015 at 09:47:24AM +0200, Markus Armbruster wrote:
> "Daniel P. Berrange" <berrange@redhat.com> writes:
> 
> > The default emacs setup indents by 2 spaces and uses tabs
> > which is counter to the QEMU coding style rules. Adding a
> > .dir-locals.el file in the top level of the GIT repo will
> > inform emacs about the QEMU coding style, and so assist
> > contributors in avoiding common style mistakes before
> > they submit patches.
> 
> Yes, please!
> 
> > Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> > ---
> >  .dir-locals.el | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 .dir-locals.el
> >
> > diff --git a/.dir-locals.el b/.dir-locals.el
> > new file mode 100644
> > index 0000000..ddb2fae
> > --- /dev/null
> > +++ b/.dir-locals.el
> > @@ -0,0 +1,8 @@
> > +(
> > + (c-mode . (
> > +            (c-file-style . "K&R")
> > +            (indent-tabs-mode . nil)
> > +            (c-indent-level . 4)
> > +            (c-basic-offset . 4)
> > +            ))
> > +)

[snip]

> Does the following .dir-locals.el work for you equally well?
> 
> ((c-mode . ((c-file-style . "stroustrup")
>             (indent-tabs-mode . nil))))

Yes, that is fine too.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

