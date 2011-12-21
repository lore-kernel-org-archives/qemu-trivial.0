Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdJvf-0000Nx-Li
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 06:01:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJva-0000Lg-Oh
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 06:01:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJvI-0005tp-9Z
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 06:01:33 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:59451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RdJv2-0005rh-O6; Wed, 21 Dec 2011 06:01:08 -0500
Received: by qcsd15 with SMTP id d15so4670539qcs.4
	for <multiple recipients>; Wed, 21 Dec 2011 03:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9ygHgbxsWPju69QmEtDBYWm+7lNmFH/facUz7vORsIg=;
	b=kAJ83S3FFPtJQx6/G/xDVjQU/wlVXlQEz71khnh6KK+eN93Ze2ixRLyoy3Yejf0lhK
	+5WnOo4q+YZKce5yrKX/cfKXRdXXWqFNWxnQKINqf7fGTBT8WT9gCYPCFyoH6/PkR9ao
	vZ1byJvLo3G/k3AwrDoKsFmh4/huFJORG1F/A=
Received: by 10.224.182.135 with SMTP id cc7mr7572085qab.51.1324465268016;
	Wed, 21 Dec 2011 03:01:08 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id hv20sm9862121qab.22.2011.12.21.03.01.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 03:01:07 -0800 (PST)
Date: Wed, 21 Dec 2011 11:01:02 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111221110102.GC22697@stefanha-thinkpad.localdomain>
References: <1324401188-9712-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324401188-9712-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Strip trailing '\n' from
 error_report()'s first argument (again)
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
X-List-Received-Date: Wed, 21 Dec 2011 11:01:47 -0000

On Tue, Dec 20, 2011 at 06:13:08PM +0100, Markus Armbruster wrote:
> Commit 6daf194d got rid of them, but Hans and Gerd added some more
> lately.  Tracked down with this Coccinelle semantic patch:
> 
> @r@
>     expression fmt;
>     position p;
> @@
>     error_report(fmt, ...)@p
> @script:python@
>     fmt << r.fmt;
>     p << r.p;
> @@
> if "\\n" in str(fmt):
>     print "%s:%s:%s:%s" % (p[0].file, p[0].line, p[0].column, fmt)
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/usb-bus.c |   12 ++++++------
>  usb-redir.c  |    4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

