Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1go793-0004uE-Uj
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 08:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go792-0004tn-Sc
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:40:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go791-0007hg-0S
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:40:12 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1go790-0007bU-Pp
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 08:40:10 -0500
Received: by mail-wr1-f68.google.com with SMTP id x10so18058639wrs.8
	for <qemu-trivial@nongnu.org>; Mon, 28 Jan 2019 05:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MrpcMQ4hG6IXYFPbgwa1RHmhth5A0sxePNwj+fkLnkk=;
	b=m2iw0rOsIiUKPSMIXfZYrGQko9D/XR+WIAmc5OgQjnX9nA7htKyrVrQtlFDt2ZSPsq
	dyybwdVxtGzUsASIkf1nf/88PuUhdcxXh7qB19KnBI4aB+Tkho2TEOS09BcHznMbfrJi
	UkwrKvwu96GASi6xbG5Cb2DKAn4F5OKaPeosJpMh3SCooWTH/tTWywJoi6fKkiZgH+Yt
	W5AEgoJHLDIn9VK1toZhkLVFI9z2flqs48hOcD70Vt2r/mNb7jIIptRokWeUdITkT8Lg
	5yBq9TwkoHuOWXD5NqIy0qb16q2KB4RnWuN4fl37IYwUsmoKJhq+kbfFve5cWbNlnO4Y
	FQEg==
X-Gm-Message-State: AJcUukcrUIw+QNsuuLF65/KkYxJuiOJtHshbBFP0on4GB2xpw0Lb69ar
	VYkrdHcXjpqW/GSDfkpTr6qKWpCJbXo=
X-Google-Smtp-Source: ALg8bN5P3vWLAST1hi+TvmRwLLIki5x3KUH/MOjeZOj4nOk0v2PJiHuimST6vGyjWODz84rL70FUkw==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr22544775wrn.171.1548682806940;
	Mon, 28 Jan 2019 05:40:06 -0800 (PST)
Received: from [192.168.1.40] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	124sm76975789wmh.22.2019.01.28.05.40.06
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 05:40:06 -0800 (PST)
To: Paul Durrant <paul.durrant@citrix.com>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190122145132.12571-1-paul.durrant@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <57cd3429-41a3-48c5-4d06-5d203cf70f97@redhat.com>
Date: Mon, 28 Jan 2019 14:40:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122145132.12571-1-paul.durrant@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/block: clean up stake
 xen_disk trace entries
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
X-List-Received-Date: Mon, 28 Jan 2019 13:40:13 -0000

Cc'ing QEMU Trivial.

On 1/22/19 3:51 PM, Paul Durrant wrote:
> This should have been removed then xen_disk.c was removed but I missed them.

... when xen_disk.c was removed (19f87870baa) ...

> 
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> ---
>  hw/block/trace-events | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 55e5a5500c..d0851953c5 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -121,13 +121,6 @@ nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion queue
>  nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
>  nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
>  
> -# hw/block/xen_disk.c
> -xen_disk_alloc(char *name) "%s"
> -xen_disk_init(char *name) "%s"
> -xen_disk_connect(char *name) "%s"
> -xen_disk_disconnect(char *name) "%s"
> -xen_disk_free(char *name) "%s"
> -
>  # hw/block/xen-block.c
>  xen_block_realize(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
>  xen_block_connect(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
> 

