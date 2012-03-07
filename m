Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Eqj-0000n2-O7
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 06:16:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5EqL-0000iw-BU
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:16:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5EqE-0008S1-Sz
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:15:40 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:34477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5EqE-0008Oy-HB
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 06:15:34 -0500
Received: by werp12 with SMTP id p12so4603121wer.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 03:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cb4iN86qQ+AjQEsaMXnrqBxV8BvGIQqVWFFAoxlEbPs=;
	b=L8J+azk6rJLQJxdtoI9aXBLEU2xcsbJphvJfS/SulZRriH/p9ww8O2zFc3PGOTNNbA
	njGJKNmWlKwQq+PSDlBmyaB1dzZIXTtJV34BfMTsrOQHhIDwyOPZikGjcbn2GhByXvBZ
	UMoH/UmvO/llz8GHuh9OO/Tlwr1vyJb6lX01mxjMzKSlkBIv50AmbgORwLnxFfEQUdVn
	A1ULXsNunwqbq2rrTxZK7hzEws1veBTLjUmDD5e8f/C6K2kjcLuFOCzas2f2SktxRTda
	qo+T78VozArYh71m/Giq29wWGt9VhK791cv9Hpa3RtpO3JLksw9WV+jVrI1bX8To1cp+
	opkw==
Received: by 10.180.78.130 with SMTP id b2mr25563606wix.1.1331118932425;
	Wed, 07 Mar 2012 03:15:32 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t20sm34619163wiv.0.2012.03.07.03.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 03:15:31 -0800 (PST)
Date: Wed, 7 Mar 2012 11:15:29 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Yufei <cyfdecyf@gmail.com>
Message-ID: <20120307111529.GA1754@stefanha-thinkpad.localdomain>
References: <y>
 <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove type field in ModuleEntry as it's
 not used.
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
X-List-Received-Date: Wed, 07 Mar 2012 11:16:04 -0000

On Tue, Mar 06, 2012 at 09:24:45PM +0800, Chen Yufei wrote:
> ---
>  module.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

I forgot to mention, please CC qemu-devel@nongnu.org.  All QEMU patches
should be on that list, qemu-trivial allows you to request that the
patch is merged through the trivial tree, but everything still needs to
be on qemu-devel.

