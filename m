Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVL2V-0007g8-Lz
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 05:35:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVL2O-0007fZ-67
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 05:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVL2M-0003sv-L8
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 05:35:44 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:38469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RVL2M-0003sS-Aj; Tue, 29 Nov 2011 05:35:42 -0500
Received: by eaai10 with SMTP id i10so3126982eaa.4
	for <multiple recipients>; Tue, 29 Nov 2011 02:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hMFf4Zd7CBqslcGsjKVeMjN4i3ALcjPqrlWJmI1MzuU=;
	b=Ou8BKeuEjRg8Z4SsexYlkKY0agSuF1B/P6BcMTKz7QnNQdRNIMMOi9SGkz69wxBDyN
	GlzkWZwyhSESh3DBhzWYjyJkpdEeELq1rFOmqSTn3ALtGomwCA4PRSWG1TtwD5OdSsj/
	iGE8sIlnPpySuPIKSi0nr8615tiqfgkUzJrj8=
Received: by 10.213.29.7 with SMTP id o7mr1640393ebc.102.1322562867099;
	Tue, 29 Nov 2011 02:34:27 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	q28sm103862196eea.6.2011.11.29.02.34.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 02:34:26 -0800 (PST)
Date: Tue, 29 Nov 2011 10:34:25 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Message-ID: <20111129103425.GA17752@stefanha-thinkpad.localdomain>
References: <1322556759-19389-1-git-send-email-wdongxu@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322556759-19389-1-git-send-email-wdongxu@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2 v2] fix typo: delete
	redundant semicolon
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
X-List-Received-Date: Tue, 29 Nov 2011 10:35:49 -0000

On Tue, Nov 29, 2011 at 04:52:38PM +0800, Dong Xu Wang wrote:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> 
> Double semicolons should be single.
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---
>  block/nbd.c                |    4 ++--
>  cpus.c                     |    2 +-
>  hw/9pfs/codir.c            |    6 +++---
>  hw/9pfs/virtio-9p-handle.c |    2 +-
>  hw/9pfs/virtio-9p.c        |    4 ++--
>  hw/acpi.c                  |    2 +-
>  hw/eepro100.c              |    2 +-
>  hw/ide/via.c               |    2 +-
>  hw/ppc.c                   |    2 +-
>  hw/smc91c111.c             |    2 +-
>  linux-user/syscall.c       |    2 +-
>  net/tap-solaris.c          |    2 +-
>  target-s390x/op_helper.c   |    4 ++--
>  ui/vnc.c                   |    2 +-
>  usb-redir.c                |    4 ++--
>  15 files changed, 21 insertions(+), 21 deletions(-)

Thanks, applied both to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

BTW there was a typo in your commit message in Patch 2/2.  I fixed it ;-).

Stefan

