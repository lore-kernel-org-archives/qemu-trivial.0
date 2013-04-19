Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7nI-0005kP-VG
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:39:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7nF-0005k0-KL
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7nD-0006HA-7G
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:39:45 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:36570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7nD-0006G4-0Y; Fri, 19 Apr 2013 05:39:43 -0400
Received: by mail-wi0-f182.google.com with SMTP id m6so513761wiv.9
	for <multiple recipients>; Fri, 19 Apr 2013 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2WM9cF2WlExoZe2/yDcJDZU8Wcx9On9ShT3upkMK6RE=;
	b=Wo2ut+8DUt4DJkocqB0NbXkysbjIDYY4+VLAJwaVNhOATA4GeYRDtD7SqqWaBUeDIU
	S5at22W1RbW3PVVF/gL+teY7ya0zuZZflWlKA7rLrvmKMmjMdwdrc65h81eZntqojnqW
	rtg3qFpB1iRo0ver/EtqHWiwn3L/35xhtBGZmV3S0VlvYsChoSNQKZjZjRu5KuIswZ7r
	N9FC65QtlRqFEKYlmHA51mdHEyiOxj5R/J0WFIFPTPcRKWwb7xw+nuOMos9M8lIlRoHK
	NWTofcstXJG3JWx3SBIts/J30GcreO/ZRpaL4D8RWQzKkS6lHzlmjkgKGJYXrtyZKLcs
	ucAA==
X-Received: by 10.194.7.68 with SMTP id h4mr24411522wja.49.1366364382212;
	Fri, 19 Apr 2013 02:39:42 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPSA id bj9sm2158280wib.4.2013.04.19.02.39.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:39:41 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:39:39 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130419093939.GE30143@stefanha-thinkpad.redhat.com>
References: <1365972770-13777-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365972770-13777-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Add lost ARM core again
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
X-List-Received-Date: Fri, 19 Apr 2013 09:39:47 -0000

On Sun, Apr 14, 2013 at 10:52:50PM +0200, Stefan Weil wrote:
> Commit 0434e30afb6175212389811e0b28b948eb3c1e40 accidentally removed
> the compilation of arm11mpcore.c.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  default-configs/arm-softmmu.mak |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 31725a9..27cbe3d 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -34,8 +34,8 @@ CONFIG_PFLASH_CFI02=y
>  CONFIG_MICRODRIVE=y
>  CONFIG_USB_MUSB=y
>  
> -CONFIG_ARM5MPCORE=y
>  CONFIG_ARM9MPCORE=y
> +CONFIG_ARM11MPCORE=y

Did you mean to remove CONFIG_ARM5MPCORE?

