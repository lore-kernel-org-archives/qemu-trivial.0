Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGwKK-0007tB-Ah
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2011 13:22:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwKI-0007oj-5i
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwKH-0000JV-1v
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:22:42 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:44497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RGwKD-0000J5-RV; Thu, 20 Oct 2011 13:22:37 -0400
Received: by qyk10 with SMTP id 10so5899233qyk.4
	for <multiple recipients>; Thu, 20 Oct 2011 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mxjfSr5BzcB4TUlDohrALR1xobBGW7lo8Ax1hw+I/C0=;
	b=W7oSFeoBZ7kNK/HvwgihiXsu52HtFsmCe2c5JUsTep+WXai1kdds7+FDihFTiDVjUE
	EcsKv+Nv0mYW/fPtgVbSAEbFuCWCLD1+kWOsEA1RSFcZedRPRnfOGj/srUZxTYxCosy/
	7dmuMv6vfsZJQRL7+OFiMsPIDxMICT3uKzxOY=
Received: by 10.68.59.10 with SMTP id v10mr21958293pbq.16.1319131356966;
	Thu, 20 Oct 2011 10:22:36 -0700 (PDT)
Received: from localhost ([71.198.47.196])
	by mx.google.com with ESMTPS id ko15sm20843732pbb.9.2011.10.20.10.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 10:22:35 -0700 (PDT)
Date: Thu, 20 Oct 2011 10:22:35 -0700
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
Message-ID: <20111020172235.GA14253@stefanha-thinkpad.localdomain>
References: <1318958343-14167-1-git-send-email-pavel.borzenkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318958343-14167-1-git-send-email-pavel.borzenkov@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmdk: vmdk_read_cid returns garbage if
 p_name is NULL
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
X-List-Received-Date: Thu, 20 Oct 2011 17:22:43 -0000

On Tue, Oct 18, 2011 at 09:19:03PM +0400, Pavel Borzenkov wrote:
> Spotted by Clang Analyzer
> 
> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
>  block/vmdk.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

