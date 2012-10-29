Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSm3b-0008EY-AZ
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 05:54:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSm3Y-000878-Bt
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSm3X-0006J8-EL
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:54:52 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:42209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TSm3S-0006IS-Eb; Mon, 29 Oct 2012 05:54:46 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1556121bkc.4
	for <multiple recipients>; Mon, 29 Oct 2012 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=thxyBFglAL9hjoExv0NyZBcK3UfQ+SFw+fLMUgJAchk=;
	b=FFsuWI4jNSz/1SpMJ8X1+ciqsLBkYadZNXOtZrDg2dzIPcBG9pqzw65jcH+aZXj26y
	VyGWVqZKpZb4J4NIQkz1yB6SVK3v0MJdzSQJfpTs9SnQfWtCQjeenVsNGizX8/kLtS6T
	hN6Y5poWLvf1LSygrMvVRcpxnD5tvh3Fo0aMUFf8Cga1aHrOspdsFfUt7xjSx9FykLLW
	KoDbbwB7wA1WaumkrFgZbhLjpuE9soU5x55EQSmeZMsQozTPsAHVMx6v22alwPDg0mQ2
	lqG6J7Q9VDd3fNBU8mtum1tbQPzBIQC22HMHsomEnMJLJpBjylW0IGClv4jreM+10zjn
	xslg==
Received: by 10.204.128.138 with SMTP id k10mr9145415bks.27.1351504485380;
	Mon, 29 Oct 2012 02:54:45 -0700 (PDT)
Received: from localhost ([89.204.138.63])
	by mx.google.com with ESMTPS id j24sm3413475bkv.0.2012.10.29.02.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 02:54:44 -0700 (PDT)
Date: Mon, 29 Oct 2012 10:54:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121029095440.GB30593@stefanha-thinkpad.redhat.com>
References: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove stray debug output
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
X-List-Received-Date: Mon, 29 Oct 2012 09:54:53 -0000

On Sat, Oct 20, 2012 at 08:37:04PM +0100, Peter Maydell wrote:
> Rather than printing a message saying we're silently falling
> back to gthread coroutines when running on MacOS, actually
> do it silently.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I guess this is a self-falsifying echo :-)
> 
>  configure | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 9f33c7d..e07baf3 100755
> --- a/configure
> +++ b/configure
> @@ -2900,8 +2900,6 @@ EOF
>      else
>  	coroutine_backend=gthread
>      fi
> -  else
> -    echo "Silently falling back into gthread backend under darwin"
>    fi

Is there a reason to remove the echo?

Stefan

