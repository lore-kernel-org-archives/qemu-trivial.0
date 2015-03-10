Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVFs1-00070a-Qb
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 04:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVFs0-0006yV-0Q
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 04:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YVFrz-0007H1-0Z
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 04:50:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YVFrs-00079Y-Qy; Tue, 10 Mar 2015 04:50:24 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2A8oJVG003081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 04:50:19 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t2A8oH8M029038; Tue, 10 Mar 2015 04:50:17 -0400
Date: Tue, 10 Mar 2015 09:50:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150310085016.GC3770@noname.str.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: famz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com,
	Peter Wu <peter@lekensteyn.nl>, stefanha@redhat.com
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
X-List-Received-Date: Tue, 10 Mar 2015 08:50:33 -0000

Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
> block/dmg can use additional library (libbz2) to read
> bzip2-compressed files.  Make the block driver to be
> a module if libbz2 support is requested, to avoid extra
> library dependency by default.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

First of all: I don't think this is suitable for trivial. The actual
code change might be small, but the change in behaviour is important and
needs discussion.

> This might be questionable, to make the thing to be either
> module or built-in depending on build environment, so a
> better idea may be to make it modular unconditionally.
> This block device format isn't used often.

Yes, I'm concerned that making it conditional might be a bit surprising.
I'd like to hear some more opinions before applying this.

Also, should we consider making some more rarely used image formats
modules even if they don't pull in external dependencies?

Kevin

