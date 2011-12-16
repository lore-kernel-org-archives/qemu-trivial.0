Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbUUb-00086V-Ls
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2011 04:54:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbUUT-0007fM-Rf
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 04:54:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbUUP-0006VW-NG
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 04:54:09 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:39916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RbUUD-0006QX-TV; Fri, 16 Dec 2011 04:53:54 -0500
Received: by eekb45 with SMTP id b45so3354505eek.4
	for <multiple recipients>; Fri, 16 Dec 2011 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9Brb+b+9LYu8rpT5oSlbDIA7LrAcXusYSU1J+hxZorM=;
	b=mFl4MU8k6YVkhaH6wAoc2jArm3LxjN9WScvaITsn+MpDMkoGupXLz7P1KqFJxGFOYL
	jjhVjdNrQ84J5+x1RHXpdtZpCe30vx5J0oDSzCv+8sRxA/RpjrVbnBgIN+5+PVaRX5fz
	kZxmlZqsmhjLZNCcgcgG9Jxh+SZIJozOm7NZc=
Received: by 10.14.16.77 with SMTP id g53mr393126eeg.19.1324029232844;
	Fri, 16 Dec 2011 01:53:52 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	z54sm35995860eeh.5.2011.12.16.01.53.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 01:53:52 -0800 (PST)
Date: Fri, 16 Dec 2011 09:53:49 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20111216095349.GA26889@stefanha-thinkpad.localdomain>
References: <1323958276-29225-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323958276-29225-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ide: drop argument to dma_buf_commit
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
X-List-Received-Date: Fri, 16 Dec 2011 09:54:15 -0000

On Thu, Dec 15, 2011 at 03:11:16PM +0100, Paolo Bonzini wrote:
> The argument is unused and even wrong when the function is called
> by ide_handle_rw_error.  Drop it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/ide/core.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

