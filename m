Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UIzwi-0000Xr-UG
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 07:15:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UIzwe-0000Xa-Kw
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 07:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UIzof-0004Al-Rz
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 07:07:42 -0400
Received: from mail-vb0-x231.google.com ([2607:f8b0:400c:c02::231]:64640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UIzof-0004AQ-Jl; Fri, 22 Mar 2013 07:07:21 -0400
Received: by mail-vb0-f49.google.com with SMTP id s24so2551139vbi.36
	for <multiple recipients>; Fri, 22 Mar 2013 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=PLh9uIOEktFvyU0sUESf834amyCqLLRjrGfg1GenDkY=;
	b=v5OhhElmVk1a7cRNtzjn2YiWKuDc1SYHWGV7Bo9KN3B8TFPBVMvDn9yMrRRXuPEBTj
	4wOZGmgOXQXCHno3HWwVjDA8shI7/w0JK/kUjGYLFdWO7GKOq95crNeC0eEQ8SMVe9fJ
	PSNXlKOhrVe0zlL/omFd6ccTrWNlxgJyJrclbwT3eHOSszQZ95suhXTHmta/CYaxDLbp
	eZabPMUkcDLtdMXXA9TBFDJbNug6IdsDjm2cVZNF22c7qwRjNcwHgTNV2AsGFUvrWsK8
	KVas0kbwoaD68IcK+sbvu+i8Kr2RnM/xnM7SWQoMcnESL9jTlQIRu5KiobSlGz11ShVJ
	UWsA==
X-Received: by 10.52.94.71 with SMTP id da7mr1390407vdb.13.1363950440678;
	Fri, 22 Mar 2013 04:07:20 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPS id tb9sm2387802veb.6.2013.03.22.04.07.18
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 04:07:19 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <514C3B63.8030308@redhat.com>
Date: Fri, 22 Mar 2013 12:07:15 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c02::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/pc: fix possible segment fault
	for port92_write
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
X-List-Received-Date: Fri, 22 Mar 2013 11:15:39 -0000

Il 22/03/2013 10:12, liguang ha scritto:
> e.g.
> $qemu-system-x86_64 -device port92
> will report segment fault,
> for port92_write try a un-allocated
> assignment for a20_out.
> so check before this assignment.
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ed7d9ba..a0e8ee0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -440,7 +440,8 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
>  
>      DPRINTF("port92: write 0x%02x\n", val);
>      s->outport = val;
> -    qemu_set_irq(*s->a20_out, (val >> 1) & 1);
> +    if (s->a20_out)
> +        qemu_set_irq(*s->a20_out, (val >> 1) & 1);
>      if (val & 1) {
>          qemu_system_reset_request();
>      }
> 

Unfortunately, this is a very common problem.  The correct fix is to
change port92 to use the GPIO mechanism instead.

Paolo

