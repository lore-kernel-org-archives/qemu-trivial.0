Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwIGa-0006jm-9C
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 22:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwIGY-0006iR-1k
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:09:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwIGW-0006Br-OZ
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:09:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gwIGE-00064X-Ol; Tue, 19 Feb 2019 22:09:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27F9B3E2D2;
	Wed, 20 Feb 2019 03:09:21 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D4317C78;
	Wed, 20 Feb 2019 03:09:20 +0000 (UTC)
To: Like Xu <like.xu@linux.intel.com>, qemu-trivial@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <1550652953-24393-1-git-send-email-like.xu@linux.intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <27254af5-b490-165f-8ca3-f60ab7642d72@redhat.com>
Date: Tue, 19 Feb 2019 21:09:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1550652953-24393-1-git-send-email-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 20 Feb 2019 03:09:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc: update .gitignore and
 fix typos for docs in tree
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
X-List-Received-Date: Wed, 20 Feb 2019 03:09:47 -0000

On 2/20/19 2:55 AM, Like Xu wrote:
> Signed-off-by: Like Xu <like.xu@linux.intel.com>

This feels like two independent patches - the .gitignore change is
different from typo fixes.

Actually, for .gitignore, you could just as easily do:

echo '*.patch' >> .git/info/exclude

and fix it so you never commit patch files locally, while still leaving
them visible through 'git status' to other users.  I actually like
knowing when I have stale patch files lying around, so that I can 'rm'
them before creating my next patch batch and using 'git send-email
*.patch' - but of course, I could just as easily add '!*.patch' to my
.git/info/exclude to override the project default if we decide to go
with your patch.


> +++ b/docs/colo-proxy.txt
> @@ -41,7 +41,7 @@ Below is a COLO proxy ascii figure:
>  |         |  +------------------------------------------------------+  |                        |        |                              |
>  |netfilter|  |                       |                         |    |  |   netfilter            |        |                              |
>  | +----------+ +----------------------------+                  |    |  |  +-----------------------------------------------------------+ |
> -| |       |  |                       |      |        out       |    |  |  |                     |        |  filter excute order       | |
> +| |       |  |                       |      |        out       |    |  |  |                     |        |  filter execute order       | |

You fixed the typo, but broke the whitespacing on this lineart. (twice)


> +++ b/docs/qemu-block-drivers.texi
> @@ -632,7 +632,7 @@ qemu-system-i386 -drive file=iscsi://127.0.0.1/iqn.qemu.test/1 \
>  @end example
>  
>  
> -Howto set up a simple iSCSI target on loopback and accessing it via QEMU:
> +How to set up a simple iSCSI target on loopback and accessing it via QEMU:

While here, I would also: s/accessing/access/

> +++ b/docs/usb-storage.txt
> @@ -16,7 +16,7 @@ too):
>  
>  
>  Number two is the newer usb attached scsi transport.  This one doesn't
> -automagically create a scsi disk, so you have to explicitly attach one
> +automatically create a scsi disk, so you have to explicitly attach one

This one may be intentional, as a play on English words. But changing it
may sound a bit more professional.

All your other typo fixes are good.  Looking forward to v2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

