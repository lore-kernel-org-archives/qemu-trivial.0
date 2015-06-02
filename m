Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzjPG-0005HN-CC
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 06:26:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YzjPE-0005EJ-PZ
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YzjPD-0008AP-VB
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:26:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YzjP8-00085B-57; Tue, 02 Jun 2015 06:26:42 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id C0CA98F29E;
	Tue,  2 Jun 2015 10:26:40 +0000 (UTC)
Received: from localhost (dhcp-14-104.nay.redhat.com [10.66.14.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52AQcOO003125; Tue, 2 Jun 2015 06:26:39 -0400
Date: Tue, 2 Jun 2015 18:26:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150602102637.GD22059@dhcp-14-238.nay.redhat.com>
References: <1433237561-10846-1-git-send-email-famz@redhat.com>
	<556D8266.8060004@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <556D8266.8060004@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sheepdog: Fix error message if failed to
	load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 10:26:49 -0000

On Tue, 06/02 13:16, Michael Tokarev wrote:
> 02.06.2015 12:32, Fam Zheng wrote:
> >          if (ret < 0) {
> > -            error_report("failed to save vmstate %s", strerror(errno));
> > +            if (load) {
> > +                error_report("failed to load vmstate %s", strerror(errno));
> > +            } else {
> > +                error_report("failed to save vmstate %s", strerror(errno));
> > +            }
> 
>  +            error_report("failed to %s vmstate: %s", load ? "load" : "save", strerror(errno));

The reason I didn't use a one-liner was, "git grep 'failed to load vmstate'"
in the code base would just work, besides my eyes also like the readability.

> 
> (note also the addition of ":")

Yes that applies to all error_report() in this file.

> (besides what Kevin said).
> 
> Thanks,

Thanks,

Fam

