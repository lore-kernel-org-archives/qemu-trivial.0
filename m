Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wnklf-00075g-2Y
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 04:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WnklY-0006x6-Cy
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 04:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WnklS-0001LH-D6
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 04:23:48 -0400
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231]:38602)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WnklG-0001IE-8r; Fri, 23 May 2014 04:23:30 -0400
Received: by mail-ee0-f49.google.com with SMTP id e53so3276246eek.8
	for <multiple recipients>; Fri, 23 May 2014 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ak/6dKVWgiBi+eiz6EFU6xVZYu8ihthRnfXcMqK/Bhs=;
	b=IyuWfq+d700w7v2sil4UIr/oAYC3eorHgL3s35FKzvtxAAXjTDcaBNmgGqWfI5o7v8
	g5a3+0k1uGVWqTx9qMbH2pkv4i7MvQR869UJW4edPwPqEwFL2rbl7x0dWw04P+C3aQ8n
	5RFEhdjlNqHs1HTm6dESHi7qKDP9hVyVuRLEfC9CIydIwORsJp8jlIU2fWWY3XhYf+uO
	p10rRjURGu0pFh1Axk543ueHfZq+0WDl0uh8tGghpLgHXVIVn4rc7pzIeSClhTFKZhwj
	W8xS6HojldFK+fWhTOL/9+XxMAA8GIoSm4DKLnpBLs3/Nno/i0ztZt3RfHIwrQ73CAEU
	nXog==
X-Received: by 10.14.225.194 with SMTP id z42mr1075471eep.106.1400833409057;
	Fri, 23 May 2014 01:23:29 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-146-75.cust.vodafonedsl.it.
	[37.117.146.75])
	by mx.google.com with ESMTPSA id l41sm1305105eew.8.2014.05.23.01.23.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 May 2014 01:23:28 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <537F057D.1070503@redhat.com>
Date: Fri, 23 May 2014 10:23:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jules Wang <junqing.wang@cs2c.com.cn>, qemu-devel@nongnu.org
References: <1400816645-16005-1-git-send-email-junqing.wang@cs2c.com.cn>
In-Reply-To: <1400816645-16005-1-git-send-email-junqing.wang@cs2c.com.cn>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] dma-helpers: avoid calling
	dma_bdrv_unmap() twice
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
X-List-Received-Date: Fri, 23 May 2014 08:23:54 -0000

Il 23/05/2014 05:44, Jules Wang ha scritto:
> Calling dma_bdrv_unmap() twice is not necessary and may cause
> potential problems if some code changes.
>
> Signed-off-by: Jules Wang <junqing.wang@cs2c.com.cn>
> ---
>  dma-helpers.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/dma-helpers.c b/dma-helpers.c
> index 5f421e9..53cbe92 100644
> --- a/dma-helpers.c
> +++ b/dma-helpers.c
> @@ -143,12 +143,12 @@ static void dma_bdrv_cb(void *opaque, int ret)
>
>      dbs->acb = NULL;
>      dbs->sector_num += dbs->iov.size / 512;
> -    dma_bdrv_unmap(dbs);
>
>      if (dbs->sg_cur_index == dbs->sg->nsg || ret < 0) {
>          dma_complete(dbs, ret);
>          return;
>      }
> +    dma_bdrv_unmap(dbs);
>
>      while (dbs->sg_cur_index < dbs->sg->nsg) {
>          cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

