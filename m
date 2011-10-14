Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REi9l-0002o4-Pt
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 09:50:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1REi9j-0002eO-8R
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 09:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1REi9i-0003IW-E9
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 09:50:35 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:56515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1REi9Z-0003H3-Gf; Fri, 14 Oct 2011 09:50:25 -0400
Received: by wwg14 with SMTP id 14so3098407wwg.10
	for <multiple recipients>; Fri, 14 Oct 2011 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aZEhAaa21hNtr2KBtHsMwSWMpa3545pKQadq1ggZEXA=;
	b=HywVqGudNdXSUNM9yOIz9rIdL1dfSGVhWioCp6ssVxQxRmoKJpSA2A5/gnAIkQmZFk
	c9tiL29Fo8ltVEy3sC7sWi3MGfBrRehB5A1B/1yvgLe6aXvx4h/BX5Q2RoUkkbT+0NGZ
	EhPyLCrY2gq0d7bV9mzi4+jzYUCKYRdgU0SuY=
Received: by 10.216.229.194 with SMTP id h44mr1585609weq.44.1318600224298;
	Fri, 14 Oct 2011 06:50:24 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	es5sm14314464wbb.11.2011.10.14.06.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 06:50:23 -0700 (PDT)
Date: Fri, 14 Oct 2011 14:50:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dmitry Koshelev <karaghiozis@gmail.com>
Message-ID: <20111014135020.GA8108@stefanha-thinkpad.localdomain>
References: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ARM GIC and CPU state
	saving/loading fix
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
X-List-Received-Date: Fri, 14 Oct 2011 13:50:36 -0000

On Fri, Oct 14, 2011 at 05:25:29PM +0400, Dmitry Koshelev wrote:
> Fixes two trivial indices errors.
> 
> Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
> ---
>  hw/arm_gic.c         |   12 ++++++------
>  target-arm/machine.c |    4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)

Not obvious to me what the implications are.  CCed Peter Maydell so it
can go through his ARM tree.

Stefan

