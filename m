Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SeRs9-0000CM-QY
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2012 10:15:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SeRrz-00009H-Hd
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 10:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SeRrt-0005PR-Qe
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 10:14:55 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:63323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SeRrt-0005OH-G8; Tue, 12 Jun 2012 10:14:49 -0400
Received: by dadv2 with SMTP id v2so7596045dad.4
	for <multiple recipients>; Tue, 12 Jun 2012 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AQyxVYF2cva8bJoe+xPVmo4olZ87aQ1jZDYvoXU85DY=;
	b=AQ0RuWFJxVsc8izY6ZGjbfavwGcJSyVS4pu1huUQnXj4p+p5Rg/XYsQPxEJXsf48uS
	PA9pfBtdz5KV/UF9BcismjT2iTEnSUy0/7g8sFQwIovDCBvl2CZQzY9ntGNsekYWARHP
	FNoa3rc49HceTmi0/EYy9l4bUsglytTZETPg3FQzeyO+7FkdxWlo2TRRMNnM5WNx8icI
	aV7rRSXHZgueoWnSZ3eYYPm16IByYWo3VTwqJIeJGiVx6xRXFLoFa1mJEEAq7KAp5H1s
	yraXhE6O+s9RqvwGus6QBrrqTKP3wqiUtgJDR6M+b5tcGDVAsTFDIM/SeAV95RFw079O
	9hfA==
Received: by 10.68.232.103 with SMTP id tn7mr38314910pbc.86.1339510485912;
	Tue, 12 Jun 2012 07:14:45 -0700 (PDT)
Received: from illuin.morrigu.org ([32.97.110.59])
	by mx.google.com with ESMTPS id x1sm2149110pbp.50.2012.06.12.07.14.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 07:14:44 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Received: by illuin.morrigu.org (sSMTP sendmail emulation);
	Tue, 12 Jun 2012 09:14:39 -0500
Date: Tue, 12 Jun 2012 09:14:39 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120612141439.GA11828@illuin>
References: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
	<20120612094957.GC29104@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120612094957.GC29104@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: Remove
	BUILD_DIR from qapi-dir
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
X-List-Received-Date: Tue, 12 Jun 2012 14:15:05 -0000

On Tue, Jun 12, 2012 at 10:49:57AM +0100, Stefan Hajnoczi wrote:
> On Sat, Jun 09, 2012 at 09:08:38AM +0200, Stefan Weil wrote:
> > qapi-dir does not need an absolute path. All other build directories
> > are relative. When BUILD_DIR is removed, the build output looks better
> > (no long lines with absolute paths when everything else uses short
> > lines):
> > 
> >   GEN   qapi-generated/qga-qapi-types.c
> >   CC    qapi-generated/qga-qapi-types.o
> >   GEN   qapi-generated/qga-qapi-visit.c
> >   CC    qapi-generated/qga-qapi-visit.o
> >   GEN   qapi-generated/qga-qmp-marshal.c
> >   CC    qapi-generated/qga-qmp-marshal.o
> > 
> > Using a relative path also avoids potential problems when BUILD_DIR
> > includes blanks.
> > 
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >  Makefile |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I merged this but have CCed Michael Roth to take a look.  qemu.git
> contains an earlier commit to explicitly add $(BUILD_DIR):
> 
> commit 9b129408589b2ed7bb2cdea03d2aba46a5fd74d4
> Author: Michael Roth <mdroth@linux.vnet.ibm.com>
> Date:   Tue Nov 29 16:47:49 2011 -0600
> 
>     Makefile: use full path for qapi-generated directory
>     
>     Generally $(BUILD_DIR) == $(CURDIR), but that isn't necessarilly the
>     case, so use $(BUILD_DIR)/qapi-generated for generated files to
>     avoid potentionally sticking generating files in odd places outside
>     the build's include paths.
>     
>     Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> 
> Does this rationale still apply?  Is it really a good ideal to remove
> $(BUILD_DIR)?

Here's some context for the patch:

http://lists.gnu.org/archive/html/qemu-devel/2011-11/msg03474.html

Originally a change was made to add a $(SRC_DIR) prefix to fix a build.
This triggered an unrelated bug, and was not quite correct. I submitted
a patch to fix the bug it triggered, and then a patch that used
$(BUILD_DIR) instead.

I'm not sure the latter was ever needed however, it looks like it was
just the classic issue of someone having a dirty $(SRC_DIR) and
subsequently switching to out of tree builds. I think the original issue
was simple a stale qapi-generated/ directory sitting in $(SRC_DIR) that
was taking precedence over the one being created in $(BUILD_DIR)

So, while having the $(BUILD_DIR) prefix does make the build safer in
this regard, I think it addresses a use-case that was never supported to
begin with. So I'd be fine with applying Stefan's patch if it makes
things cleaner/more consistent with everything else.

> 
> Stefan
> 

