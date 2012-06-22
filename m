Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Shzsf-0003nP-Fp
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:10:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzsY-0003Tq-ER
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:10:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzsQ-0000Xl-Ll
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:10:09 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:42588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ShzsQ-0000TM-DY; Fri, 22 Jun 2012 05:10:02 -0400
Received: by wgbds1 with SMTP id ds1so509310wgb.4
	for <multiple recipients>; Fri, 22 Jun 2012 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xw+6QdVocDRotTCmUxNoaVrrBkHGKmCrvG6+cvKwDTs=;
	b=U+lnMH2697CTgX3QA3FMZ1DFNYwND8fQSlkPFYJk8ZZ12p0+gXpcZFcKvXMIWQ3ZUv
	tjE2jU+SgLT3xL8ISR/Wa+Q42w1a4kpFxokQ8gJEvMlXYr8o2MR1udxzIh0ZjbMDiS6p
	iIRW+atf/4uCDpv8nRQe0odZqNlqWO89xlfDFANL0nd8sLH2sRYRkaezEpZrEWspXevi
	yKLsNUbOtRzcPIOjVZk9N5O+nlXim8V++Xzk9VlVkyvgU+3EtQzg/6J82BMHECOdgOlW
	VP6O0z4NbScSDuqnWDaYIDwMVhGEenWqxhUJplkBCFoimwcY91CNk2TNqV+5PG2XbaCl
	QaBQ==
Received: by 10.181.13.142 with SMTP id ey14mr3501553wid.19.1340356196512;
	Fri, 22 Jun 2012 02:09:56 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id n6sm98419063wie.7.2012.06.22.02.09.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:09:56 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:09:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120622090954.GE27038@stefanha-thinkpad.localdomain>
References: <1340208444-14440-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340208444-14440-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Support
	INDEX_op_bswap64_i64
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
X-List-Received-Date: Fri, 22 Jun 2012 09:10:16 -0000

On Wed, Jun 20, 2012 at 06:07:24PM +0200, Stefan Weil wrote:
> Running the Windows 7 (64 bit) boot process needs INDEX_op_bswap64_i64.
> It was already implemented, but untested. Remove the TODO() statement.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tci.c |    1 -
>  1 file changed, 1 deletion(-)

If you weren't TCI maintainer I would ask for this patch to go through
your tree because I don't touch TCG and this is declaring an operation
supported, which the maintainer needs to be okay with.  Anyway, this is
fine since it's coming from you.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

