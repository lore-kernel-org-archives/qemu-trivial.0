Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QWCju-0006ss-1D
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2011 15:23:58 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QWCjp-0006rE-2A
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 15:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QWCjn-0004p8-Pf
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 15:23:52 -0400
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1QWCjg-0004nL-Fy; Mon, 13 Jun 2011 15:23:45 -0400
Received: by fxm17 with SMTP id 17so4865284fxm.33
	for <multiple recipients>; Mon, 13 Jun 2011 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=T7bVcRkgMfq15LVTvY35Q50Z/U5T8UlTlhmgBLbwBlc=;
	b=RFB9LxmY4z1FH3pB7qr+3EY2gdlEdhz7wzUBT1Lrz8huBVEpvTJ/muOhYvXFyMADPh
	aJfwPvv8riY0eugCGUyqpaAzjm6kbMFK1WReZcTxJvhSjs/WAYvQCsFaoluCXPXA2PmM
	6MrKE4X2E/Wh5YQMyev9sbZSq+lFW4ojcwDPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Agb5Xv6+JNIBs/EMf0kxcNY7k2mOQa3AE8Q0fMul27lcpY/nfB45rEiwEG+phEOCf/
	JyJplzKasKnBm5uMblWTn0sTKcvTNatyqlHOxxKetXXO85XFg5UxkqXb4CQagdQO5O5C
	LUORMb5OwGswf16vBfQYZD4lyy6qgTi+ngqDk=
Received: by 10.223.62.146 with SMTP id x18mr157090fah.54.1307993022849;
	Mon, 13 Jun 2011 12:23:42 -0700 (PDT)
Received: from localhost (h59ec3266.selukar.dyn.perspektivbredband.net
	[89.236.50.102])
	by mx.google.com with ESMTPS id q21sm2191402fan.40.2011.06.13.12.23.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 12:23:41 -0700 (PDT)
Date: Mon, 13 Jun 2011 21:23:39 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110613192339.GF29885@laped.lan>
References: <1307616192-28711-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307616192-28711-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.46
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Changelog: Add explanatory
 note that this file is no longer updated
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
X-List-Received-Date: Mon, 13 Jun 2011 19:23:55 -0000

On Thu, Jun 09, 2011 at 11:43:12AM +0100, Peter Maydell wrote:
> Add an explanatory note to the top of Changelog pointing at the
> wiki and git history for changelogs for more recent releases.

I've applied this, thanks.


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Changelog |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/Changelog b/Changelog
> index 1c41e14..28a69af 100644
> --- a/Changelog
> +++ b/Changelog
> @@ -1,3 +1,9 @@
> +This file documents changes for QEMU releases 0.12 and earlier.
> +For changelog information for later releases, see
> +http://wiki.qemu.org/ChangeLog or look at the git history for
> +more detailed information.
> +
> +
>  version 0.12.0:
>  
>    - Update to SeaBIOS 0.5.0
> -- 
> 1.7.1
> 
> 

