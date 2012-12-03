Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVe2-0007D7-Jr
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 08:01:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVdu-0006qe-Sm
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:01:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVdl-0002A5-3x
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:01:02 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:46121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVdS-0001y0-Su; Mon, 03 Dec 2012 08:00:35 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1685502eek.4
	for <multiple recipients>; Mon, 03 Dec 2012 05:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4zcLARnvMkCx6TOwXTT9RVF04FUQdy5CIDu8hha0uYs=;
	b=XXZ1qzeas+HnZzWny0jrrudbyfIqk9FkatMMn3ZEkyWbGxeGshDDfw8Tv0+NCU5zPW
	wZZS23MPf/NXJb3VBaA/TySRTrArVibp4IGrgBgFkeaklJq45mCnxMjNjqN8A8fiJ68u
	i9sSJnvSdFumLWSZT1lRoOm15gC4V4Psa5efS+f/DzEwwLPpkiB313E/Hg0yl0L2nXZG
	5nJJKabRP0OuW3EVkhM69p6V7zBhoAf/S6Rfso6PdBlok1wOD8Awt/zXP0nx818Ff84v
	cWMU9L8fqvAoaGDkcNdg3YrJ21lXyV0nz3bMj8mN0UEYacN1/rXc/cjNHO/0End5aIxk
	Je+A==
Received: by 10.14.175.133 with SMTP id z5mr36178354eel.15.1354539632966;
	Mon, 03 Dec 2012 05:00:32 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id y44sm31136392eel.14.2012.12.03.05.00.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 05:00:32 -0800 (PST)
Date: Mon, 3 Dec 2012 14:00:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121203130030.GF6048@stefanha-thinkpad.redhat.com>
References: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353683570-30525-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Yurij Popov <oss@djphoenix.ru>
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: Don't use RDTSC on 386s and
 486s
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
X-List-Received-Date: Mon, 03 Dec 2012 13:01:09 -0000

On Fri, Nov 23, 2012 at 03:12:50PM +0000, Peter Maydell wrote:
> Adjust the conditional which guards the implementation of
> cpu_get_real_ticks() via RDTSC, so that we don't try to use it
> on x86 CPUs which don't implement RDTSC.  Instead we will fall
> back to the no-cycle-counter-available default implementation.
> 
> Reported-by: Yurij Popov <oss@djphoenix.ru>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  qemu-timer.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-timer.h b/qemu-timer.h
> index da7e97c..e35f163 100644
> --- a/qemu-timer.h
> +++ b/qemu-timer.h
> @@ -169,7 +169,7 @@ static inline int64_t cpu_get_real_ticks(void)
>      return retval;
>  }
>  
> -#elif defined(__i386__)
> +#elif defined(__i586__)
>  
>  static inline int64_t cpu_get_real_ticks(void)
>  {
> -- 
> 1.7.9.5

Dropping this due to the issue with gcc __i586__ that has been
discussed.

Stefan

