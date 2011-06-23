Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZk1v-0006DX-R3
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:33:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk1s-0006Cb-Aq
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk1q-0002tK-EV
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:33:08 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:54470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZk1q-0002t8-4E; Thu, 23 Jun 2011 09:33:06 -0400
Received: by wyf28 with SMTP id 28so1431419wyf.4
	for <multiple recipients>; Thu, 23 Jun 2011 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1/k9jJ2DqldakXCwAdXxl0HDKRnRZeDGIMtiBnsP9Rw=;
	b=b8HFKCqTHplJlX+eSCqWL8n1/JfPK13H1Lcmn5fPjJdFNrtkRz8YiVK7EcCuRkUTdT
	4hsF4glTl/1nLzoD+zE9rsMu4cFCnHDhbNpkRsoMMOEcFCJZqUYMGORCxum01jG8+nFT
	Gwz5TD3Y0pnJFp51kRJacfGknHAJrVUbr50yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=m8TaltqllnntCpyqBHqVQiDCQUzcEKOpqd2osB/mG+aG0zYtSBVPc/sZ1OalRcXx9p
	0s23yRRiobcV0KTqs9DdIosTL3bsPo8IokF970DRK1C3cLtH3t+R2t8jpeJKEpgWhYvA
	Uja5+sAENkgTixMVOOPy+onll9e0t6wLyon0I=
Received: by 10.216.171.18 with SMTP id q18mr1928388wel.47.1308835984989;
	Thu, 23 Jun 2011 06:33:04 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id d7sm863340wek.45.2011.06.23.06.33.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:33:04 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:32:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20110623133258.GA12698@stefanha-thinkpad.localdomain>
References: <4DFDC6FE.1080307@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DFDC6FE.1080307@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Align dummy display to fixed-size active
 console
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
X-List-Received-Date: Thu, 23 Jun 2011 13:33:09 -0000

On Sun, Jun 19, 2011 at 11:53:02AM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This fixes e.g. '-vga none -monitor vc:120Cx50C'.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  console.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

