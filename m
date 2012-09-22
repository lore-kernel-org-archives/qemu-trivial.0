Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSd1-000555-15
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:32:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFScy-0004z5-Sb
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFScx-0003df-Pd
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:32:24 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:52708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFSct-0003co-Vg; Sat, 22 Sep 2012 12:32:20 -0400
Received: by weyt11 with SMTP id t11so2299946wey.4
	for <multiple recipients>; Sat, 22 Sep 2012 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=U6sH+PVg5X89yiGePMsNtwCkAkyzsoU6P7tqbaMhbmY=;
	b=c9wguQmH/ANcaY1iTv+/xxt35hIJciJXUVv/uGW1stpxbZpHAziPD5cns2YxD3PeEi
	uswmQ3t1zcLyCMDEiXo984idHlEcqPqPGFvIg47pikGMImcyiyETB5iusavdaVpgqc8V
	do/e7k1A9xNrHSdaOU/PYESGhOeJNp1zoWLzO5lBIn3tme2r4xfDJNBhZZ9iErADoxKm
	XPCsArIgC1UB72/KSXwdFmYYm40wBxgf2QpohS0mSbm98ZVkVSxC4ia4w1DNXpBBZoyr
	Tv6cGMzMCjkg9WP3J/J1TlASkt8MF50kuy5qnRzaLVsV3mFzWmH+j1J004v8M4MqmsH2
	8t5Q==
Received: by 10.180.8.40 with SMTP id o8mr3833639wia.9.1348331538900;
	Sat, 22 Sep 2012 09:32:18 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l5sm5040683wix.5.2012.09.22.09.32.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:32:18 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:32:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922163216.GC14154@stefanha-thinkpad.localdomain>
References: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] net/socket: Fix compiler warning
	(regression for MinGW)
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
X-List-Received-Date: Sat, 22 Sep 2012 16:32:25 -0000

On Thu, Sep 20, 2012 at 09:32:19PM +0200, Stefan Weil wrote:
> Add a type cast which was removed by commit
> 213fd5087e2e4e2da10ad266df0ba950cf7618bf again.
> 
> Without it, MinGW compilers complain:
> 
> net/socket.c:136: warning:
>  pointer targets in passing argument 2 of ‘sendto’ differ in signedness
> /usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/include/winsock2.h:1313: note:
>  expected ‘const char *’ but argument is of type ‘const uint8_t *’

Wow, that's messed up.  sendto() is POSIX and the prototype shouldn't be
const char *.

It's easy for someone to remove this cast in the future.  Please add a
comment explaining that it's needed because MinGW headers don't have the
POSIX version of sendto().

Thanks,
Stefan

