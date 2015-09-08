Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZG01-0000TY-DW
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 06:19:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZFzy-0000Ol-Sb
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 06:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZFzx-0005VH-TK
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 06:19:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZZFzs-0005T3-J5; Tue, 08 Sep 2015 06:19:28 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id F0CA6C0B988E;
	Tue,  8 Sep 2015 10:19:27 +0000 (UTC)
Received: from redhat.com (dhcp-1-214.lcy.redhat.com [10.32.224.214])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88AJPFn016501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 8 Sep 2015 06:19:27 -0400
Date: Tue, 8 Sep 2015 11:19:24 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150908101924.GD4307@redhat.com>
References: <1441704488-9512-1-git-send-email-berrange@redhat.com>
	<55EEABD3.2090903@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55EEABD3.2090903@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH repost] gtk: avoid redefining
	_WIN32_WINNT macro
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
X-List-Received-Date: Tue, 08 Sep 2015 10:19:36 -0000

On Tue, Sep 08, 2015 at 11:35:15AM +0200, Paolo Bonzini wrote:
> 
> 
> On 08/09/2015 11:28, Daniel P. Berrange wrote:
> > In file included from ui/gtk.c:40:0:
> > include/ui/gtk.h:5:0: warning: "_WIN32_WINNT" redefined
> >  # define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
> >   ^
> > In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10:0,
> >                  from /usr/i686-w64-mingw32/sys-root/mingw/include/stdio.h:9,
> >                  from /home/berrange/src/virt/qemu/include/qemu/fprintf-fn.h:12,
> >                  from /home/berrange/src/virt/qemu/include/qemu-common.h:18,
> >                  from ui/gtk.c:37:
> > /usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:225:0: note: this is the location of the previous definition
> >  #define _WIN32_WINNT 0x502
> >  ^
> > 
> > Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> > ---
> >  include/ui/gtk.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> > index ee6dffd..7796231 100644
> > --- a/include/ui/gtk.h
> > +++ b/include/ui/gtk.h
> > @@ -2,7 +2,9 @@
> >  #define UI_GTK_H
> >  
> >  #ifdef _WIN32
> > -# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
> > +# ifndef _WIN32_WINNT
> > +#  define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
> > +# endif
> >  #endif
> 
> Your error message shows that _WIN32_WINNT was 0x0502, do you get
> MAPVK_VK_TO_VSC with this patch?

Yes, it still sees that constant just fine and compiles without error.

Interestingly, looking at the header files in mingw64 for Fedora 18
and Fedora 22, I see

#define MAPVK_VK_TO_VSC    0
#define MAPVK_VSC_TO_VK    1
#define MAPVK_VK_TO_CHAR   2
#define MAPVK_VSC_TO_VK_EX 3
#if (_WIN32_WINNT >= 0x0600)
#define MAPVK_VK_TO_VSC_EX 4
#endif

IOW, the constant we use is made available unconditionally, only
the _EX variant needs the _WIN32_WINNT definition.

I wonder if there are some very old mingw versions which lack it
though ?

> Perhaps #undef the macro first, or do something like:
> 
> #if !defined _WIN32_WINNT || _WIN32_WINNT < 0x0601
> # undef _WIN32_WINNT
> # define _WIN32_WINNT 0x0601
> #endif

Perhaps a better way is to avoid the WINNT stuff entirely and instead
directly define the constant we actually care about. eg

 #ifnef MAPVK_VK_TO_VSC
 # define MAPVK_VK_TO_VSC 0
 #endif

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

