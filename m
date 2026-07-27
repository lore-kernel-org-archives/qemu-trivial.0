Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB7C531D0
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Jul 2026 12:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1woKK3-0000eC-Qv; Mon, 27 Jul 2026 08:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1woKJz-0000bR-Sy
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 08:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1woKJy-000098-9Z
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 08:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785154837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89NzTzSellfW3qMr8dN8sAksaWWUoRY5Hxr3im1aqv4=;
 b=NRQmDa9PWUywXHkit8RUoFykfS+dAQOBL6HZF3dj/jUemTUCP2yS6AdfCVn6vC1F9LNK+0
 BfeMHSU5r5DChMW/MCdXKhVHiI1zBY62H9PRdgMumPMcU4R3YQUVRpOWcyL/jxUiVp0kWF
 vRrzk3r0MOMApGSrbD8wEvtjjXV1RYs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-vEDUGeavMei4roMDrwGSsg-1; Mon, 27 Jul 2026 08:20:34 -0400
X-MC-Unique: vEDUGeavMei4roMDrwGSsg-1
X-Mimecast-MFC-AGG-ID: vEDUGeavMei4roMDrwGSsg_1785154833
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-c15ceb17a28so216331166b.3
 for <qemu-trivial@nongnu.org>; Mon, 27 Jul 2026 05:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785154833; x=1785759633;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=89NzTzSellfW3qMr8dN8sAksaWWUoRY5Hxr3im1aqv4=;
 b=ElkSfX8cGmM6P0U+aIFfvHoj5ZItiv/aoswF8uoIsa/+Z1xFuhRPeIztBX5ROL/2xr
 V5vprVwy9af1/W85zxKpCrdLVIf82mQ7WE/ATfhiYdqlJDD4B6e1CwRoRMSKnJsT618r
 PD2dXxks7YFzooChmwt6LmtnfcMHEVl7k3ZvYiyNQLR63H1Xr9ozXsfMaTurNKM3+KC5
 xE/RiSFrkLF4x5EH3os7fanhizdDgk/ASc9hA6btyPuzLBnTM3CP0eAJvdOstYdxoXWO
 yVTegsK3b1P9eM0DR4rdc+va6w8JOwu9e1EjHl0W4AtQ8IXoyhibXPl8NGtJpzGEKn8f
 yAxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpV/mJSmgRMAz6jReP11/+h6KDLMkI3RbsWaNSFdYtkMnjKgJ/CqjNBGWDD8xoPFp/FeAMzY27h8FKabTA=@nongnu.org
X-Gm-Message-State: AOJu0Ywvm/allWlFlzDeZidhHH6TY2yKOk44IcCM00LqLxYUxCcOGs00
 p92Js+hfTHTULvExhghgTF3mhNE/5kDraOmZ4ybxPBm3aM+Hn3SyDzhe9XGPveKVflRgXI4mE7q
 8rhkisU9kmF4FmStU1S1ZDNg0IxpeOXQvYmt0rbZI/8yFHvpXSbMZJYOxOgk=
X-Gm-Gg: AR+sD103aSSXPZ5kYRo6c5To81c8QASGaFt99S/ABjUzvlimczUQE1FnofiNqYJUgzz
 RsrA28kIDKxx0om+icomBWCF/MisPzNB40X4NHzdnpFsIqwIEcFl4qWysg+stZCeGb4SmcHack6
 mgCWiYg+9psVkbL3op1d51e5oaNatMLWi7SLzykg3oc7nP+vo1XlP6u/6+8HdSFxkxHxEf9MRPi
 /Er9+2LJ3YA3bQJiAsXHSZYD3RYhKNw6fnr3t4gYiYf5LIvr2LA32gMMLsKidYY4E/5566b2meU
 tU43M+ZP9Kk4O3TWFE6n0FntxNlQiAFbHtf98sDxNxoI52Ki3Pl9AfumtYq+
