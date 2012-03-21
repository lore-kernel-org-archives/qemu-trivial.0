Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAN7m-0002t6-Ta
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 11:06:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SAN7e-0002WX-R4
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 11:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SAN7Y-0001dd-IU
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 11:06:46 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:50162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SAN7O-0001bx-AX; Wed, 21 Mar 2012 11:06:30 -0400
Received: by yenr5 with SMTP id r5so1187530yen.4
	for <multiple recipients>; Wed, 21 Mar 2012 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=dxLPmnSAfSFE5Z5FbIIYXCXEMy9kOTo5jOvu1TqJCQI=;
	b=Mo0D+po4Xu94geujQK+gKHp7DbLRSwtDUQLJnFy12+bQyFchur9NxURGNFaWJ6MdQL
	tXe4jZiZ5el7uOgHewTLILcpcpXvwH1IUOFTJQlHiUaNKp8XrzSy5I6/tVh2yGoG/5+X
	485CA4gKmyX2vyWBqfIYh/BuCXQfdVPj7AwmqY5+AO7363tjon01xWCGT7mc5oG7gIzN
	onAj6uGGpUcULN9ofME7dpi/ljn7QDX62zU4BvEfZ76i/Qvgie1M+dO8sM9euSv64Ui4
	SmXUSi4b/mw9usNfPiRtV62yErsdZiIK90d3c6EWIgbDFof47bAVsIwQwihXtc1pA62p
	saaw==
Received: by 10.60.26.166 with SMTP id m6mr4926489oeg.45.1332342387538;
	Wed, 21 Mar 2012 08:06:27 -0700 (PDT)
Received: from illuin.morrigu.org ([32.97.110.59])
	by mx.google.com with ESMTPS id w4sm1816121obx.2.2012.03.21.08.06.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 08:06:26 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Received: by illuin.morrigu.org (sSMTP sendmail emulation);
	Wed, 21 Mar 2012 10:06:23 -0500
Date: Wed, 21 Mar 2012 10:06:23 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120321150623.GB18965@illuin>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<CAJSP0QXFP-M-d0yX91qY-3--YNse=O=kvRhytZ=+3hmgyuD4AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QXFP-M-d0yX91qY-3--YNse=O=kvRhytZ=+3hmgyuD4AQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] test: remove qemu-ga
	reference
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
X-List-Received-Date: Wed, 21 Mar 2012 15:06:53 -0000

On Wed, Mar 21, 2012 at 11:37:10AM +0000, Stefan Hajnoczi wrote:
> On Tue, Mar 20, 2012 at 12:18 AM, Michael Roth
> <mdroth@linux.vnet.ibm.com> wrote:
> > This was added by mistake a while back.
> >
> > Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> > ---
> >  tests/Makefile |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> After applying your series and rebuilding, I get the following error.
> I checked that there are no auto-generated files left around after
> make distclean.

Shoot, sorry, I must've only tested make check after the change. It looks
like qemu-ga target is relying on that dependency being sourced from
tests/Makefile. I'll send an updated 1/3 that moves it to top-level
Makefile where it should be.

> 
> $ make distclean
> $ ./configure --target-list=x86_64-softmmu --disable-werror
> $ make
>   GEN   x86_64-softmmu/config-devices.mak
>   GEN   config-all-devices.mak
>   GEN   qemu-options.texi
>   GEN   qemu-monitor.texi
>   GEN   qemu-img-cmds.texi
>   GEN   qemu-doc.html
>   GEN   qemu-tech.html
>   GEN   qemu.1
>   GEN   qemu-img.1
>   GEN   qemu-nbd.8
>   GEN   QMP/qmp-commands.txt
>   GEN   config-host.h
>   GEN   trace.h
>   GEN   qemu-options.def
>   GEN   qmp-commands.h
>   GEN   qapi-types.h
>   GEN   qapi-visit.h
>   GEN   /home/stefanha/qemu/qapi-generated/qga-qapi-types.h
>   GEN   /home/stefanha/qemu/qapi-generated/qga-qapi-visit.h
>   GEN   /home/stefanha/qemu/qapi-generated/qga-qmp-commands.h
>   CC    qemu-ga.o
>   CC    qga/commands.o
> qga/commands.c:15:30: fatal error: qga-qmp-commands.h: No such file or directory
> compilation terminated.
> make: *** [qga/commands.o] Error 1
> 

