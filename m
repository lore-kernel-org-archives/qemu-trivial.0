Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qou1S-0004LX-Ck
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2011 05:15:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qou1P-0004HK-V0
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 05:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qou1O-00033P-U7
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 05:15:19 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:43638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qou1M-0002yl-BU; Thu, 04 Aug 2011 05:15:16 -0400
Received: by fxbb27 with SMTP id b27so2107063fxb.4
	for <multiple recipients>; Thu, 04 Aug 2011 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S3+DZvEwPfECq3aqgWvk/nBU1/G+zR+8kGxmwTts/Zc=;
	b=RqSFWhqGfvUHBu2Q/FY7zSvCD8PJgYp5sCrc04/uMokYmscppjNPTHtiBJ5q144pEO
	A7JImTtYld72oy5mLJeA6XV4dkNqtlMPiKLau5Y6t7V/MgX7eR4+Srlw4OTJCkYeHJqN
	HjTVLcOpPqos4qaMpSxHp+1xVC+U8rkzlnEuY=
Received: by 10.223.10.143 with SMTP id p15mr879438fap.12.1312449315553;
	Thu, 04 Aug 2011 02:15:15 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id b8sm265682fam.13.2011.08.04.02.15.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 02:15:14 -0700 (PDT)
Date: Thu, 4 Aug 2011 10:15:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110804091509.GA29895@stefanha-thinkpad.localdomain>
References: <1312411744-9292-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1312411744-9292-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/qdev: Don't crash if qdev_create(NULL,
 ...) fails
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
X-List-Received-Date: Thu, 04 Aug 2011 09:15:20 -0000

On Wed, Aug 03, 2011 at 11:49:04PM +0100, Peter Maydell wrote:
> If an attempt to create a qdev device on the default sysbus (by passing
> NULL as the bus to qdev_create) fails, print a useful error message
> rather than crashing trying to dereference a NULL pointer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/qdev.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

