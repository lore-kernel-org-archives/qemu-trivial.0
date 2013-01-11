Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tta4N-0005BN-8l
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:34:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tta4I-0004xb-6i
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tta4B-0001nJ-Qf
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:34:25 -0500
Received: from mail-wg0-f47.google.com ([74.125.82.47]:44696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tta3q-0001Y2-Aa; Fri, 11 Jan 2013 03:33:58 -0500
Received: by mail-wg0-f47.google.com with SMTP id dq11so676704wgb.2
	for <multiple recipients>; Fri, 11 Jan 2013 00:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2nnlmgmFW0BC4UE6K+l04Sxvxb1DbzIgJ95I4ZA4TnU=;
	b=ISwym0Jx2u5Hw5/nON1LqnNI/ZHgAWaYnDzOzUVDFZHU9PywnIMKELEPvKxKxKZLRs
	fYiZmzTYnwo9oLTNvkoIyU5NfXehMAzyElmiWwX/0hZc83oy5bSp+pFAokvEN1znic7s
	/PKCTOaT7tNBgKlY6Qzilek1Ob/i3l6PEjobuqzD83MSd0bNwzhB7f7lo4SUHrqcTDLe
	pc6tHi1TqkgnM21TXoY1AXzbjzwfLrJ50TzMAbXlpnIWUUaHEtzGO6g5lPC6+rH5nr/u
	534TC/nHdymJoDUvnKeilxZc1qp4nhw8SZLpLXl3AVvtqaCO+ZNX7Qj1Rj/CtUPLxZdh
	Xftw==
X-Received: by 10.180.84.193 with SMTP id b1mr13654154wiz.26.1357893237387;
	Fri, 11 Jan 2013 00:33:57 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id u6sm6124888wif.2.2013.01.11.00.33.55
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:33:56 -0800 (PST)
Date: Fri, 11 Jan 2013 09:33:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130111083350.GB23656@stefanha-thinkpad.muc.redhat.com>
References: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.47
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/channel-posix.c:
 Explicitly include string.h
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
X-List-Received-Date: Fri, 11 Jan 2013 08:34:29 -0000

On Mon, Jan 07, 2013 at 05:29:55PM +0000, Peter Maydell wrote:
> Explicitly include string.h to avoid warnings under MacOS X/clang
> about implicit declarations of strerror() and strlen().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I assume under Linux these are implicitly dragged in via one of the
> other headers.
> 
>  qga/channel-posix.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

