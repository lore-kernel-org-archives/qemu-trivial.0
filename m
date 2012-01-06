Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjBR8-0005kO-DY
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2012 10:10:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RjBR5-0005fD-Ng
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 10:10:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RjBR4-0006yx-Iz
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 10:10:27 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:39874)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RjBR1-0006yU-Ks; Fri, 06 Jan 2012 10:10:23 -0500
Received: by eekb45 with SMTP id b45so1272386eek.4
	for <multiple recipients>; Fri, 06 Jan 2012 07:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6NZbQiPrQUi2xOL8y15+6YZ3ABzihYiHiulb2paowZs=;
	b=hguSvg9PaZLRCTZ+uFJgSnYKpD9HlJc4AHC8E5y0WOUrX9sCLdY3jZ3KCxkIaAUgan
	kxApC41NB2/WBTl8xKm++i3Fl+Pz4OiXAelDrEZfMszxjK3kEvHHxXiWJFCQKWR3C3pQ
	mxCqagCCIMAa2XtQplTv1ffJXKtWiideWS9Ms=
Received: by 10.213.26.5 with SMTP id b5mr1218797ebc.129.1325862621950;
	Fri, 06 Jan 2012 07:10:21 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	b49sm217653359eec.9.2012.01.06.07.10.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 07:10:20 -0800 (PST)
Date: Fri, 6 Jan 2012 15:10:19 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Message-ID: <20120106151019.GA27565@stefanha-thinkpad.localdomain>
References: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-nbd: drop loop which can never loop
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
X-List-Received-Date: Fri, 06 Jan 2012 15:10:29 -0000

On Thu, Jan 05, 2012 at 01:16:07PM +0000, Stefan Hajnoczi wrote:
> For some reason nbd_client_thread() has a do..while loop which can never
> loop, the condition is bogus because we would take a goto instead.  Drop
> the loop.
> 
> Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> ---
>  qemu-nbd.c |   10 ++++------
>  1 files changed, 4 insertions(+), 6 deletions(-)

Applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

