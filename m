Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO5xR-0005C7-Qy
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 08:41:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO5xK-00050E-6g
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO5xF-0005uT-BM
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:41:22 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:41764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UO5x1-0005mT-6W; Fri, 05 Apr 2013 08:41:03 -0400
Received: by mail-wi0-f182.google.com with SMTP id hi18so538821wib.3
	for <multiple recipients>; Fri, 05 Apr 2013 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OUSsIgmXA++8R4CJ7YhPO0EKNIHedq+8oKYMfoxpSBo=;
	b=zjk87EdYzkcxZvS8m9yO0vgn/+tOX+MkZgjWeW4Nd4/9UHNeq4pFeCOo+I2o+KBuTY
	NyJqS/ikMvIupOTE530uN/1tl46a5tZIt/M3OWvqCcgn1yC9O5uJxoYbUOX1JmovbMzH
	/NwlGP4HtAurMylqkEBZopT8yMHPKS2POLPQ+hkywwuxi+OPke8tl5WKJ+WdtJIuISRW
	UO5yQ7+GD/L2VBq7CgtpqpRoUbripIUI/iynDniL+27a/PEij8SA8ICx9ptPlg0kN7Qd
	UujnBRxss8fI//tr6eQYuAKxn60Uym5DjTa5PmRH7yvelihBNzGRjxDLHUoGWYIquBAI
	k0hg==
X-Received: by 10.180.188.141 with SMTP id ga13mr4048181wic.9.1365165662051;
	Fri, 05 Apr 2013 05:41:02 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id du2sm3529978wib.0.2013.04.05.05.40.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 05:41:00 -0700 (PDT)
Date: Fri, 5 Apr 2013 14:40:58 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130405124058.GA15818@stefanha-thinkpad.redhat.com>
References: <1364481204-11815-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364481204-11815-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Don't omit comma for strace
 of rt_sigaction()
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
X-List-Received-Date: Fri, 05 Apr 2013 12:41:28 -0000

On Thu, Mar 28, 2013 at 02:33:24PM +0000, Peter Maydell wrote:
> Pass the 'last' parameter of print_signal() through to
> print_raw_param(); this fixes a problem where we weren't printing
> the comma separator for strace of rt_sigaction() when the signal
> was an unnamed (ie realtime) one:
>   6856 rt_sigaction(230xf6fff870,0xf6fff8fc) = 0
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/strace.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

