Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKhT-0001d3-96
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 09:59:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVKhR-0001cu-0S
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVKhN-0005dW-07
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:59:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YVKhC-0005Xx-Vg; Tue, 10 Mar 2015 09:59:43 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2ADxbKs031014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 09:59:37 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t2ADxZql006296; Tue, 10 Mar 2015 09:59:35 -0400
Date: Tue, 10 Mar 2015 14:59:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150310135934.GF3770@noname.str.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
	<87mw3lx9xb.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mw3lx9xb.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Peter Wu <peter@lekensteyn.nl>, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/dmg: make it modular
 if using additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 13:59:58 -0000

Am 10.03.2015 um 14:24 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
> >> On Tue, 03/10 09:50, Kevin Wolf wrote:
> >> > Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
> >> > > block/dmg can use additional library (libbz2) to read
> >> > > bzip2-compressed files.  Make the block driver to be
> >> > > a module if libbz2 support is requested, to avoid extra
> >> > > library dependency by default.
> >> > > 
> >> > > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> >> > 
> >> > First of all: I don't think this is suitable for trivial. The actual
> >> > code change might be small, but the change in behaviour is important and
> >> > needs discussion.
> >> > 
> >> > > This might be questionable, to make the thing to be either
> >> > > module or built-in depending on build environment, so a
> >> > > better idea may be to make it modular unconditionally.
> >> > > This block device format isn't used often.
> >> > 
> >> > Yes, I'm concerned that making it conditional might be a bit surprising.
> >> > I'd like to hear some more opinions before applying this.
> >> 
> >> I don't see the advantage over making it an unconditional module - condition
> >> only makes it a bit more complicated.
> >> 
> >> > 
> >> > Also, should we consider making some more rarely used image formats
> >> > modules even if they don't pull in external dependencies?
> >> 
> >> Sounds reasonable to me. Is the intention to reduce binary size?
> 
> Fair argument, but not a paricularly weighty one.  The unused code never
> gets paged in, mostly, and isn't particularly large to begin with.
> 
> > Yes, that and also that it allows compiling out some drivers without
> > having to mess with the Makefiles. You just don't install all of them.
> 
> Second best solution of the configuration management problem "select a
> subset of the available block drivers", good enough when compiling the
> unused ones isn't bothersome.  But the best solution is still
> configuration management capable of disabling optional components.

Yes. Though as far as I know, nobody is currently working on that.

> > Related to that, Peter also mentioned that you (the user, not developer
> > or packager) could simply disable a single driver, for example as a
> > temporary hotfix in the case of security problems in a block driver.
> > That would actually be an argument for making _all_ drivers modules.
> 
> And pretty much every other optional component.
> 
> For me, avoiding bothersome dependencies is a strong practical argument
> for making a something a loadable module.  Other benefits of loadable
> modules presented so far seem pretty negligible to me.  If you want
> them, no objection from me, as long as the cost is similarly negligible,
> additional complexity for developers, packagers and users in particular.

I don't really have a strong opinion either way. I agree that the
benefits wouldn't be huge, but then, it would be easy to do and I
haven't heard yet of any drawbacks either. There may well be some that
I'm not aware of, that's why I'm asking.

Kevin

