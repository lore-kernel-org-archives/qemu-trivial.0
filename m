Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Svt3b-00047v-3j
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2012 12:42:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Svt3W-000466-6J
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Svt3Q-00086P-7U
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:42:54 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:48522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Svt3P-000861-V5; Mon, 30 Jul 2012 12:42:48 -0400
Received: by wibhm2 with SMTP id hm2so1549308wib.10
	for <multiple recipients>; Mon, 30 Jul 2012 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o3ji785rFlr/4rVELB0nEPaapI+SWZjRIm9XbhDzrQQ=;
	b=hq9wJilZse6ETxGgUiop8pHMPNT9lYVB7ILYLqNeWxiwk5ZTOqMyHUrT4lhIze/x/5
	wFxaMIJELNVDfzz2f5yPffisGoxBs043dfUouxh21IJVPKfPPCqoWq8y8XhkbdVYJOqe
	HqCOJWszhWPv67wQHPEk+k0VOujrvdLKJKbTDmFLeSK2337+TXBP9yIz1k8PF99qPhuj
	5THajFh3+g0QOREpq8cP3dsGr/ZJjhpe2CqAbldlREVNhC8N5M35UkL6OPEtqBE+xC+s
	k1W1GHM93eyatoJ32l37Jx/QMnev+Rar3cmYmh/KXr0C7DCcXvvhFP0ohFFMAKZZP6Nu
	evxQ==
Received: by 10.180.100.133 with SMTP id ey5mr27996552wib.4.1343666567009;
	Mon, 30 Jul 2012 09:42:47 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	fb20sm25382892wid.1.2012.07.30.09.42.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 09:42:46 -0700 (PDT)
Date: Mon, 30 Jul 2012 17:42:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120730164244.GB21719@stefanha-thinkpad.localdomain>
References: <1343569729-11218-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343569729-11218-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Remove generated
 hw/usb files in 'clean' target
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
X-List-Received-Date: Mon, 30 Jul 2012 16:42:58 -0000

On Sun, Jul 29, 2012 at 03:48:49PM +0200, Stefan Weil wrote:
> Commit f1ae32a1ecda8aaff7a355c9030c0d8c363f3a70 moved the
> usb directory to hw, so the files which should be removed
> are now hw/usb/*.{d,o}.
> 
> The new code removes these files and also any other generated
> *.o and *.d files in directories below hw.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index e4c754d..30f9e91 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -215,7 +215,7 @@ clean:
>  	rm -Rf .libs
>  	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
>  	rm -f qom/*.o qom/*.d
> -	rm -f usb/*.o usb/*.d hw/*.o hw/*.d
> +	rm -f hw/*/*.o hw/*/*.d hw/*.o hw/*.d
>  	rm -f qemu-img-cmds.h
>  	rm -f trace/*.o trace/*.d
>  	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
> -- 
> 1.7.10

Thanks.  Jan Kiszka already submitted an equivalent patch which I have
merged.  He used hw/usb/*.o hw/usb/*.d instead of hw/*/....

Stefan

