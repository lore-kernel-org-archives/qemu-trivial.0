Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZkKM-0003XM-PU
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:52:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZkKJ-0003WX-QS
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:52:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZkKI-0006xJ-5S
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:52:11 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:45902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZkKH-0006xB-OO; Thu, 23 Jun 2011 09:52:09 -0400
Received: by wwf26 with SMTP id 26so1694519wwf.10
	for <multiple recipients>; Thu, 23 Jun 2011 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rUhdPgipkTMreuNShmrLMPn4yLvqavvOyDyAWpZ+oM0=;
	b=l7yfrYKU5QkSbN4qMsoyNLvKAIqO4YIOsitFoQ6lhzQHV/rTvOnLVqHiy90mYkndIG
	ULUDnxdVixoI3ahQKofcC7femqRUrkuVgcBTtSScR2GdxLLQwttf1ocw7d1+pcRVDYsX
	FTcMlA+pgSML7v3gaXOHfLSN4UH/MQyfdFaZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lTytLwnC8mpap3IsvDtbv03MOKs0H59FyF+OVvQlaXxx+C0k4GVZLLWJ2gxYb6N/cD
	lXLCq4jZal/yiBgIHKKFplOZ2WXVl3u7VkVQ9xyQKThmAL3B916Zgo9BkK2YkHrc4o4I
	8m3/vhvjDzHK1cWocB+v3uKfjpTgZ9tMkk+Dk=
Received: by 10.216.135.133 with SMTP id u5mr898870wei.61.1308837128515;
	Thu, 23 Jun 2011 06:52:08 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id a3sm875553wed.6.2011.06.23.06.52.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:52:07 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:52:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110623135202.GA12765@stefanha-thinkpad.localdomain>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
	<4DFC636D.9090800@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DFC636D.9090800@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Roy Tam <roytam@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix MinGW compilation when
 --enable-vnc-jpeg is specified
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
X-List-Received-Date: Thu, 23 Jun 2011 13:52:13 -0000

On Sat, Jun 18, 2011 at 10:35:57AM +0200, Stefan Weil wrote:
> Am 18.06.2011 07:13, schrieb Roy Tam:
> >This patch fix conflicting types for 'INT32' in basetsd.h in including
> >qemu-common.h first.
> >
> >
> >Sign-off-by: Roy Tam<roytam@gmail.com>
> >--
> >diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> >index 87fdf35..1591df0 100644
> >--- a/ui/vnc-enc-tight.c
> >+++ b/ui/vnc-enc-tight.c
> >@@ -28,6 +28,8 @@
> >
> >  #include "config-host.h"
> >
> >+#include "qemu-common.h"
> >+
> >  #ifdef CONFIG_VNC_PNG
> >  #include<png.h>
> >  #endif
> >@@ -36,8 +38,6 @@
> >  #include<jpeglib.h>
> >  #endif
> >
> >-#include "qemu-common.h"
> >-
> >  #include "bswap.h"
> >  #include "qint.h"
> >  #include "vnc.h"
> 
> Acked-by: Stefan Weil <weil@mail.berlios.de>
> 
> The conflicting declaration is in jmorecfg.h which is included from
> jpeglib.h.

Is the problem that the Windows headers included from qemu-common.h try
to #define INT32?
http://msdn.microsoft.com/en-us/library/aa383751(v=vs.85).aspx

In that case I think an explicit fix is better:

#ifdef _WIN32
/* Include this before jpeglib.h for the INT32 definition */
#include <basetsd.h>
#endif

...followed by png/jpeg includes...

Simply moving qemu-common.h provides no hints and is rather indirect.
Someone may move it back in the future.

Stefan

