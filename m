Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKqTC-00023k-FF
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 07:56:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqT9-0001so-Fm
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqT8-0007OZ-6B
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:55:59 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:41903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RKqT4-0007Nb-T7; Mon, 31 Oct 2011 07:55:55 -0400
Received: by faap15 with SMTP id p15so6468462faa.4
	for <multiple recipients>; Mon, 31 Oct 2011 04:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fDqSG/p+StL9YumjR3GjPq8FPjnCOPSFwjSSpScZlUs=;
	b=c/6SFpnVEvGvxsc4dCaM6IWan78ZASCgLFz9oGGQ8iGKyA9i5Eec5zUBmw0U8X5q9I
	i1TqOYfvqITXYSwaedEavytKnbkzlouUHukW26/RnFD91/JmBRcBS4QKiUwz8QZzhlnS
	t6fx7CnWnK5hcv+3O3REyFlZDhsKcu3fHZPKo=
Received: by 10.223.63.206 with SMTP id c14mr28927231fai.3.1320062154037;
	Mon, 31 Oct 2011 04:55:54 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	y17sm37538004faa.22.2011.10.31.04.55.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 04:55:53 -0700 (PDT)
Date: Mon, 31 Oct 2011 11:55:52 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111031115552.GC10693@stefanha-thinkpad.localdomain>
References: <1319814422-17952-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319814422-17952-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] acl: Fix use after free in
	qemu_acl_reset()
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
X-List-Received-Date: Mon, 31 Oct 2011 11:56:00 -0000

On Fri, Oct 28, 2011 at 05:07:02PM +0200, Markus Armbruster wrote:
> Reproducer:
> 
>     $ MALLOC_PERTURB_=234 qemu-system-x86_64 -vnc :0,acl,sasl [...]
>     QEMU 0.15.50 monitor - type 'help' for more information
>     (qemu) acl_add vnc.username fred allow
>     acl: added rule at position 1
>     (qemu) acl_reset vnc.username
>     Segmentation fault (core dumped)
> 
> Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  acl.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

