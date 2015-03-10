Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVGIs-0006wB-2t
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 05:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YVGIq-0006tP-8U
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YVGIp-0002UF-6I
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:18:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YVGIi-0002R4-9c; Tue, 10 Mar 2015 05:18:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2A9I2Wm031700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 05:18:02 -0400
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2A9I0IS013620; Tue, 10 Mar 2015 05:18:01 -0400
Date: Tue, 10 Mar 2015 17:17:59 +0800
From: Fam Zheng <famz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20150310091759.GC14320@ad.nay.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150310085016.GC3770@noname.str.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	armbru@redhat.com, Peter Wu <peter@lekensteyn.nl>, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 09:18:17 -0000

On Tue, 03/10 09:50, Kevin Wolf wrote:
> Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
> > block/dmg can use additional library (libbz2) to read
> > bzip2-compressed files.  Make the block driver to be
> > a module if libbz2 support is requested, to avoid extra
> > library dependency by default.
> > 
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> First of all: I don't think this is suitable for trivial. The actual
> code change might be small, but the change in behaviour is important and
> needs discussion.
> 
> > This might be questionable, to make the thing to be either
> > module or built-in depending on build environment, so a
> > better idea may be to make it modular unconditionally.
> > This block device format isn't used often.
> 
> Yes, I'm concerned that making it conditional might be a bit surprising.
> I'd like to hear some more opinions before applying this.

I don't see the advantage over making it an unconditional module - condition
only makes it a bit more complicated.

> 
> Also, should we consider making some more rarely used image formats
> modules even if they don't pull in external dependencies?

Sounds reasonable to me. Is the intention to reduce binary size?

Fam

