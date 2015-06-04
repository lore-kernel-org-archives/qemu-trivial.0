Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0VwL-0008Nk-VT
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VwG-0008HU-Oh
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VwF-0006oG-Io
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:16:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Z0Vw8-0006mX-Sf; Thu, 04 Jun 2015 10:16:01 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF9119CBFB;
	Thu,  4 Jun 2015 14:16:00 +0000 (UTC)
Received: from redhat.com (wlan-5-24.fab.redhat.com [10.33.5.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t54EFvll022147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Jun 2015 10:15:59 -0400
Date: Thu, 4 Jun 2015 15:15:56 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150604141556.GC27201@redhat.com>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add .dir-locals.el file
 to configure emacs coding style
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
X-List-Received-Date: Thu, 04 Jun 2015 14:16:13 -0000

On Thu, Jun 04, 2015 at 02:41:42PM +0100, Peter Maydell wrote:
> On 4 June 2015 at 14:30, Daniel P. Berrange <berrange@redhat.com> wrote:
> > Some default emacs setups indent by 2 spaces and uses tabs
> > which is counter to the QEMU coding style rules. Adding a
> > .dir-locals.el file in the top level of the GIT repo will
> > inform emacs about the QEMU coding style, and so assist
> > contributors in avoiding common style mistakes before
> > they submit patches.
> >
> > Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> > ---
> >  .dir-locals.el | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 .dir-locals.el
> >
> > diff --git a/.dir-locals.el b/.dir-locals.el
> > new file mode 100644
> > index 0000000..3ac0cfc
> > --- /dev/null
> > +++ b/.dir-locals.el
> > @@ -0,0 +1,2 @@
> > +((c-mode . ((c-file-style . "stroustrup")
> > +           (indent-tabs-mode . nil))))
> 
> My .emacs defines a style like this:
> 
> (defconst qemu-c-style
>   '((indent-tabs-mode . nil)
>     (c-basic-offset . 4)
>     (tab-width . 8)
>     (c-comment-only-line-offset . 0)
>     (c-offsets-alist . ((statement-block-intro . +)
>                         (substatement-open . 0)
>                         (label . 0)
>                         (statement-cont . +)
>                         (innamespace . 0)
>                         (inline-open . 0)
>                         ))
>     (c-hanging-braces-alist .
>                             ((brace-list-open)
>                              (brace-list-intro)
>                              (brace-list-entry)
>                              (brace-list-close)
>                              (brace-entry-open)
>                              (block-close . c-snug-do-while)
>                              ;; structs have hanging braces on open
>                              (class-open . (after))
>                              ;; ditto if statements
>                              (substatement-open . (after))
>                              ;; and no auto newline at the end
>                              (class-close)
>                              ))
>     )
>   "QEMU C Programming Style")
> 
> which is a superset of Stroustrup and gets a few more
> corner cases right, I think.

I'm not fussed about what we use as long as we have something, so I'm
happy to do a v3 using your suggested style instead :)

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

