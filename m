Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRe5-0001rf-TP
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:29:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRe3-0001pD-J1
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRe2-0005cf-Ju
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:29:27 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:64599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRe2-0005bl-7u; Sat, 22 Sep 2012 11:29:26 -0400
Received: by wibhm2 with SMTP id hm2so2402666wib.10
	for <multiple recipients>; Sat, 22 Sep 2012 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a8RXGgWfd340K77WXcAeA+z5XRVMG0Sa2caUEzKM3Ls=;
	b=W+P2N2t79Lbld4hbhNetnCX/HFlpXnrTIph43+KBBqZ9sDQYRWZV10WRzy/idegzn6
	R46qGy/FgqjK3zo+TlIUoH4MTr9NtMd2X89JKNAvgGXP0+kbZfPUPbZ2XX3rlrUmnNNc
	tuEZu3d+kMVqXz4sJYsKck9rEjr27sTsAa7XcMkz5JIi4/J/mj5VWEu9uD9HhfAdkGHI
	JjHoNUJicNiZvcpkDT0RDMhXJarYKCoc6MuxVjgddAlemBzJuUGzeHTOWysmcyY+g5js
	9AdDXKhK/d3e4ZBrlYq9IC9Ft77zCMmPlyWP08/u0TOqeyh1XCzWKyg37aNN4bXSOF2T
	d3Hw==
Received: by 10.216.141.16 with SMTP id f16mr5015884wej.130.1348327765104;
	Sat, 22 Sep 2012 08:29:25 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id w7sm4146702wiz.0.2012.09.22.08.29.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:29:24 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:29:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922152922.GB13216@stefanha-thinkpad.localdomain>
References: <1346485226-26554-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346485226-26554-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: Fix potential memory leak
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
X-List-Received-Date: Sat, 22 Sep 2012 15:29:28 -0000

On Sat, Sep 01, 2012 at 09:40:26AM +0200, Stefan Weil wrote:
> The old code leaks variable 'peer'.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-sockets.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Report from smatch:
> qemu-sockets.c:404 inet_dgram_opts(101) warn: variable dereferenced before check 'peer' (see line 401)
> 
> It looks like this warning does not make sense, but nevertheless
> it helped me to discover the leak.
> 
> Regards,
> Stefan Weil

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

