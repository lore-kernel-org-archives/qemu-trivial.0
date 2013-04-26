Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVfQF-0005OW-LB
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 05:58:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfQD-0005Lx-D6
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 05:58:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfQC-0007ta-Bh
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 05:58:29 -0400
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231]:49806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UVfQB-0007tQ-Ti; Fri, 26 Apr 2013 05:58:28 -0400
Received: by mail-bk0-f49.google.com with SMTP id w5so1672192bku.8
	for <multiple recipients>; Fri, 26 Apr 2013 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6kuyu2va0KeDyS6HxhbEu0TyIB1V9HVUbpsROYnd3TM=;
	b=i+30zhGDkaHOPy5Frex9dAfcDKsGn4eBkngtjjZWrp5eDUkCecV1qNh8jQJx7dASU8
	y0dRmIEGSN3bHle8Q+Igw175dEjU8Eo1k1+kOa3RWVxr2fsLsQW+84gYKCF0/7f2UWCC
	my0HOYO3BF/cFeTju9f8bNY3jaEqJQtNnKdVxxlkASQ+oRBgQoD+bW/V9yFoiFcOQbQ4
	pLVilnNZzb3aqwga3Bk5VqhAAp4E0AneCe4YxRQQYVd4vVxfmfNgqtJIkn9RqbdIn3ND
	g0Akn1HepDtMey1JP2iGexCDxrRzWiQhKJPg1V6G/PmfEh2qS10HcEPV56FCEnuTAU+k
	3quw==
X-Received: by 10.204.51.200 with SMTP id e8mr18084839bkg.131.1366970306826;
	Fri, 26 Apr 2013 02:58:26 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id fh8sm2876526bkc.10.2013.04.26.02.58.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 02:58:26 -0700 (PDT)
Date: Fri, 26 Apr 2013 11:58:24 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gabriel Kerneis <gabriel@kerneis.info>
Message-ID: <20130426095824.GB22315@stefanha-thinkpad.hitronhub.home>
References: <1366737312-8598-1-git-send-email-gabriel@kerneis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366737312-8598-1-git-send-email-gabriel@kerneis.info>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] s390x: use CONFIG_INT128 to detect
 __uint128_t
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
X-List-Received-Date: Fri, 26 Apr 2013 09:58:30 -0000

On Tue, Apr 23, 2013 at 06:15:12PM +0100, Gabriel Kerneis wrote:
> Target s390x uses ad-hoc macro magic to guess if the compiler
> supports the GCC extension __uint128_t.  This patch uses the
> the dedicated macro CONFIG_INT128 defined by configure instead.
> 
> This fixes compilation with the CIL source code analyzer, which
> uses GCC as a preprocessor but does not support __uint128_t.
> 
> Signed-off-by: Gabriel Kerneis <gabriel@kerneis.info>
> ---
>  target-s390x/int_helper.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

