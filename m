Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ3cR-0003Yc-88
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 09:34:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ3cL-0003HF-LM
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 09:34:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ3cH-0006h3-B9
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 09:34:05 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:46440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJ3cB-0006bL-Ot; Wed, 26 Oct 2011 09:33:55 -0400
Received: by wyh15 with SMTP id 15so1835753wyh.4
	for <multiple recipients>; Wed, 26 Oct 2011 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s8NinRbY9bsY2QRNTSTgmKBXIi/tReBVjSPr/+WNYnE=;
	b=tStWONBDQNxYGT86WTGaTDsLZFgLCJUQroAkbeO7r56TYoj1rhwzCpoLQsbaciv79d
	hto5hIktf2DlOMwHoeoo1YAxnon2ZenK3/lCVH4N8qfHdMrV4jSnO4UDdU5HmByqYmmF
	yn50iPi+w0qAZFG9vclTh1+IF+PnVDImaRui0=
Received: by 10.227.59.204 with SMTP id m12mr10984028wbh.14.1319636034193;
	Wed, 26 Oct 2011 06:33:54 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id gg13sm3216454wbb.8.2011.10.26.06.33.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 06:33:53 -0700 (PDT)
Date: Wed, 26 Oct 2011 14:33:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20111026133351.GA28951@stefanha-thinkpad.localdomain>
References: <1319627174-8015-1-git-send-email-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319627174-8015-1-git-send-email-jcmvbkbc@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ahci: fix DPRINTF format strings
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
X-List-Received-Date: Wed, 26 Oct 2011 13:34:08 -0000

On Wed, Oct 26, 2011 at 03:06:14PM +0400, Max Filippov wrote:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  hw/ide/ahci.c |   16 ++++++++++------
>  1 files changed, 10 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

