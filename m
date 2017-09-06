Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpXQW-0007fi-Da
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 06:19:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dpXQU-0007eX-8E
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 06:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dpXQT-0004Eq-Db
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 06:19:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dpXQN-0004BK-7q; Wed, 06 Sep 2017 06:19:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 147B05F7AC;
	Wed,  6 Sep 2017 10:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 147B05F7AC
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from dhcp-200-186.str.redhat.com (dhcp-200-186.str.redhat.com
	[10.33.200.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D4B6B56F;
	Wed,  6 Sep 2017 10:19:06 +0000 (UTC)
Date: Wed, 6 Sep 2017 12:19:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, famz@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru
Message-ID: <20170906101905.GD3753@dhcp-200-186.str.redhat.com>
References: <20170906085006.26983-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170906085006.26983-1-rjones@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Sep 2017 10:19:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.10] qemu-options: Document the
 -drive locking parameter.
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
X-List-Received-Date: Wed, 06 Sep 2017 10:19:19 -0000

Am 06.09.2017 um 10:50 hat Richard W.M. Jones geschrieben:
> Commit 16b48d5d66d2 ("file-posix: Add 'locking' option") added this
> option, but as it was not documented in the -help output it was not
> easily possible to tell if a particular qemu binary supports it.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9f6e2adfff..f8f95eb498 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -796,7 +796,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>      "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
>      "       [,serial=s][,addr=A][,rerror=ignore|stop|report]\n"
>      "       [,werror=ignore|stop|report|enospc][,id=name][,aio=threads|native]\n"
> -    "       [,readonly=on|off][,copy-on-read=on|off]\n"
> +    "       [,readonly=on|off][,copy-on-read=on|off][,locking=off|auto|on]\n"
>      "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
>      "       [[,bps=b]|[[,bps_rd=r][,bps_wr=w]]]\n"
>      "       [[,iops=i]|[[,iops_rd=r][,iops_wr=w]]]\n"

'locking' is a driver-specific option and not universally available for
all images, so it shouldn't be included here.

Of course, you're right that driver-specific options should be
documented somewhere, and currently that's only in the QAPI schema for
blockdev-add, which isn't quite satisfying. Maybe adding them to the
'qemu-block-drivers' man page could work (which currently only contains
'qemu-img create' options).

Kevin

