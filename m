Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QoYUE-00082g-LJ
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2011 06:15:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QoYUC-0007tK-AP
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QoYUB-0007JQ-Ee
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 06:15:36 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:61056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QoYU9-0007J3-26; Wed, 03 Aug 2011 06:15:33 -0400
Received: by wye20 with SMTP id 20so206098wye.4
	for <multiple recipients>; Wed, 03 Aug 2011 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9O04Kw4okEKEJuq+b3CTQUrbYTb9RoWJfT/0DmwlQ3M=;
	b=jjDPvCI/VCDAA2YkFLfvXEZnEZnDNtXmzHN25b46YU45gz+5jVAbM1XmXYQQHRkiJ5
	ShvW7BidhyLSzvmy6noqZbAB++Sca/4p9BJkjHAUa8m9pJMsBZuaXnncm8aR/wCupqNK
	BClwbTh8sg38iSxkX7NGsukksmw0I6weERvm4=
Received: by 10.216.67.143 with SMTP id j15mr2653008wed.110.1312366532110;
	Wed, 03 Aug 2011 03:15:32 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id e56sm429123wed.41.2011.08.03.03.15.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 03:15:31 -0700 (PDT)
Date: Wed, 3 Aug 2011 11:15:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20110803101527.GB4658@stefanha-thinkpad.localdomain>
References: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
	<CAJSP0QXvArm0_j0MgsJ2=nJWuGTGSMVTNbPBZYO5S+VuUY-uwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QXvArm0_j0MgsJ2=nJWuGTGSMVTNbPBZYO5S+VuUY-uwA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Check fread() results to avoid gcc 4.6
 warnings
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
X-List-Received-Date: Wed, 03 Aug 2011 10:15:37 -0000

On Mon, Aug 01, 2011 at 11:19:38AM +0100, Stefan Hajnoczi wrote:
> On Mon, Aug 1, 2011 at 7:49 AM, David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > When compiling with gcc 4.6, some code in fw_cfg.c complains that fop_ret
> > is assigned but not used (which is true).  However, it looks like the
> > meaningless assignments to fop_ret were done to suppress other gcc warnings
> > due to the fact that fread() is labelled as warn_unused_result in glibc.
> >
> > This patch avoids both errors, by actually checking the fread() result code
> > and dropping out with an error message if it fails.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/fw_cfg.c |   13 +++++++++++++
> >  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

I'm not taking this into the trivial-patches tree because a build fix
like this should be merged sooner.  With trivial-patches I only send one
pull request per week and in the meantime people would have to
./configure --disable-werror which isn't good.

Stefan

