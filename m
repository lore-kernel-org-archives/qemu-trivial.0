Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9C08-0006bC-B1
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:34:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9C00-0006NH-KI
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9Bzz-0001o8-B9
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:34:16 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:58050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9Bzz-0001nx-4y; Wed, 05 Sep 2012 05:34:15 -0400
Received: by weyz53 with SMTP id z53so263403wey.4
	for <multiple recipients>; Wed, 05 Sep 2012 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HhZvRuTJsmsRujR4wwfhOEQmd1jPukVF8sOjCZ0aFhQ=;
	b=nCa0Z1jmh0vtcTM4ssUn804nVVgBdVRnuO0wBoj94TA/BYNWwQhwRtGV8s5vog5DDg
	DVeHK1GQz/cpkM3Vt9tCor3mC1R3Q7dXN+3/JmGgh47s0mrNUNpumwWsLZg1BSQ/vCJr
	7s4oadrddLOZzUYQ0WgOqXVzyCg0NnW7I+rjDBTOfB+XDNGG7g6PkkI2gvzeLQPSPOiy
	iNWkzyHvdyitDUFx6u1Dt2wjhuQgYfpT53UW07Xdv5aIDXZc0yySwlqE5uL0+LbRLnnB
	zJqV0aEnOeXkxkSODffyt8aQT8+8hdUEw82jWleKJZhUlSlUQ2nTVWvFJhS+Q3dS8LN/
	MpRQ==
Received: by 10.180.84.164 with SMTP id a4mr36853349wiz.12.1346837654308;
	Wed, 05 Sep 2012 02:34:14 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id b7sm3189088wiz.9.2012.09.05.02.34.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:34:13 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:34:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120905093412.GB4786@stefanha-thinkpad.localdomain>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346703803-22003-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sparc-dis: Remove redundant NULL check
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
X-List-Received-Date: Wed, 05 Sep 2012 09:34:22 -0000

On Mon, Sep 03, 2012 at 10:23:23PM +0200, Stefan Weil wrote:
> Report from smatch:
> sparc-dis.c:2664 build_hash_table(14) info:
>  redundant null check on hash_buf calling free()
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Coding style was not fixed.
> 
> - sw
> 
>  sparc-dis.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

