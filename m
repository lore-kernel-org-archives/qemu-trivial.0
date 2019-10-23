Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNPp1-0001Ro-W4
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 19:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPp0-0001RT-2T
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 19:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPoz-0003Wo-2k
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 19:13:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPoy-0003We-Sf
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 19:13:41 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 941EA5AFE9
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 23:13:39 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id c6so11838670wrp.3
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 16:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q/kahgxTs8oi0snCEUdyH706xxWE0cVeQlvMyxh0e0I=;
 b=GfJBCldCqlZyTzRJvgogVNAZlduC+NQxDGzj1HtgKRaeXKwnM1DnKploe2GiIcmgJV
 0gX26XypB068WUw79V2myGW0Gyr1TT/SsjnB2ey9BdUgzjKmsgmswnv5hzAVa3zJkZAO
 dYV2vFHJhD+/6ujKGAV1x2a6k5P58GFNwzK0QK0nX/+tKLfRrrRwV1qmfzSHe8jmRxyV
 q1ST8DyFZ3oLNN9U/QqAzS8kR1unyQprbC83lXgmHllwP6DFBK/ZoiEgSEIGxNlMw+Ve
 ad7amI1roRc4kbfBOuX7yfQ3fNKS8PJq7t6/JymGsM5bFx7NbVr03uzISU0OtvwX8wUh
 pX2w==
X-Gm-Message-State: APjAAAU0MgHkEYwApsWi06w38N4gG+O9c6dI9mtzCfF4dHIDFafTsP4j
 F0JHW+sVFlrxEp9bU39QQUPhgGg5YbfQbDNr7F1dFuzjzG3UpZdw6uc2QzBY9IIN9mJ8xnvF7zp
 pMiKsxttQBLqvSTmTUQ==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr2010064wmb.97.1571872418271; 
 Wed, 23 Oct 2019 16:13:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmODej7GTwJUBFDO8bMqAOc+KLqmcGzysSSy2U4huxJQk7QJQG2PLIJIWDgDAnOgSTKc2aLA==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr2010052wmb.97.1571872418106; 
 Wed, 23 Oct 2019 16:13:38 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id v10sm989726wmg.48.2019.10.23.16.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 16:13:37 -0700 (PDT)
Subject: Re: [PATCH 1/1] pci: pass along the return value of dma_memory_rw
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191011070141.188713-1-its@irrelevant.dk>
 <20191011070141.188713-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <455e6dee-8dd8-fae7-5a2f-e175b9d1cb8d@redhat.com>
Date: Thu, 24 Oct 2019 01:13:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011070141.188713-2-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 23 Oct 2019 23:13:43 -0000

On 10/11/19 9:01 AM, Klaus Jensen wrote:
> Some might actually care about the return value of dma_memory_rw. So
> let us pass it along instead of ignoring it.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   include/hw/pci/pci.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index f3f0ffd5fb78..4e95bb847857 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -779,8 +779,7 @@ static inline AddressSpace *pci_get_address_space(P=
CIDevice *dev)
>   static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                void *buf, dma_addr_t len, DMADirection =
dir)
>   {
> -    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
> -    return 0;
> +    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, d=
ir);
>   }
>  =20
>   static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

