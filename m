Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws5Vt-00020y-US
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 03:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1Ws5Vn-0001tn-F8
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 03:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1Ws5Vi-0001Jp-KB
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 03:21:27 -0400
Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231]:54747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1Ws5VY-0001HO-MW; Wed, 04 Jun 2014 03:21:12 -0400
Received: by mail-pd0-f177.google.com with SMTP id g10so5706640pdj.22
	for <multiple recipients>; Wed, 04 Jun 2014 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iQFWfkupjCL/jvLFfOECV26eo3LfS06VNq5brt6/onI=;
	b=mq4+WfgF/lkIX9MqoXK6sgEKtd8PGodGQVzZpd1qKuU4Q8VtRXh9PPhppg3W+enNXO
	Oc0n/DvaXGvFvyQAoYfq5OvVNyczPKLLYDX9DaH0d56XAVyndA+7eb0OmAVW3EwDAGnN
	ijgLDz6AzEl7KYdox8EcOPILY/aUR0POsUcc52/4uepPREF99QaBfmZhjNdQ4YeYfe0D
	jdhXcnHf8oNsEgIgwDkWULH5ujDZlvbLjHEfprdcqAS40gX5aoCoTTjlMp1vsBMWVGdx
	neLmLd9E3K+76MYIciMZfpcqMYy5P6KF3XoaEIOIguSoLoDrx6QDdqQVrKODpY7M5GSD
	8Y2g==
X-Received: by 10.68.197.39 with SMTP id ir7mr61004302pbc.78.1401866471485;
	Wed, 04 Jun 2014 00:21:11 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id dd5sm6213555pbc.85.2014.06.04.00.21.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 00:21:11 -0700 (PDT)
Date: Wed, 4 Jun 2014 09:13:35 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140604071335.GH3378@toto>
References: <1401818361-1581-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401818361-1581-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] target-microblaze: Delete unused
	sign_extend() function
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
X-List-Received-Date: Wed, 04 Jun 2014 07:21:32 -0000

On Tue, Jun 03, 2014 at 06:59:21PM +0100, Peter Maydell wrote:
> The sign_extend() function is unused; delete it.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Peter, feel free to push this straight in.

Thanks,
Edgar

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We have sextract() for this these days anyway.
> ---
>  target-microblaze/translate.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
> index 488df2d..50c214b 100644
> --- a/target-microblaze/translate.c
> +++ b/target-microblaze/translate.c
> @@ -98,19 +98,6 @@ static const char *special_regnames[] =
>      "sr16", "sr17", "sr18"
>  };
>  
> -/* Sign extend at translation time.  */
> -static inline int sign_extend(unsigned int val, unsigned int width)
> -{
> -        int sval;
> -
> -        /* LSL.  */
> -        val <<= 31 - width;
> -        sval = val;
> -        /* ASR.  */
> -        sval >>= 31 - width;
> -        return sval;
> -}
> -
>  static inline void t_sync_flags(DisasContext *dc)
>  {
>      /* Synch the tb dependent flags between translator and runtime.  */
> -- 
> 1.9.2
> 

