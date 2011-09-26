Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R88eG-0000JJ-4V
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 06:42:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88eE-0000Ea-EK
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:42:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88eD-0008G8-Im
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:42:54 -0400
Received: from mail-ww0-f41.google.com ([74.125.82.41]:62382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R88eB-0008Fo-Hx; Mon, 26 Sep 2011 06:42:51 -0400
Received: by wwf10 with SMTP id 10so8975318wwf.4
	for <multiple recipients>; Mon, 26 Sep 2011 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9ztJhsk7xu6tE0yTmg7Cb9eDvhh8MHULD3qhOru4WR4=;
	b=RoEUbf/6R44CuMuaLl4q/omboaStvKUg8Ac0clnI1qL0oqimxXb9fHFnzEXSiQPZtD
	ekipPejnqgl4krdyH71mEEVKaKoL6uZen9CtWNqAuf7l1G1eTLAivXYsC+b2Mbbaj3T1
	i8wc1bc7rYr30YxEuIUqGDlY/xiB83X0AV02M=
Received: by 10.227.156.70 with SMTP id v6mr1826830wbw.27.1317033770562;
	Mon, 26 Sep 2011 03:42:50 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id o7sm30352645wbh.8.2011.09.26.03.42.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 03:42:49 -0700 (PDT)
Date: Mon, 26 Sep 2011 11:42:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Antony Pavlov <antonynpavlov@gmail.com>
Message-ID: <20110926104247.GB9503@stefanha-thinkpad.localdomain>
References: <1317013358-19839-1-git-send-email-antonynpavlov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1317013358-19839-1-git-send-email-antonynpavlov@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [PATCH 1/2] gt64xxx.c: fix length modifier in
 DPRINTF format string
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
X-List-Received-Date: Mon, 26 Sep 2011 10:42:55 -0000

On Mon, Sep 26, 2011 at 09:02:37AM +0400, Antony Pavlov wrote:
> The commit fc2bf44972349b078d8310466c3866615500e67f
> changed the type of val argument of the function gt64120_writel()
> from uint32_t to uint64_t, so we need to change the corresponding
> length modifier from "%x" to "%" PRIx64.
> 
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  hw/gt64xxx.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

When sending revised patches in the future, please include a version
number in the subject line like "[PATCH v2 1/2] ..." so that it is easy
to identify different revisions of the series.

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

