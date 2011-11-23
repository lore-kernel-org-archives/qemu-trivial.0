Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT9KN-0003SY-2f
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 04:41:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9KK-0003LO-Kd
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9KJ-0008Ds-Ox
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:41:12 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:57587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RT9KH-0008Dc-8M; Wed, 23 Nov 2011 04:41:09 -0500
Received: by ggnb1 with SMTP id b1so1397031ggn.4
	for <multiple recipients>; Wed, 23 Nov 2011 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fzLLt0muVLqKhjAdOPsLokRGv0jd/msyLTeoNmjJey4=;
	b=QGhc1cEXySBkGaofaaU18DimiNjrYwRYx+R9OEMub7oSp0Gihf6sn70b25/U5n4z3j
	pIjpp1LN4N6CcGJhQOMhy2uCdn8vVbVPU+dHw+a1P2AdCGWsdjpo/xjs8v7lxhk6x8tI
	QyNdJKUcQ01nXocueRYfbT5hG3VvOL13NB2n8=
Received: by 10.152.104.206 with SMTP id gg14mr14116634lab.41.1322041268480;
	Wed, 23 Nov 2011 01:41:08 -0800 (PST)
Received: from localhost ([109.224.133.37]) by mx.google.com with ESMTPS id
	xx14sm15265436lab.17.2011.11.23.01.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 01:41:07 -0800 (PST)
Date: Wed, 23 Nov 2011 09:41:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Message-ID: <20111123094105.GA20243@stefanha-thinkpad.localdomain>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH 01/11] fix spelling in darwin-user sub
 directory
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
X-List-Received-Date: Wed, 23 Nov 2011 09:41:13 -0000

On Tue, Nov 22, 2011 at 06:06:16PM +0800, Dong Xu Wang wrote:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> 
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---
>  darwin-user/machload.c |    6 +++---
>  darwin-user/main.c     |    2 +-
>  darwin-user/syscall.c  |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

These fixes are mostly for comments, some user-visible strings.  I have
reviewed them and because they are really trivial am not waiting for all
CCed people to reply.

Thanks, applied all to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

