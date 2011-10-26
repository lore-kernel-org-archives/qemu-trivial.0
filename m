Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ2wM-0000mU-Hb
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 08:50:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ2wF-0000P7-Al
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ2wE-00058L-0g
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:50:35 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:49968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJ2w2-00056T-BL; Wed, 26 Oct 2011 08:50:22 -0400
Received: by wwi36 with SMTP id 36so2157336wwi.10
	for <multiple recipients>; Wed, 26 Oct 2011 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=it832RWc3bb86igx9v/sHdd9N7nob3PBxeYZ57KfaBM=;
	b=OHhWDwm850DwmNiy04evn7qhV4h5s5x2oOAbL34J8Q3I7pbpKxGbrFmgF79XWqgAOX
	psL5h8NuNV3Tah2NTrzkplb+ru+u71txKVp3zoyN4qbyIXfwwM0mM69f8+HZijueCg5N
	I/nC3PiPA/oFjIy9LIr2LKQXtbfk0mJuj+VfI=
Received: by 10.227.204.141 with SMTP id fm13mr9800830wbb.12.1319633420895;
	Wed, 26 Oct 2011 05:50:20 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l20sm3000973wbo.6.2011.10.26.05.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 05:50:19 -0700 (PDT)
Date: Wed, 26 Oct 2011 13:50:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20111026125018.GB27267@stefanha-thinkpad.localdomain>
References: <1319455981-27042-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319455981-27042-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tools: reorganize Makefile variables
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
X-List-Received-Date: Wed, 26 Oct 2011 12:50:41 -0000

On Mon, Oct 24, 2011 at 01:33:01PM +0200, Paolo Bonzini wrote:
> - Add all dependencies of the block layer to block-obj-y, and all
>   dependencies of QObject to qobject-obj-y
> 
> - Remove the block layer from tools-obj-y, add it to qemu-img, qemu-nbd,
>   qemu-io
> 
> - Add qobject-obj-y and tools-obj-y wherever useful, remove duplicates
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile      |   32 +++++++++++++++-----------------
>  Makefile.objs |    8 ++++----
>  2 files changed, 19 insertions(+), 21 deletions(-)

This patch is a bit large for trivial but the changes seem fine.  It
could have been split into 3 small patches.

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

