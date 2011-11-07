Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOY-0007AT-Pj
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOT-0006uD-RB
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOS-0001Mp-Nq
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNLOM-0001L3-Ra; Mon, 07 Nov 2011 04:21:22 -0500
Received: by faap15 with SMTP id p15so5986632faa.4
	for <multiple recipients>; Mon, 07 Nov 2011 01:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z0GPnAQckJp+aw8CIykxbzeN7mCchJYV0FPA4zfNMWU=;
	b=J7VO/FGElXZDgb3kFPqkZAPjS1nFEzycxJOyUJCGw589EJ3ybzSS9EJZGRUTae0mlb
	7B51anfmMFP5RcSbLCGgoFgQV0cVPRhIe62b7mlIdQEW9Ql6VcDSlzZLmXpfSDkoBDRq
	/x3y9aX/72sJN6ahjLJ7dJK0fik5ScqSCi3ys=
Received: by 10.223.75.129 with SMTP id y1mr3759027faj.1.1320657681308;
	Mon, 07 Nov 2011 01:21:21 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	k26sm30543289fab.8.2011.11.07.01.21.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:20 -0800 (PST)
Date: Mon, 7 Nov 2011 08:04:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111107080427.GA9450@stefanha-thinkpad.localdomain>
References: <1320401401-28871-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320401401-28871-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] readline: Fix buffer
 overrun on re-add to history
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:31 -0000

On Fri, Nov 04, 2011 at 11:10:01AM +0100, Markus Armbruster wrote:
> readline_hist_add() moves the history entry to the end of history.  It
> uses memmove() to move rs->history[idx + 1..] to rs->history[idx..].
> However, its size argument is off by two array elements, so it writes
> one element beyond rs->history[], and reads two.
> 
> On my system, this clobbers rs->hist_entry and the hole right after
> it.  Since the function assigns to rs->hist_entry in time, the bug has
> no ill effects for me.
> 
> Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  readline.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

