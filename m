Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QUDzn-0006zP-9b
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2011 04:20:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QUDzk-0006ya-FC
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2011 04:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QUDzi-0006si-7M
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2011 04:20:08 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:55532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QUDzh-0006sU-BF; Wed, 08 Jun 2011 04:20:05 -0400
Received: by wwj40 with SMTP id 40so215749wwj.10
	for <multiple recipients>; Wed, 08 Jun 2011 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lR/DoXL3qENwSs1DoIv4LPK97VT8FIgs4faN8Udnb8U=;
	b=FGl3SEtbGHeNEdQLGJV5L6Ejf1ukaTvr6Hhf/GvjuVZKQujT2A97XVKfwrNlDRxHZn
	DJkaWPKX+knYgvb4Bjv0xWLwAwfAVsR6+G5BVtn/LEFE7wuHyJHhxJ79TmPo7gHaplPZ
	AaO6xSQ+nQVg3O4BAIaXSQvNrUEWm9WgoHhB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qKrfxlkULKa3qsdZZHAFynnvEgdkm2/L0EwIWoAREhVPB1Fu2x6+UzCnu+WN/M3Kfa
	aMiv28jnOZTPS+RMWjbQ8fmjg74dGVQt/qCbsqiC/qymHiygW3Uzc1kdUswyamJtO63N
	Nf80+mu2s7becwxxpL5u3MFRm4EDoP5y0s9YY=
Received: by 10.227.59.78 with SMTP id k14mr7290798wbh.102.1307521204287;
	Wed, 08 Jun 2011 01:20:04 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id fm14sm217522wbb.7.2011.06.08.01.20.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 01:20:03 -0700 (PDT)
Date: Wed, 8 Jun 2011 09:20:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110608082000.GB26703@stefanha-thinkpad.localdomain>
References: <4DB6AD38.50307@siemens.com>
	<20110514224427.GG13600@volta.aurel32.net>
	<4DEE49D5.7010301@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DEE49D5.7010301@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio: Move virtio-pci to
	hw library
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
X-List-Received-Date: Wed, 08 Jun 2011 08:20:09 -0000

On Tue, Jun 07, 2011 at 05:55:01PM +0200, Jan Kiszka wrote:
> On 2011-05-15 00:44, Aurelien Jarno wrote:
> > On Tue, Apr 26, 2011 at 01:32:08PM +0200, Jan Kiszka wrote:
> >> This module has no target dependencies (except for target_phys_addr_t
> >> size) and can thus be built as part of libhw.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> ---
> >>  Makefile.objs   |    1 +
> >>  Makefile.target |    1 -
> >>  2 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> 
> Will you or qemu-trivial pick it up?

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

