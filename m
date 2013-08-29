Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEy6I-0001nI-Vk
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2013 05:01:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VEy6B-0001fi-Lk
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 05:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VEy66-0000CU-8f
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 05:01:03 -0400
Received: from mail-ea0-x235.google.com ([2a00:1450:4013:c01::235]:48775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VEy5t-00009s-OJ; Thu, 29 Aug 2013 05:00:45 -0400
Received: by mail-ea0-f181.google.com with SMTP id d10so85698eaj.12
	for <multiple recipients>; Thu, 29 Aug 2013 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Cbqb/cRd3oMp4pCS8Po6PCelqdQqUqcXY9ryUdMk1YE=;
	b=Hc+YW6a7iwoprYCAQxjio9AP/+sqrExPRA7BnAGRbX+nfWKRABgT7iAckSNqf2rBJ7
	tJPv+aTTgR9AB8O9FuIYfruQCmNalpP60kI++PXvQsmsRSsvhbu+HgLzN9wz4PXaPCxQ
	iXvMZ4Bc/DjB0C+iBmlenNZ9uP9dL7TIKZIWdKMQF06UJtWJ7kpJ8btsnF6FOrqXf8W2
	sDwJvtaCeleVMLCDGo2DrkPz2VsaB8zqFeciXmAdjUpe8mbDv07ePEsSyfNzQMHpsHON
	lAMQxB/MhLYclAR634X34pFkll+69tgbOObwYjFwoOFqYkX3t/eFQt3MOu2PZ9rdHuBU
	zJ0A==
X-Received: by 10.14.111.9 with SMTP id v9mr3195813eeg.35.1377766844704;
	Thu, 29 Aug 2013 02:00:44 -0700 (PDT)
Received: from yakj.usersys.redhat.com (nat-pool-mxp-t.redhat.com.
	[209.132.186.18])
	by mx.google.com with ESMTPSA id i1sm44240370eeg.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 02:00:43 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <521F0DB6.9090203@redhat.com>
Date: Thu, 29 Aug 2013 11:00:38 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::235
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <stefano.stabellini@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>, Xen Devel <xen-devel@lists.xen.org>
Subject: Re: [Qemu-trivial] [PATCH for v1.6] pc: Fix initialization of the
	ram_memory variable.
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
X-List-Received-Date: Thu, 29 Aug 2013 09:01:09 -0000

Il 16/08/2013 16:46, Anthony PERARD ha scritto:
> In some cases (Xen), it will not be initialized before to be used. This
> leads to segv.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ---
> 
> It works with this simple initialization to NULL, but would it be
> necessary (or better) to assign a proper value to this variables ?

Yeah, the right value of this variable comes from xen_ram_init (called
by xen_hvm_init).

Paolo

> ---
>  hw/i386/pc_piix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6e1e654..596d433 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -86,7 +86,7 @@ static void pc_init1(MemoryRegion *system_memory,
>      BusState *idebus[MAX_IDE_BUS];
>      ISADevice *rtc_state;
>      ISADevice *floppy;
> -    MemoryRegion *ram_memory;
> +    MemoryRegion *ram_memory = NULL;
>      MemoryRegion *pci_memory;
>      MemoryRegion *rom_memory;
>      DeviceState *icc_bridge;
> 


