Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZk38-0006ZJ-HS
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:34:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk35-0006YR-GM
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk34-000360-5v
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:23 -0400
Received: from mail-ww0-f41.google.com ([74.125.82.41]:56063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZk30-000355-53; Thu, 23 Jun 2011 09:34:18 -0400
Received: by wwi14 with SMTP id 14so1381531wwi.4
	for <multiple recipients>; Thu, 23 Jun 2011 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=r4DavDlQDj5F7xiE2HuYebiERxjRaQzYQm038Rs1knw=;
	b=GgF8slzodK0Ylu1/GtLDXsExTm7Le9CN5/k2wUFT5BNiZxe9wYLkmtFi4BtWvPQ+Nw
	xcmyWqWUWCSG8zHjpLDxjEr42FxGVqx+xlOZAeZ2KyZt21RfMQ0idKS5hO2deHhgcFLk
	UqfZarcjljcPnB6tL460aLB/xxHLayt2XYhu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=guwgWGXNgeqrs8X0Svz2b4oatqoxUI84iGH5u9BWtYVNFv8OGC0rS2aUKjMTnvxPoS
	FBZnjx2Me9ZEdbYZsyyrI56pq8Mz1S6icXUeusDr5a+rW9jZn0MZpX9L/gFAaQF3U926
	A1bvSM7+a0V8p8SWNvPpHjLpzeBT+mVvaKEac=
Received: by 10.216.231.89 with SMTP id k67mr1868757weq.113.1308836056678;
	Thu, 23 Jun 2011 06:34:16 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id w62sm864009wec.42.2011.06.23.06.34.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:34:15 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:34:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110623133411.GC12698@stefanha-thinkpad.localdomain>
References: <1308753901-17998-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1308753901-17998-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Fix typo in
	email address
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
X-List-Received-Date: Thu, 23 Jun 2011 13:34:25 -0000

On Wed, Jun 22, 2011 at 03:45:01PM +0100, Peter Maydell wrote:
> Fix a typo in one of the copies of Aurelien Jarno's email address.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  MAINTAINERS |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

