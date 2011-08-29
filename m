Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qy0CK-0000oL-Ml
	for mharc-qemu-trivial@gnu.org; Mon, 29 Aug 2011 07:40:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qy0CH-0000dr-MI
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 07:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qy0CG-0002Lf-HK
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 07:40:09 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:49067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qy0CD-0002Im-Qt; Mon, 29 Aug 2011 07:40:05 -0400
Received: by wwf25 with SMTP id 25so5213725wwf.10
	for <multiple recipients>; Mon, 29 Aug 2011 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bAiz1ULzmZerpSJ8H2e8PHQ9iaCdx9K1Wde+hgGb8CY=;
	b=rwmVYXVXWyLbnLKt9tAw/WobeWu0k7+QGHuJp5r3tpbJaE/aLBC9NrundMkICONpKw
	ZrkFkEQwkjbCmCB4Vd6Kou4i4jcfdU/+3x0sO+vHmdhh6F8D/tsL4DQRZslcWKAT5sbM
	8VkjdNGSf6BoAhueoKlZBYzEM+KxpK87Rns1k=
Received: by 10.216.229.157 with SMTP id h29mr4603483weq.20.1314618004784;
	Mon, 29 Aug 2011 04:40:04 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id h62sm2843929wee.32.2011.08.29.04.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 04:40:03 -0700 (PDT)
Date: Mon, 29 Aug 2011 12:39:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110829113957.GA6780@stefanha-thinkpad.localdomain>
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix potential crash in debug code
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
X-List-Received-Date: Mon, 29 Aug 2011 11:40:10 -0000

On Wed, Jul 20, 2011 at 08:56:35PM +0200, Stefan Weil wrote:
> cppcheck reports this error:
> 
> qemu/hw/sh_intc.c:390: error: Possible null pointer dereference:
>  s - otherwise it is redundant to check if s is null at line 385
> 
> If s were NULL, the printf() statement would crash.
> Setting braces fixes this bug.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  hw/sh_intc.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

