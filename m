Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTwlQ-0001vA-2O
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 09:56:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwlK-0001u3-Dg
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwlJ-0002ZF-1F
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:56:06 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:52119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QTwlA-0002XY-3U; Tue, 07 Jun 2011 09:55:56 -0400
Received: by wwj40 with SMTP id 40so4388603wwj.10
	for <multiple recipients>; Tue, 07 Jun 2011 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EhwYliQp7gDUnUe0+ldAGA46ssnHFjZVp6CT4JDxQxY=;
	b=HqXyGbDzNLhQAvB4d6gge/eR38z/ZNL9W5CkhNYbGY/SX0H+a5ZweC5ssiFngLtUaB
	mOEkwE53HMY8FhWD7/UGF6KEE5suPPZ3b7DEsW054BEGEECmaF3WCr0h4wwZ+4pcqZZ7
	KMXB/zF3qWAUzgqK4fYrs6qwATo1FL768EhVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=e/c/T4RgEB65t41VxrFYA5KQSWy4OIt20XkwG/asvXfJVqrqRB8Nwv81bupwSx0Oaw
	lG4qcdcwgRhkEg+YKaZhK1vxunChg3shQYvwuGIVLb2ZnbhcAJOgNk8npkmANv3cCznX
	/Z7sreMM5TTGQlz0FDmjVX5mxp8bAsKlKdelo=
Received: by 10.227.179.197 with SMTP id br5mr6258588wbb.52.1307454953107;
	Tue, 07 Jun 2011 06:55:53 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice4n2.emea.ibm.com [195.212.29.92])
	by mx.google.com with ESMTPS id fm14sm3575305wbb.41.2011.06.07.06.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:55:52 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:55:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20110607135549.GB1493@stefanha-thinkpad.localdomain>
References: <1307165159-29222-1-git-send-email-agraf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307165159-29222-1-git-send-email-agraf@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] slirp: fix guestfwd id
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
X-List-Received-Date: Tue, 07 Jun 2011 13:56:11 -0000

On Sat, Jun 04, 2011 at 07:25:59AM +0200, Alexander Graf wrote:
> When using -net user,guestfwd=... Qemu immediately complains about the id
> being in invalid format. This is because we pass in an id that contains a
> colon, while the id restrictions don't allow colons.
> 
> This patch changes the colon into a dot, making guestfwd work again.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  net/slirp.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

