Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1eTu-0002dp-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 10:21:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eTs-0002X1-5y
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eTr-0000Xj-6R
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:21:56 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:53208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1eTo-0000XK-SE; Wed, 15 Aug 2012 10:21:53 -0400
Received: by wgbds1 with SMTP id ds1so4849313wgb.4
	for <multiple recipients>; Wed, 15 Aug 2012 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IwZnRSk6prfRRMPQvjWXu7n9uJPAVJnpMT7u2Eqe80s=;
	b=PtLPrgbZCN1nvzVUZT6510EGdGugTeFTUA+IQw2E4KM/JQbfKJXqJc1faT2u+lweay
	wSZ3HV2ThxZRbOn6GuNJoIFIZidJTrt8sBz0lkSQVSwn00aBgz1gjnAtFVDukDsXFCPE
	Je5YCF4HwpwDOIDpXIBlpugAdw2kl//XCG56DcjuhIDrZ4AgaNatRS2IaqiHnuA/cwRG
	muQ3ghGOO1HxCqDf6R0eSVA4dW5C7cpOACkIlqWZot6k93+6M3V4lyplePl0Y6NHKLzo
	U5vBlBq7Kh0XskDHDdbXXsqL00K/I4W4jUeAE0Zc4wgw3ry1RM7ndsOX7DB9NlInsB35
	OXcQ==
Received: by 10.216.71.82 with SMTP id q60mr10915842wed.64.1345040511836;
	Wed, 15 Aug 2012 07:21:51 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm28896948wiy.3.2012.08.15.07.21.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 07:21:51 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:21:48 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120815142148.GL10742@stefanha-thinkpad.localdomain>
References: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] iov_send_recv(): Handle zero bytes case
 even if OS does not
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
X-List-Received-Date: Wed, 15 Aug 2012 14:21:57 -0000

On Sat, Aug 11, 2012 at 10:24:35PM +0100, Peter Maydell wrote:
> POSIX allows sendmsg() and recvmsg() to fail EMSGSIZE if passed a zero
> msg.msg_iovlen (in particular the MacOS X implementation will do this).
> Handle the case where iov_send_recv() is passed a zero byte count
> explicitly, to avoid accidentally depending on the OS to treat zero
> msg_iovlen as a no-op.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is what was causing 'make check' to fail on MacOS X.
> The other option was to declare that a zero bytecount was illegal, I guess.
> 
>  iov.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

