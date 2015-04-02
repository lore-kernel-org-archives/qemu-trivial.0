Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ydfbb-0001KP-F5
	for mharc-qemu-trivial@gnu.org; Thu, 02 Apr 2015 09:56:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YdfbZ-0001Ht-I8
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 09:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YdfbW-0001To-2b
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 09:56:21 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:35672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YdfbV-0001Ta-T3; Thu, 02 Apr 2015 09:56:18 -0400
Received: by widdi4 with SMTP id di4so79655169wid.0;
	Thu, 02 Apr 2015 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Z9dwBmYcddB77WICiPmTUUmJfhp2D9g/5mllLcT4kFs=;
	b=g9KCYgHIORxGAskjC/gWiwDeBtfs6aroDDMMuTyc62D8wtBChgEZfjQIj8dknOt+EO
	UMg26aFo9o5YBg0TZGcP81N/s/6RDPk/k5lkpiM2LK1mVzej1e19KQFNXFOkV03XDS0f
	wZIYmxr2cujT4wUvEYWiS8FvwwRBcXxqgVHwJTZEGbbSAQAw6+fDEjyyf195WOEE7c67
	o+9ltDM+aErGVDjq0WtLm4eZIu3JM6U+1U/mmBK7gg2jvx/K4I/LK2pBkALo42BafFTj
	nVeDmJqbqn3CYu/T9rfJUgT4z0OL7DQMLOzIdYWaVqmI4WOnq2m2d8zPkHNvAOym0nU2
	UwCA==
X-Received: by 10.180.37.3 with SMTP id u3mr15310483wij.43.1427982977265;
	Thu, 02 Apr 2015 06:56:17 -0700 (PDT)
Received: from [192.168.10.165] (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41]) by mx.google.com with ESMTPSA id
	wo10sm7370523wjb.35.2015.04.02.06.56.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Apr 2015 06:56:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <551D4A7E.3060301@redhat.com>
Date: Thu, 02 Apr 2015 15:56:14 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
References: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Use $(MAKE) for recursive make
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
X-List-Received-Date: Thu, 02 Apr 2015 13:56:22 -0000



On 01/04/2015 19:58, Ed Maste wrote:
> On BSDs "make" is typically BSD make, while "gmake" is GNU make.
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88bce56..ee40397 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -331,8 +331,8 @@ distclean: clean
>  	rm -rf $$d || exit 1 ; \
>          done
>  	rm -Rf .sdk
> -	if test -f pixman/config.log; then make -C pixman distclean; fi
> -	if test -f dtc/version_gen.h; then make $(DTC_MAKE_ARGS) clean; fi
> +	if test -f pixman/config.log; then $(MAKE) -C pixman distclean; fi
> +	if test -f dtc/version_gen.h; then $(MAKE) $(DTC_MAKE_ARGS) clean; fi
>  
>  KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
>  ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
> 

Applied, thanks.

Paolo

