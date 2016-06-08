Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAcuT-0005OV-T7
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 08:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bAcuR-0005MK-DA
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 08:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bAcuM-0003Ny-OZ
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 08:48:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bAcuG-0003MW-8g; Wed, 08 Jun 2016 08:48:24 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A754821C3;
	Wed,  8 Jun 2016 12:48:23 +0000 (UTC)
Received: from redhat.com (vpn1-6-33.ams2.redhat.com [10.36.6.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58CmK0m024384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 8 Jun 2016 08:48:22 -0400
Date: Wed, 8 Jun 2016 13:48:20 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Message-ID: <20160608124819.GI7760@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 08 Jun 2016 12:48:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
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
X-List-Received-Date: Wed, 08 Jun 2016 12:48:36 -0000

On Wed, Jun 08, 2016 at 01:16:59PM +0100, Maciej W. Rozycki wrote:
> On Mon, 16 May 2016, Stefan Weil wrote:
> 
> > This fixes these warnings from shellcheck:
> > 
> >     ^-- SC2006: Use $(..) instead of deprecated `..`
> > 
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> > 
> > More warnings from shellcheck for configure and other files
> > will be handled by later patches.
> 
>  Unlike `..` the $(..) Bourne shell construct is not fully portable, some 
> implementations do not recognise it.  Consequently this change potentially 
> breaks building QEMU on some systems, possibly in a non-obvious way, as 
> there's no explicit check for the presence this feature and a graceful 
> failure path included with this patch or the other one AFAICT.  We may or 
> may not care about those systems, but still this is a functional 
> regression and therefore I think there has to be a good reason for 
> introducing it.

I found that the bash wiki has a note about this

  http://wiki.bash-hackers.org/scripting/obsolete

  "This is the older Bourne-compatible form of the command substitution.
   Both the `COMMANDS` and $(COMMANDS) syntaxes are specified by POSIX,
   but the latter is _greatly_ preferred, though the former is unfortunately
   still very prevalent in scripts. New-style command substitutions are
   widely implemented by every modern shell (and then some). The only
   reason for using backticks is for compatibility with a real Bourne
   shell (like Heirloom). Backtick command substitutions require special
   escaping when nested, and examples found in the wild are improperly
   quoted more often than not."

>  So what's the technical justification -- beyond shutting up some random 
> checker tool -- for making this change?  Does the benefit recognised in 
> making this change outweigh the limitation introduced?  How about handling 
> failures properly?

Seems the main benefit of $(...) is around escaping/quoting. Since `..`
is in POSIX and widely used, support for it is never going to be deleted,
regardless of whether people decide to call it 'deprecated'. IOW, unless
QEMU hits the issue with the escaping/quoting, there's no compelling reason
to avoid `...`

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

