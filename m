Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL9M8-0006nz-4p
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:42:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9M5-0006k1-6x
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9M3-00080I-W3
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:42:45 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:47560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL9M0-0007zg-UH; Thu, 28 Mar 2013 05:42:41 -0400
Received: by mail-wi0-f171.google.com with SMTP id hn17so3120557wib.4
	for <multiple recipients>; Thu, 28 Mar 2013 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=o4VR0S/pA8qsAUvnOD5jbJJ4B3p8PyH2K6dVD3/zLbM=;
	b=efHYO7ZVn3Bg7zeIfzdBbDWV1CsZfbhaV9nmEzaLukO5Yqx8WCR6hMV8Y4vQTUqwPm
	uF67+YLs2n1e/kPx7+hmz8jRYnBwC2P98W2cjRP9o1mKyCzTk6MYN0cyRJlhsW1yVTgo
	0NQwoI1wfqR9B5h7vgmE+oTPr9iIsJCcIf/1UXAxAita72vwyWWTXgIAEwFdXv22X0BJ
	u3RCmq2S53IHDKp/kE6yLGGE+iLUDMuX7Ie3H2JFNzXWD+FOm4RI1FquyYohh0t+ajiy
	ZItlxBdF9mzYn9y92HAmMYd6ZDTBNuMcp2SNY/qv4KciUIzEZjq3bpqift77WoQvIJo5
	EZUw==
X-Received: by 10.194.7.131 with SMTP id j3mr36665989wja.23.1364463760086;
	Thu, 28 Mar 2013 02:42:40 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id o5sm14689189wix.3.2013.03.28.02.42.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:42:39 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:42:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Message-ID: <20130328094237.GE24910@stefanha-thinkpad.redhat.com>
References: <1364364631-24665-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364364631-24665-1-git-send-email-lig.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: reject to boot a
 wrong header magic kernel
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
X-List-Received-Date: Thu, 28 Mar 2013 09:42:46 -0000

On Wed, Mar 27, 2013 at 02:10:31PM +0800, liguang wrote:
> if head magic is missing or wrong unexpectedly, we'd
> better to reject booting.
> e.g.
> I make a mistake to boot a vmlinuz for MIPS(which
> I think it's for x86) like this:
> qemu-system-x86_64 -kernel vmlinuz -initrd demord
> then qemu report:
> "qemu: linux kernel too old to load a ram disk"
> that's misleading.
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b1e06fa..2b78dfc 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -683,8 +683,10 @@ static void load_linux(void *fw_cfg,
>          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
>                             kernel_cmdline, kernel_size, header)) {
>              return;
> +        } else {
> +            fprintf(stderr, "please assure specicified kernel is for x86!\n");
> +            exit(1);

load_multiboot() can fail for other reasons so this error messing is
misleading.  Giving QEMU a non-x86 kernel is just one scenario where
this may fail.

>          }
> -        protocol = 0;
>      }

Why did you drop protocol = 0?

Stefan

