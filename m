Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRfZ-0003Wl-HF
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:31:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRfX-0003Wf-Pd
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRfW-0006qT-Qq
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:30:59 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:61444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRfW-0006pN-Kg; Sat, 22 Sep 2012 11:30:58 -0400
Received: by wibhm2 with SMTP id hm2so2403431wib.10
	for <multiple recipients>; Sat, 22 Sep 2012 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nl9OelCOs2L93OXQsfIqHAwk/9ZIBXiDKzJGi1GPdgw=;
	b=uJFXS+OwGDOTrtzGPv5z+bpY/WVh9DNcR11C9mOfMVOEpc3PmOzbXRLdDtBAydyBt1
	PXfgAAjqw1tACD4S3pf1lAzCnct3QPks6ifyG160CU5Qg0w6TyjcJKDwZJDlizYT0M6+
	f1Yh07r33X/100MjclVy7GKcC/O5HhWRyNaH/+VqjnbpTu6M8WWI9RS8oz9O0y8B6mTR
	bn0a3UdP1SGSkYVMkiCH3HdjAmVILayg7A5Du/lHfdzQ3vDWwfqPuc42bmcMqeMYPnOB
	0OfAN2fweOQahBi2ab7FYcl1OXUelS1vC4LlFTVWhCPrErO6jHobst4LLbXm8OGEibiu
	kaPA==
Received: by 10.216.194.223 with SMTP id m73mr4794922wen.144.1348327857618;
	Sat, 22 Sep 2012 08:30:57 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id dm3sm4736633wib.3.2012.09.22.08.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:30:56 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:30:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922153055.GC13216@stefanha-thinkpad.localdomain>
References: <1346490743-9652-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346490743-9652-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cadence_uart: Fix buffer overflow
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
X-List-Received-Date: Sat, 22 Sep 2012 15:31:00 -0000

On Sat, Sep 01, 2012 at 11:12:23AM +0200, Stefan Weil wrote:
> Report from smatch:
> hw/cadence_uart.c:413 uart_read(13) error: buffer overflow 's->r' 18 <= 18
> 
> This fixes read access to s->r[R_MAX] which is behind the limits of s->r.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/cadence_uart.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

