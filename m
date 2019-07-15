Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmz1J-0008SY-4n
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2019 07:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48123)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hmz1H-0008QZ-1D
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2019 07:19:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hmz1G-0004LX-2L
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2019 07:19:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39223)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hmz1E-0004IU-3D
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2019 07:19:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so16633872wrt.6
 for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2019 04:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uduoneM+QrM6MHRk9FrHAjwAlnRrfZQdnUtoXqghyFU=;
 b=CXUeka+4B5TFQIrN18GIevdKBo+z0RtVRLLkFhT7RtPU/gZPhoLVcX8rdyQH7Tq49k
 RIxJcHsza/7WAs0oX8k93OhI511VdgqWzp4f1DT9t1FwXbJvamZ3FOCsNTs8SwVdAel6
 A1zNpAHIbWI0TxOEpknAwEldO+dUBP5kHkO5asdY9HuXclrMlBg5h8jp4NqiixWYrkdO
 gBPtdaXlxsIWhN3fiX0V5C1wKi9XQadEgh8FY/vtK1EI4ZvFIyGti7XntrnkJboGTKGZ
 AVKeSM5J7Kx2Y39TrTUwRHiPvw3UOZH7vJs6S1CO/f5U8AOkbeV86wZg6C6loFDEtBWh
 2hdg==
X-Gm-Message-State: APjAAAV5sRvpRN+t1ZDLoiH1qHbAbscEy/DjFYWQWDYRVMEZKO7tjpuZ
 D2xm/P9Jsom/1TjF0q2/8WtEIA==
X-Google-Smtp-Source: APXvYqxiyCRuzbDuyXZeHhEAc0nRgpyZ3n17o42gTbA+c5C+3bpxmwjUOM+RkKzs7RcN/9K2GR7Tow==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr27547900wro.162.1563189573081; 
 Mon, 15 Jul 2019 04:19:33 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id y16sm36025043wrg.85.2019.07.15.04.19.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 04:19:32 -0700 (PDT)
Date: Mon, 15 Jul 2019 13:19:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Message-ID: <20190715111930.j7bdcq3dtayu66ve@steredhat>
References: <20190715102210.31365-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190715102210.31365-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/e1000: Fix erroneous
 comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 11:19:47 -0000

On Mon, Jul 15, 2019 at 12:22:10PM +0200, Philippe Mathieu-Daudé wrote:
> Missed during the QOM convertion in 9af21dbee14.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/net/e1000.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 1dc1466332..ec8ded7252 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1611,7 +1611,7 @@ static const VMStateDescription vmstate_e1000 = {
>  
>  /*
>   * EEPROM contents documented in Tables 5-2 and 5-3, pp. 98-102.
> - * Note: A valid DevId will be inserted during pci_e1000_init().
> + * Note: A valid DevId will be inserted during pci_e1000_realize().
>   */
>  static const uint16_t e1000_eeprom_template[64] = {
>      0x0000, 0x0000, 0x0000, 0x0000,      0xffff, 0x0000,      0x0000, 0x0000,

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

