Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJ1Z3-0007yJ-KF
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2019 16:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJ1Z0-0007uT-Bj
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 16:31:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJ1Yz-0002Pw-8l
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 16:31:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJ1Ys-0002M8-Iz; Fri, 11 Oct 2019 16:30:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 68DD2C024B00;
 Fri, 11 Oct 2019 20:30:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CD845C223;
 Fri, 11 Oct 2019 20:30:47 +0000 (UTC)
Date: Fri, 11 Oct 2019 22:30:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 1/4] qemu-iotests: remove bash shebang from library
 files
Message-ID: <20191011203046.GI5158@localhost.localdomain>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-2-crosa@redhat.com>
 <20191011093610.GD5158@localhost.localdomain>
 <CAMRbyyu=NdwhKFwb=JzMyHfbnP4XzzpaHTCd7ucT7tLEk9HdFA@mail.gmail.com>
 <20191011200501.GA18783@dhcp-17-179.bos.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011200501.GA18783@dhcp-17-179.bos.redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 11 Oct 2019 20:30:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2019 20:31:04 -0000

Am 11.10.2019 um 22:05 hat Cleber Rosa geschrieben:
> On Fri, Oct 11, 2019 at 02:27:25PM +0300, Nir Soffer wrote:
> > On Fri, Oct 11, 2019, 12:36 Kevin Wolf <kwolf@redhat.com> wrote:
> > 
> > > Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> > > > Due to not being able to find a reason to have shebangs on files that
> > > > are not executable.
> > > >
> > > > While at it, add a mode hint to emacs, which would be clueless or
> > > > plain wrong about these containing shell code.
> > >
> > > vim still doesn't like the change.
> > >
> > > Of course, we could also add another line for vim and for every other
> > > editor in use, but actually, I think I'd prefer just dropping this
> > > patch. It even makes each file a few bytes larger instead of saving
> > > something. Shebang lines are a shorter and more portable format
> > > indicator than the alternatives.
> > >
> > > So I think in the end we have found a good reason to keep them. :-)
> > 
> > What about .sh suffix? Should be most portable way.
> 
> That's the approach I tend to follow for my sh code.  Explicit is
> better than implicit if you ask me.

I would certainly agree for new files.

> Kevin,
> 
> Do you have any strong feelings here?  I'd be fine with either this
> or dropping the patch.

No strong feelings. The result of renaming the files would be a bit
nicer than what we have today, but renaming always comes with a cost
when working with the version history later. Hard to tell if it's a net
gain or loss in the end.

Myself, I would probably pick the lazy way and stick with "if it ain't
broke, don't fix it", but I'm not objecting to a change either.

Kevin

