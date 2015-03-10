Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVK9D-0003nS-HZ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 09:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YVK9B-0003jQ-0J
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YVK99-0000HU-RU
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:24:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YVK92-0000Fv-Mz; Tue, 10 Mar 2015 09:24:24 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2ADOJQF011164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 09:24:19 -0400
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2ADOG0u012282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 10 Mar 2015 09:24:18 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1F4BA303FEBB; Tue, 10 Mar 2015 14:24:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
Date: Tue, 10 Mar 2015 14:24:16 +0100
In-Reply-To: <20150310100936.GD3770@noname.str.redhat.com> (Kevin Wolf's
	message of "Tue, 10 Mar 2015 11:09:36 +0100")
Message-ID: <87mw3lx9xb.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Tue, 10 Mar 2015 13:24:34 -0000

Kevin Wolf <kwolf@redhat.com> writes:

> Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
>> On Tue, 03/10 09:50, Kevin Wolf wrote:
>> > Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
>> > > block/dmg can use additional library (libbz2) to read
>> > > bzip2-compressed files.  Make the block driver to be
>> > > a module if libbz2 support is requested, to avoid extra
>> > > library dependency by default.
>> > > 
>> > > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> > 
>> > First of all: I don't think this is suitable for trivial. The actual
>> > code change might be small, but the change in behaviour is important and
>> > needs discussion.
>> > 
>> > > This might be questionable, to make the thing to be either
>> > > module or built-in depending on build environment, so a
>> > > better idea may be to make it modular unconditionally.
>> > > This block device format isn't used often.
>> > 
>> > Yes, I'm concerned that making it conditional might be a bit surprising.
>> > I'd like to hear some more opinions before applying this.
>> 
>> I don't see the advantage over making it an unconditional module - condition
>> only makes it a bit more complicated.
>> 
>> > 
>> > Also, should we consider making some more rarely used image formats
>> > modules even if they don't pull in external dependencies?
>> 
>> Sounds reasonable to me. Is the intention to reduce binary size?

Fair argument, but not a paricularly weighty one.  The unused code never
gets paged in, mostly, and isn't particularly large to begin with.

> Yes, that and also that it allows compiling out some drivers without
> having to mess with the Makefiles. You just don't install all of them.

Second best solution of the configuration management problem "select a
subset of the available block drivers", good enough when compiling the
unused ones isn't bothersome.  But the best solution is still
configuration management capable of disabling optional components.

> Related to that, Peter also mentioned that you (the user, not developer
> or packager) could simply disable a single driver, for example as a
> temporary hotfix in the case of security problems in a block driver.
> That would actually be an argument for making _all_ drivers modules.

And pretty much every other optional component.

For me, avoiding bothersome dependencies is a strong practical argument
for making a something a loadable module.  Other benefits of loadable
modules presented so far seem pretty negligible to me.  If you want
them, no objection from me, as long as the cost is similarly negligible,
additional complexity for developers, packagers and users in particular.

