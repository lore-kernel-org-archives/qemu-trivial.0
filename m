Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Swxk7-0002jl-M4
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 11:55:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Swxk5-0002dc-Gq
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Swxk1-0007GC-Fe
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:55:17 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:63531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Swxjq-00074e-87; Thu, 02 Aug 2012 11:55:02 -0400
Received: by yenl1 with SMTP id l1so8629939yen.4
	for <multiple recipients>; Thu, 02 Aug 2012 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+vrBFonBwLGgepaylAUl9J4vmighDSGnf56uUjmmZXs=;
	b=dwTiiTw9K6FjDuXAFQ3lGYwyp9x0GmE8mIkMkIGKnKs0eEIipI9Qa6+J5QnA/l45u5
	kT1GfkTDKZFdkO3IMyEn3ylGMjenrDWMaIGu/H7XWjo+22CWo+2Ak2zAzt+20ZM+2Jn2
	HKqaF9+qwonEAf6jI8Ocfxeu+AwustqCPGszHVa0vvfpr4JemJIMIRPlprojX0+7190G
	hmsI6Htjd2xhMwMZnmy63K5xoUQPw8roLKGmL+L+7NXL0O9rssFf1aBQduXcIpxDKHlf
	5bfjEIKxvNRjnd/WCpf/NDUCSCi3nze3wGpR/Ysqc7VtCgfFC6lySDwMFEJeZqSGa1Fp
	mFaw==
Received: by 10.50.171.106 with SMTP id at10mr4405691igc.61.1343922901271;
	Thu, 02 Aug 2012 08:55:01 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id gh2sm14137823igb.9.2012.08.02.08.54.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 08:54:59 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <501AA2CF.8070907@redhat.com>
Date: Thu, 02 Aug 2012 17:54:55 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
	<1343896830-3503-2-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1343896830-3503-2-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] esp: add missing const on TypeInfo
	structures
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
X-List-Received-Date: Thu, 02 Aug 2012 15:55:18 -0000

Il 02/08/2012 10:40, Hervé Poussineau ha scritto:
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  hw/esp.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/esp.c b/hw/esp.c
> index c6422ad..4b00889 100644
> --- a/hw/esp.c
> +++ b/hw/esp.c
> @@ -816,7 +816,7 @@ static void sysbus_esp_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_sysbus_esp_scsi;
>  }
>  
> -static TypeInfo sysbus_esp_info = {
> +static const TypeInfo sysbus_esp_info = {
>      .name          = "esp",
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(SysBusESPState),
> @@ -1178,7 +1178,7 @@ static void esp_pci_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_esp_pci_scsi;
>  }
>  
> -static TypeInfo esp_pci_info = {
> +static const TypeInfo esp_pci_info = {
>      .name = "am53c974",
>      .parent = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PCIESPState),
> 

Applied to scsi-next branch.

Paolo


