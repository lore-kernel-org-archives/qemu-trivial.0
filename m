Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnAgY-0002yP-Mz
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 16:33:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1bnAgT-0002um-Ca
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 16:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1bnAgR-0004pS-8r
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 16:33:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1bnAgL-0004fw-1F; Thu, 22 Sep 2016 16:33:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 692ACE9515;
	Thu, 22 Sep 2016 20:33:19 +0000 (UTC)
Received: from localhost (ovpn-116-158.phx2.redhat.com [10.3.116.158])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8MKXIoS010188; Thu, 22 Sep 2016 16:33:18 -0400
Date: Thu, 22 Sep 2016 16:33:18 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160922163318.75d3d54d@redhat.com>
In-Reply-To: <1474572758-763-1-git-send-email-thuth@redhat.com>
References: <1474572758-763-1-git-send-email-thuth@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Sep 2016 20:33:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more files to the
 HMP section
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2016 20:33:31 -0000

On Thu, 22 Sep 2016 21:32:38 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The hmp-commands-info.hx, hmp.h and include/monitor/hmp-target.h
> files were classified as unmaintained. Let's add them to the
> HMP section.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

I probably should downgrade the status of HMP to "Odd Fixes",
as I've not been dedicating any time for it. If anyone is
interested in taking up it let me know.

> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9da3d09..3879e1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1160,8 +1160,9 @@ Human Monitor (HMP)
>  M: Luiz Capitulino <lcapitulino@redhat.com>
>  S: Maintained
>  F: monitor.c
> -F: hmp.c
> -F: hmp-commands.hx
> +F: hmp.[ch]
> +F: hmp-commands*.hx
> +F: include/monitor/hmp-target.h
>  T: git git://repo.or.cz/qemu/qmp-unstable.git queue/qmp
>  
>  Network device backends


