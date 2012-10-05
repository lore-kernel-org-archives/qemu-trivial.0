Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK7sd-0000nd-Nv
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 09:23:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7sW-0000jw-KC
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7sM-0007MJ-SK
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:23:44 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:56216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK7sM-0007MA-JY; Fri, 05 Oct 2012 09:23:34 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so796017bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 06:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HGZs0h+uRdywnhZBMttjDnDCkJdOgWs8VMhRd3V+9KI=;
	b=hKoCm9wkQUb6NbukxbUszwOc83rHjF46rscxkuV5tnQE+vvPSDUU8W/XempGp7FBKP
	EGvQckjnOi9qqyO4VK4dsMbGvc3ZieRj95etRggv8vWZxuQvC+YIy6qVdZOrjhJQ8s2g
	eMjWIdnG+dPIa0ZORW9jMhC5MZ6Y+bkEm76clNXrYbnJ97zIfgL9y6CRehGLyH5DxkMR
	Z76K6Ewurfo7yLlKNwTF4BQLF9cY64yW/tPMpKVNAoaew+IWF5ov7tbUuQAX9FWtCKw2
	DCGxkj0rtgQNXphoLHuTPvQU/GxM4DyuVE8Q6vLhysxA6puYxMWQmBu6oE2/ExnymstS
	2xxw==
Received: by 10.204.131.75 with SMTP id w11mr2843152bks.111.1349443413540;
	Fri, 05 Oct 2012 06:23:33 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id gy18sm7681771bkc.4.2012.10.05.06.23.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:23:32 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:23:30 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005132330.GG10951@stefanha-thinkpad.redhat.com>
References: <1349255979-5404-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349255979-5404-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Add missing 'static' attribute for
 QEMUMachine
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
X-List-Received-Date: Fri, 05 Oct 2012 13:23:50 -0000

On Wed, Oct 03, 2012 at 11:19:39AM +0200, Stefan Weil wrote:
> It was missing for leon3 and mips_fulong2e.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/leon3.c              |    2 +-
>  hw/mips/mips_fulong2e.c |    2 +-

This file doesn't exist in my tree (based on qemu.git/master
a14c74928ba1fdaada515717f4d3c3fa3275d6f7).  I have modified it to
hw/mips_fulong2e.c.

>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

