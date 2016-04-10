Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1apAkl-00024E-5F
	for mharc-qemu-trivial@gnu.org; Sun, 10 Apr 2016 04:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1apAkf-0001sD-GX
	for qemu-trivial@nongnu.org; Sun, 10 Apr 2016 04:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1apAke-0002zk-QK
	for qemu-trivial@nongnu.org; Sun, 10 Apr 2016 04:29:49 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1apAke-0002za-KV; Sun, 10 Apr 2016 04:29:48 -0400
Received: by mail-wm0-x242.google.com with SMTP id y144so14275644wmd.0;
	Sun, 10 Apr 2016 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mK4rsvixeZZvXlM4vNy3RQGbaIXo2mtC2DNRBAfwQEs=;
	b=bAbEsA8ZmwzlxqFktkk27kJgwX0uoI1/5/LANtsNzC07AQ5Ie68BC1PHa6iyw+2kXd
	suzdD7GVxIbXZeXNRAVU8cprEhfPh6lf89frpBe20g/LBTXWQRJswmuGw5OrXJQlXJOs
	dGWIUpwaXwmBRpRK/lNtAsu9RNEPD0f59za9onE+caL+UNEDTdhYSwTTcaUMfb8wev/f
	ttBY3Xe8w6PvY5yaNn8rVfmTTxb+CnhGYxhOsH1mUFKqW0bzsSIQBVj3XNxkdIdNbHLt
	gdweOIU/941fFbCJzuZF4Imts5Uwg8yEQg496O1HOHoZ5vPMRM+1xZmCiFS8dMtXvn2S
	AreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=mK4rsvixeZZvXlM4vNy3RQGbaIXo2mtC2DNRBAfwQEs=;
	b=UfcRMPKSPbUKKSeP1f8pu/KGGt0dRwZsNwgIEsC3JP9CIgNPNLkqb20kid2yUzf+9a
	f9CoNm2YM+6SaTmd8gzmPkOqcJJihlfuXuA5MJD1zr1y5oscevsvJj+vTWADoz4CgX+3
	yghuBCpg9us6VYJjgytBZFQcMAchnwI6ZWXqrGQSBEebam/rfJYRHUerKVeEYNIQ72pS
	DM1qaMp5SPC7oLe4VXWdagYWFcRaBBlpfjVh0KLgmIpt49lnLcrQSMyoxOG85FdiNQqq
	e/JOKLY/938GO6ksjJoI4YyG7KQ6xde+gjyaLjodopsrW5netjMTfzki3HZssDuNwHcZ
	kL6A==
X-Gm-Message-State: AD7BkJJlUnsvXeEjuSqGcZlxX9jgVdWOHHNKqUxLUstxkvw4fONPIJWaDuNg7fdT6Z7qBg==
X-Received: by 10.28.139.129 with SMTP id n123mr12122389wmd.13.1460276988028; 
	Sun, 10 Apr 2016 01:29:48 -0700 (PDT)
Received: from [192.168.1.32] ([149.88.139.84])
	by smtp.googlemail.com with ESMTPSA id
	t4sm11283547wmf.8.2016.04.10.01.29.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2016 01:29:47 -0700 (PDT)
Reply-To: marcel@redhat.com
References: <1459150365-26233-1-git-send-email-marcel@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <570A0EF6.3010307@gmail.com>
Date: Sun, 10 Apr 2016 11:29:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1459150365-26233-1-git-send-email-marcel@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: fix identation
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
X-List-Received-Date: Sun, 10 Apr 2016 08:29:52 -0000

On 03/28/2016 10:32 AM, Marcel Apfelbaum wrote:
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>

Ping.

Thanks,
Marcel

> ---
>   hw/pci/pci.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a1d41aa..da8b0b6 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -165,15 +165,15 @@ static inline int pci_irq_state(PCIDevice *d, int irq_num)
>   {
>       assert(irq_num >= 0);
>
> -	return (d->irq_state >> irq_num) & 0x1;
> +    return (d->irq_state >> irq_num) & 0x1;
>   }
>
>   static inline void pci_set_irq_state(PCIDevice *d, int irq_num, int level)
>   {
>       assert(irq_num >= 0);
>
> -	d->irq_state &= ~(0x1 << irq_num);
> -	d->irq_state |= level << irq_num;
> +    d->irq_state &= ~(0x1 << irq_num);
> +    d->irq_state |= level << irq_num;
>   }
>
>   static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
>