X-Received: by 2002:a17:907:72cb:b0:c16:26c7:6ba8 with SMTP id
 a640c23a62f3a-c1f1ea08253mr325682466b.6.1785154832916; 
 Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
X-Received: by 2002:a17:907:72cb:b0:c16:26c7:6ba8 with SMTP id
 a640c23a62f3a-c1f1ea08253mr325680866b.6.1785154832520; 
 Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32f19c57sm626106066b.58.2026.07.27.05.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:20:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Lukas Straub <lukasstraub2@web.de>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhao Liu
 <zhao1.liu@intel.com>, Laurent Vivier <laurent@vivier.eu>, Markus
 Armbruster <armbru@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@mailo.com>, Alex
 Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>, Hanna
 Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, Stefan
 Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, "Michael
 S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, linux-edac@vger.kernel.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Jason Wang
 <jasowangio@gmail.com>, qemu-trivial@nongnu.org, Jonathan Cameron
 <jic23@kernel.org>
Subject: Re: [PATCH v2 26/44] qapi: convert intro sections for pci.json
Message-ID: <20260727142028.3206f9e7@imammedo>
In-Reply-To: <20260723044805.527643-27-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
 <20260723044805.527643-27-jsnow@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ehMKh1ZbyHFOLrKussXb6hHtmBuSMJwNVGcTlq2mYCY_1785154833
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Thu, 23 Jul 2026 00:47:47 -0400
John Snow <jsnow@redhat.com> wrote:

> (Trivial)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  qapi/pci.json | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/qapi/pci.json b/qapi/pci.json
> index 694c741e420..a6a79f91afc 100644
> --- a/qapi/pci.json
> +++ b/qapi/pci.json
> @@ -13,8 +13,7 @@
>  
>  ##
>  # @PciMemoryRange:
> -#
> -# A PCI device memory region
> +#     A PCI device memory region
>  #
>  # @base: the starting address (guest physical)
>  #
> @@ -26,8 +25,7 @@
>  
>  ##
>  # @PciMemoryRegion:
> -#
> -# Information about a PCI device I/O region.
> +#     Information about a PCI device I/O region.
>  #
>  # @bar: the index of the Base Address Register for this region
>  #
> @@ -51,8 +49,7 @@
>  
>  ##
>  # @PciBusInfo:
> -#
> -# Information about a bus of a PCI Bridge device
> +#     Information about a bus of a PCI Bridge device
>  #
>  # @number: primary bus interface number.  This should be the number of
>  #     the bus the device resides on.
> @@ -80,8 +77,7 @@
>  
>  ##
>  # @PciBridgeInfo:
> -#
> -# Information about a PCI Bridge device
> +#     Information about a PCI Bridge device
>  #
>  # @bus: information about the bus the device resides on
>  #
> @@ -94,8 +90,7 @@
>  
>  ##
>  # @PciDeviceClass:
> -#
> -# Information about the Class of a PCI device
> +#     Information about the Class of a PCI device
>  #
>  # @desc: a string description of the device's class (not stable, and
>  #     should only be treated as informational)
> @@ -109,8 +104,7 @@
>  
>  ##
>  # @PciDeviceId:
> -#
> -# Information about the Id of a PCI device
> +#     Information about the Id of a PCI device
>  #
>  # @device: the PCI device id
>  #
> @@ -128,8 +122,7 @@
>  
>  ##
>  # @PciDeviceInfo:
> -#
> -# Information about a PCI device
> +#     Information about a PCI device
>  #
>  # @bus: the bus number of the device
>  #
> @@ -161,8 +154,7 @@
>  
>  ##
>  # @PciInfo:
> -#
> -# Information about a PCI bus
> +#     Information about a PCI bus
>  #
>  # @bus: the bus index
>  #
> @@ -174,8 +166,7 @@
>  
>  ##
>  # @query-pci:
> -#
> -# Return information about the PCI bus topology of the guest.
> +#     Return information about the PCI bus topology of the guest.
>  #
>  # Returns: a list of info for each PCI bus.  Each bus is
>  #     represented by a json-object, which has a key with a json-array


