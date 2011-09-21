Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6Ju9-0004Vs-VX
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:19:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6Ju6-0004Nm-TH
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:19:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6Ju5-0004zk-Uc
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:19:46 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:50546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R6Ju2-0004yn-Ll; Wed, 21 Sep 2011 06:19:42 -0400
Received: by wyh22 with SMTP id 22so1744902wyh.4
	for <multiple recipients>; Wed, 21 Sep 2011 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=He3e2sCMwVxAreOZHN3Nu1U8NDtxYxgF7jbI2D6fXPk=;
	b=iFDRwDYG4EYvodlee8ENl/zvXNw/924//bqWx4E7d+dF6NDQNm9FBEdf/QO8Xs1vdS
	pk1ruA2utnHvC1L/Lf9iK4Rw07p6oLlI+8aqAzM6ogsoo1NmgpvylVeVYicBLflByDtG
	/Rw3V2m/hiBFCWc6giBFwM6xHw2tljdyfFQdQ=
Received: by 10.227.203.194 with SMTP id fj2mr501246wbb.79.1316600381768;
	Wed, 21 Sep 2011 03:19:41 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fa3sm6325644wbb.3.2011.09.21.03.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:19:40 -0700 (PDT)
Date: Wed, 21 Sep 2011 11:19:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110921101937.GA5278@stefanha-thinkpad.localdomain>
References: <1316255130-31646-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1316255130-31646-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove qemu_host_page_bits
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
X-List-Received-Date: Wed, 21 Sep 2011 10:19:48 -0000

On Sat, Sep 17, 2011 at 12:25:30PM +0200, Stefan Weil wrote:
> It was introduced with commit 54936004fddc52c321cb3f9a9a51140e782bed5d
> as host_page_bits but never used.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  cpu-all.h |    1 -
>  exec.c    |    4 ----
>  2 files changed, 0 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

