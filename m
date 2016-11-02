Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1rFP-0006FG-I9
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 04:50:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c1rFM-0006Dv-OT
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c1rFI-00005l-TE
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:50:12 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1c1rFI-00004v-MQ; Wed, 02 Nov 2016 04:50:08 -0400
Received: by mail-wm0-x242.google.com with SMTP id c17so1827099wmc.3;
	Wed, 02 Nov 2016 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xpGUDniD8Ev8OIlcIF4i85R2e8YVz6c2u9Ts4mUCsPs=;
	b=IJ7Iddt+m6YHbPNCzmLjK0edGwdZUqAZzhd/nn70sadbx9IP9PAoVojfCd8P4v8STl
	DJVK3htivHhCHH0fnPvkfPG7hwtmNxIFzdVn/UlMNFRh+Cs3GKj/f0hPXMQHB+kfQiku
	DhLmqTe1Zn/mgv7s0tevvM6IhkOI+h7J7siwMvOCfExQ/l7SSfdTrqCxqyuL92lGmr58
	hjpQu7dT//lmnFm536/iCxuBjsGFKWHiUcKeFn4+9jRaA3wE/W8jKxKHllSPT4PWo4M8
	oPFaEl8RFCNUyhM3I0qYjGvw3xwYkKruhsThAuP6fQI8G9tT3UFH22W91D1NgBmASag2
	KVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xpGUDniD8Ev8OIlcIF4i85R2e8YVz6c2u9Ts4mUCsPs=;
	b=C92x1922jj3UCGGCXBs0CchHFs7PpYXIBZo1WIshzdBZPn7jK/uIjW/Rvlja3feu6B
	X3k/L4uTTXaX8HyvUXN2cnp6C7R9furb/9gAFPsDL+CF2EfxzFODQnLyL6cSvW+3TKNJ
	07D1NRKSZb79JJNz6dgBfX2ShFAkiK7/HrlUcxmCSpmxP43XUFOnCSNJgFJ00zqT5x+G
	0QwXaVea/hkdLagF1bU17esoMhRagEIhs2WlfJJGQtA3sZ+9+aEr5QsSFiXOIz/Mu7td
	szGG7OMDfJNBT5PWbusIaBj6zbDu3DyxPpHAFRbt6m2eh7afJg+sZjV6PumELPfWgFIi
	2eCA==
X-Gm-Message-State: ABUngvdZRTw0+8H+3DCqdcHS+JlY974ZK3FCFVN3Y1ns0SJzK3IAfK/WmmCc9UEe5EWsvQ==
X-Received: by 10.194.240.201 with SMTP id wc9mr2306814wjc.67.1478076607531;
	Wed, 02 Nov 2016 01:50:07 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-246-178.clienti.tiscali.it.
	[78.12.246.178]) by smtp.googlemail.com with ESMTPSA id
	m194sm1883115wmg.11.2016.11.02.01.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Nov 2016 01:50:06 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1478075872-11344-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <be720fa3-ffa2-05a8-2c66-60edcf142a7a@redhat.com>
Date: Wed, 2 Nov 2016 09:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478075872-11344-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [PATCH] sparc: Add slavio_misc.c and eccmemctl.c
 to the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 08:50:13 -0000



On 02/11/2016 09:37, Thomas Huth wrote:
> Both files seem to belong to the Sun4m machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b0712a8..79484ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -710,6 +710,8 @@ S: Maintained
>  F: hw/sparc/sun4m.c
>  F: hw/dma/sparc32_dma.c
>  F: hw/dma/sun4m_iommu.c
> +F: hw/misc/eccmemctl.c
> +F: hw/misc/slavio_misc.c
>  F: include/hw/sparc/sparc32_dma.h
>  F: include/hw/sparc/sun4m.h
>  F: pc-bios/openbios-sparc32
> 

Thomas,

I think you should send a pull request for your MAINTAINERS changes.
Thanks for taking care of it!

Paolo

