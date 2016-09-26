Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boRBL-0007Tq-Bt
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 04:22:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1boRBF-0007Nl-GV
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 04:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1boRBD-000222-GI
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 04:22:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1boRB4-0001x7-5R; Mon, 26 Sep 2016 04:22:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B051C7F76D;
	Mon, 26 Sep 2016 08:22:16 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u8Q8MFU2021368; Mon, 26 Sep 2016 04:22:15 -0400
Date: Mon, 26 Sep 2016 10:22:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20160926082214.GA6093@noname.str.redhat.com>
References: <1474646996-30421-1-git-send-email-thuth@redhat.com>
	<8d0e6f92-a114-2f08-c789-25265e6abea9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d0e6f92-a114-2f08-c789-25265e6abea9@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 26 Sep 2016 08:22:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [Qemu-devel] [PATCH] MAINTAINERS:
 Add some more headers to the IDE section
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
X-List-Received-Date: Mon, 26 Sep 2016 08:22:34 -0000

Am 23.09.2016 um 18:42 hat John Snow geschrieben:
> On 09/23/2016 12:09 PM, Thomas Huth wrote:
> >The folder include/hw/ide/ belongs to the IDE section.
> >
> >Signed-off-by: Thomas Huth <thuth@redhat.com>
> >---
> > MAINTAINERS | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/MAINTAINERS b/MAINTAINERS
> >index d8a0cfc..acf6d6c 100644
> >--- a/MAINTAINERS
> >+++ b/MAINTAINERS
> >@@ -791,6 +791,7 @@ M: John Snow <jsnow@redhat.com>
> > L: qemu-block@nongnu.org
> > S: Supported
> > F: include/hw/ide.h
> >+F: include/hw/ide/
> > F: hw/ide/
> > F: hw/block/block.c
> > F: hw/block/cdrom.c
> >
> 
> Ah, yeah. These got missed when they were moved over. Thanks.
> 
> Reviewed-by: John Snow <jsnow@redhat.com>

Who is supposed to merge this if you only give an R-b?

And didn't we want to move the internal header files back to hw/ instead
of the global include directory?

Kevin

