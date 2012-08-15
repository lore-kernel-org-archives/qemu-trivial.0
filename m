Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dyA-0001ks-Rn
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:49:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dy8-0001jf-5T
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dy7-00066f-18
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:49:08 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:50744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dy6-00066Q-RH; Wed, 15 Aug 2012 09:49:06 -0400
Received: by wibhm2 with SMTP id hm2so4239714wib.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0SZ4KeqKRPhkZG+ttcjVFytGCkVNz+WMRIXhbVevsVw=;
	b=TA3cpXhVtMWB//hdpZ8bdv/sFtbCavMnocZPOeQnL2TVGfEKT+2udqL4eT/eZbJOBd
	91nLMclcDEtmnNMxx3fuNWnWc9/g54dCWAwHw1s7Rn56CL9Mk039ZOJu53MxIdz/M+mS
	TeFrl7QyVfEX6AY1cwwa/LxBaHVzZg9EqomBTx4JoPnS5i1OZKt+m/Ano4t1ouUAW1OV
	fR/TTSnAdzSsFB7NtyFbtFw2ykQmT+6DQpLV4QdmIoZ/XzvoMiLW4KSWktjGblqSS1M3
	tXaMPipzAgFcmn+EuWqf+lpvkD5BOjFbS4Qoqt0D9fehWAPx+jKmiHA7o7X6Q9sRjfXa
	Lw0Q==
Received: by 10.216.197.12 with SMTP id s12mr10588750wen.4.1345038545764;
	Wed, 15 Aug 2012 06:49:05 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l5sm4724073wix.5.2012.08.15.06.49.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:49:05 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:49:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120815134902.GH10742@stefanha-thinkpad.localdomain>
References: <1344628382-10125-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344628382-10125-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix spelling (propery -> property)
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
X-List-Received-Date: Wed, 15 Aug 2012 13:49:09 -0000

On Fri, Aug 10, 2012 at 09:53:02PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/bootindex.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

