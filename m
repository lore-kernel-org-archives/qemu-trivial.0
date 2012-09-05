Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9C2J-0008Ia-EA
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:36:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9C2G-0008Am-Ey
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9C2A-0002ha-P6
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:36:36 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:62710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9C2A-0002hU-JG; Wed, 05 Sep 2012 05:36:30 -0400
Received: by wgbfm10 with SMTP id fm10so310808wgb.10
	for <multiple recipients>; Wed, 05 Sep 2012 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+z2A1W4WDw89FytTSz6HHuV0NukImeuqN0d1W42KPkw=;
	b=f3xOgeVeHBTKzdu0vltLbx1z+Z+NdF9Y7kgfblY5IFEOqSYM+gV0cmsN226ZYt5FwG
	56tigHDVkcgJUliyJmiYeQg7MkZCSXRpfYzOV7Lg3mgtFbUp5s9gbcJYW4KRqcWUnTt2
	gTeLFV556iGOfN3Bu878RZymjD9lXg9b6bLTRsOnfcwpMPHdjhfEDL93jc3QZiVjkXMw
	vXAfvUPsHXWlglnEOApriKNjAOvkpymDW1BskC7jcLRVHlYRbnesrL+A9GTjKyw40TJD
	5EubWMMRdcKJtsf0HXt2nHQM5cxWyQFUUF9OSawPU/uVak+vAOh9WRRtQQdoyj3OeCHk
	CsDA==
Received: by 10.216.255.148 with SMTP id j20mr4012269wes.106.1346837789721;
	Wed, 05 Sep 2012 02:36:29 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id el6sm28160919wib.8.2012.09.05.02.36.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:36:28 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:36:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120905093627.GC4786@stefanha-thinkpad.localdomain>
References: <1346704840-9522-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346704840-9522-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] kvm: Fix warning from
	static code analysis
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
X-List-Received-Date: Wed, 05 Sep 2012 09:36:38 -0000

On Mon, Sep 03, 2012 at 10:40:40PM +0200, Stefan Weil wrote:
> Report from smatch:
> 
> kvm-all.c:1373 kvm_init(135) warn:
>  variable dereferenced before check 's' (see line 1360)
> 
> 's' cannot by NULL (it was alloced using g_malloc0), so there is no need
> to check it here.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  kvm-all.c |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

