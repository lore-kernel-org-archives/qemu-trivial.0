Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VE1TR-0008JP-1o
	for mharc-qemu-trivial@gnu.org; Mon, 26 Aug 2013 14:25:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VDyHx-0005zy-4e
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 11:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VDyHp-0001zQ-Uq
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 11:01:05 -0400
Received: from mail-ea0-f175.google.com ([209.85.215.175]:64105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabio.fantoni@m2r.biz>) id 1VDyHp-0001zA-OP
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 11:00:57 -0400
Received: by mail-ea0-f175.google.com with SMTP id m14so1648895eaj.20
	for <qemu-trivial@nongnu.org>; Mon, 26 Aug 2013 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gE4I9tbpcKVOBqm+6Jea8LBqeLGJjWiJDHy/JM0uSPA=;
	b=HxaP7tCLHM1CUo/eXMqILg5nRt370ClIdm2Y9tb4DW8USBhd5Q9/D/l2pEy8KwSWrO
	AbKJzC3Eg+j638dZTtWKiMLLQc59q1tV+2DnDWz462monro7tMRy7nxajckMK6apG5qu
	kIboseksOdlXucfUuCi91a8AqAKmIuFp7qqTDTUqzhHcgG50jlHEAAk0KxsuGvBaYP/t
	kPtBv2hl7rKiWDKkeVKpZ55qoEcAQXxHNBzhGwjQl7gTW5rAg+p/tKBGnaF4RqUluVhB
	CiNnSUjDYQY4ZepKB0rTjk44WjaBD2iLYzw/1zdDLRlxf+RO/5sXuE4OFfGr2dJ7B/Dl
	dwVw==
X-Gm-Message-State: ALoCoQkhIV3fdAPDr6uZxmkZuOTSDoDXMqaBgghaqSKjQddRjQHVrZafQfVCmajWxqdYPnJQkMjA
X-Received: by 10.14.2.199 with SMTP id 47mr4122945eef.57.1377529256536;
	Mon, 26 Aug 2013 08:00:56 -0700 (PDT)
Received: from [192.168.1.26] (ip-73-126.sn2.eutelia.it. [83.211.73.126])
	by mx.google.com with ESMTPSA id b45sm22016510eef.4.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 08:00:55 -0700 (PDT)
Message-ID: <521B6DA5.1010801@m2r.biz>
Date: Mon, 26 Aug 2013 17:00:53 +0200
From: Fabio Fantoni <fabio.fantoni@m2r.biz>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.175
X-Mailman-Approved-At: Mon, 26 Aug 2013 14:25:08 -0400
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <stefano.stabellini@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>, Xen Devel <xen-devel@lists.xen.org>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH for v1.6] pc: Fix
 initialization of the ram_memory variable.
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
X-List-Received-Date: Mon, 26 Aug 2013 15:01:10 -0000

Il 16/08/2013 16:46, Anthony PERARD ha scritto:
> In some cases (Xen), it will not be initialized before to be used. This
> leads to segv.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Tested-by: Fabio Fantoni <fabio.fantoni@m2r.biz>
This patch have solved the critical regression of all hvm domUs that 
prevented domUs starting with qemu 1.6.

>
> ---
>
> It works with this simple initialization to NULL, but would it be
> necessary (or better) to assign a proper value to this variables ?
> ---
>   hw/i386/pc_piix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6e1e654..596d433 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -86,7 +86,7 @@ static void pc_init1(MemoryRegion *system_memory,
>       BusState *idebus[MAX_IDE_BUS];
>       ISADevice *rtc_state;
>       ISADevice *floppy;
> -    MemoryRegion *ram_memory;
> +    MemoryRegion *ram_memory = NULL;
>       MemoryRegion *pci_memory;
>       MemoryRegion *rom_memory;
>       DeviceState *icc_bridge;


