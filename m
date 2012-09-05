Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9C8J-0004jC-9Y
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:42:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9C8E-0004Ua-Nk
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:42:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9C89-0004n2-Sf
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:42:46 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:56196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9C89-0004mh-MN; Wed, 05 Sep 2012 05:42:41 -0400
Received: by wgbfm10 with SMTP id fm10so316218wgb.10
	for <multiple recipients>; Wed, 05 Sep 2012 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7cKafVU5d2YtF3F9vEn3MoCe2ZX32CYPGYSAu1juHHQ=;
	b=xxdDr5IG9o2fVM5peY/HkyJDR68WtchO3QxDbieiwlxbrYDGz1uKjDBUHDWcSTtOW0
	sBdjleZJY7OXkVXB7Nc6yQHl3/QqB01a+4cJI8SZibyz3JKfommefWUlbIsN+L7gnHLn
	+3o+rgmSttkGp4Ei5ughFx64SzYkIPR3RbSK3BQoamz1xR2/3yhXckSjSH5dTE4d4e5b
	IEHljDxc8nNW/Qft+FzJNhY6js0Ugdbdy5K/SESYxjbrfE5pJ1IA+tT5S4y0y3F0Ft7X
	lVn9yhfTQB4fzPSq9UYHjqTv7+/xsoHDCo61W260NTIqBHyysHRncjreWSQICMzQIXny
	AkYg==
Received: by 10.180.20.204 with SMTP id p12mr36907287wie.7.1346838160877;
	Wed, 05 Sep 2012 02:42:40 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id r9sm3301226wia.2.2012.09.05.02.42.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:42:40 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:42:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Igor Mitsyanko <i.mitsyanko@samsung.com>
Message-ID: <20120905094239.GE4786@stefanha-thinkpad.localdomain>
References: <1346835896-25319-1-git-send-email-i.mitsyanko@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346835896-25319-1-git-send-email-i.mitsyanko@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arch_init.c: add missing
 '%' symbols before PRIu64 in debug printfs
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
X-List-Received-Date: Wed, 05 Sep 2012 09:42:48 -0000

On Wed, Sep 05, 2012 at 01:04:56PM +0400, Igor Mitsyanko wrote:
> '%' symbols were missing in front of PRIu64 macros in DPRINTF() messages in
> arch_init.c, this caused compilation warnings when compiled with DEBUG_ARCH_INIT defined.
> 
> Signed-off-by: Igor Mitsyanko <i.mitsyanko@samsung.com>
> ---
>  arch_init.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

