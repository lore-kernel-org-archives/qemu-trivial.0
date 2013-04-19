Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7tV-0001Ei-JD
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:46:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7tS-0001A0-VV
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7tR-0000Qt-94
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:46:10 -0400
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e]:38099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7tO-0000MW-Sa; Fri, 19 Apr 2013 05:46:07 -0400
Received: by mail-we0-f174.google.com with SMTP id u12so3309268wey.33
	for <multiple recipients>; Fri, 19 Apr 2013 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6FHEP1MWAd0JKMjAeILq6shprCeKmTCLS+/rBB8aiH4=;
	b=hfsWa8QkuipeFoZh2gMuNyZ3qIGjG6eg+r6IEiE/9Up9HhptnaF65VgHd6G17zazRe
	Sl4kC/+YxXp9ReiaVoALPpy1/fmoZPXmif4NlJCjpZKRHImXyewgB1EclMRw5CoNVR6s
	2NyNGRbXqbCrpzT1YmeIxpvQkDqUMgXx9aM4bzSQHJyR20PlMAlI/iaBdUzpZJvEY3r8
	+q3yAw/VnfhcdxwBeg894WNMzSDyTpENsjqV7KSe55slhcpoDPN6TpIoMRniF+Cle/Jk
	8N4EreUFp0SJlHPE82+sX0r1YM3g/grm2qWw5F+pWYxCx3QDTDMpU/moHYKTodrEOv6J
	R79Q==
X-Received: by 10.194.157.138 with SMTP id wm10mr24386310wjb.28.1366364766039; 
	Fri, 19 Apr 2013 02:46:06 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPS id d8sm2421892wiv.10.2013.04.19.02.46.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:46:05 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:46:02 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: peter.crosthwaite@xilinx.com
Message-ID: <20130419094602.GI30143@stefanha-thinkpad.redhat.com>
References: <1366337885-9358-1-git-send-email-peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366337885-9358-1-git-send-email-peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] m25p80: Remove bogus include of devices.h
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
X-List-Received-Date: Fri, 19 Apr 2013 09:46:12 -0000

On Fri, Apr 19, 2013 at 12:18:05PM +1000, peter.crosthwaite@xilinx.com wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> I think in the early revisions of this we had an instantiation helper
> for the device in devices.h. This was later removed and this header was
> left over. Removed
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/block/m25p80.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

