Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymi0k-0007cw-K4
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 08:19:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ymi0h-0007YH-Gs
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ymi0e-0000V2-C3
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:19:39 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:36688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Ymi0e-0000U6-6U; Mon, 27 Apr 2015 08:19:36 -0400
Received: by wizk4 with SMTP id k4so96984931wiz.1;
	Mon, 27 Apr 2015 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QQhIdGa1sUKpgnX7/4ixNEm8D1nsdCKGBNyftYE5rxo=;
	b=debEs5tlSl7tYHtPc3wnfx2c52eX/ybyALGtJKLFDk91Z5zEw95YNpZSoxAH7pWsUx
	UqsWyFlsjEYGglvplEUGXj4OJgL89bqCazD8aQXN3gt1pJz4C+FEm+Fi1I2J7ystoPpv
	n+JUy7U3Bury/w4H1vDz7v57XqLacc+cYcGT2UAMHKzxpNIv0kmZ6IjlbZw2C3SsWei1
	JsrqFi8mFn9/lU7/NU0FvXMgRKJ+VvAuvYP9aQ118xzRtar3FymAU8CQ6sGD4vC1DJzm
	YUnymOa0BcdECXUFowMpJ9AO3lDGHYMb0iLjdUFr4qrVBVYateOGV6y/XeBefow4OQvL
	z6Ag==
X-Received: by 10.194.121.68 with SMTP id li4mr22462090wjb.84.1430137175584;
	Mon, 27 Apr 2015 05:19:35 -0700 (PDT)
Received: from [192.168.10.165] (net-37-116-199-255.cust.vodafonedsl.it.
	[37.116.199.255]) by mx.google.com with ESMTPSA id
	fa8sm11397030wib.14.2015.04.27.05.19.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 05:19:34 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <553E2954.9070908@redhat.com>
Date: Mon, 27 Apr 2015 14:19:32 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1430135516-32438-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1430135516-32438-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Peter Wu <peter@lekensteyn.nl>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] block/dmg: make it modular
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
X-List-Received-Date: Mon, 27 Apr 2015 12:19:40 -0000

On 27/04/2015 13:51, Michael Tokarev wrote:
> dmg can optionally utilize libbz2, make it modular
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  block/Makefile.objs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/Makefile.objs b/block/Makefile.objs
> index db2933e..179e71d 100644
> --- a/block/Makefile.objs
> +++ b/block/Makefile.objs
> @@ -1,4 +1,4 @@
> -block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o dmg.o bochs.o vpc.o vvfat.o
> +block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o bochs.o vpc.o vvfat.o
>  block-obj-y += qcow2.o qcow2-refcount.o qcow2-cluster.o qcow2-snapshot.o qcow2-cache.o
>  block-obj-y += qed.o qed-gencb.o qed-l2-cache.o qed-table.o qed-cluster.o
>  block-obj-y += qed-check.o
> @@ -37,6 +37,7 @@ gluster.o-libs     := $(GLUSTERFS_LIBS)
>  ssh.o-cflags       := $(LIBSSH2_CFLAGS)
>  ssh.o-libs         := $(LIBSSH2_LIBS)
>  archipelago.o-libs := $(ARCHIPELAGO_LIBS)
> +block-obj-m        += dmg.o
>  dmg.o-libs         := $(BZIP2_LIBS)
>  qcow.o-libs        := -lz
>  linux-aio.o-libs   := -laio
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


