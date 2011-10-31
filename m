Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKqPt-0008OY-4u
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 07:52:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqPq-0008Dv-5H
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqPo-0006DF-04
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:52:34 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:43598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RKqPl-0006CM-Gt; Mon, 31 Oct 2011 07:52:29 -0400
Received: by faap15 with SMTP id p15so6465804faa.4
	for <multiple recipients>; Mon, 31 Oct 2011 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UQLMlMjiq7UluAJpbqnhj+2wg3H4FsN6eqnU8cOx4Qg=;
	b=UdWxI3mUVIFDBezgcTmPLbN97q/Zph+eTH5yDOciu194OEIGXowW8TPwRRyxgbEXzS
	2wpJtlQ35LNOakwCOiSgq6Xp7LpEG3jfghP2HzdnnQPyNilNDLk1L0h6RH5XykI3opIr
	8FZ/V9AJcrVLfNYgMvFzzY0FGnkAlWnzUZYXU=
Received: by 10.223.5.82 with SMTP id 18mr10606090fau.27.1320061948633;
	Mon, 31 Oct 2011 04:52:28 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	d21sm34638898fac.4.2011.10.31.04.52.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 04:52:28 -0700 (PDT)
Date: Mon, 31 Oct 2011 11:52:26 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111031115226.GA10693@stefanha-thinkpad.localdomain>
References: <1319791946-15602-1-git-send-email-armbru@redhat.com>
	<1319791946-15602-2-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319791946-15602-2-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, jvrao@linux.vnet.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] sysbus: Supply missing
	va_end()
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
X-List-Received-Date: Mon, 31 Oct 2011 11:52:35 -0000

On Fri, Oct 28, 2011 at 10:52:25AM +0200, Markus Armbruster wrote:
> C99 7.15.1: Each invocation of the va_start and va_copy macros shall
> be matched by a corresponding invocation of the va_end macro in the
> same function.
> 
> Spotted by Coverity.  Harmless on the (common) systems where va_end()
> does nothing.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/sysbus.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

