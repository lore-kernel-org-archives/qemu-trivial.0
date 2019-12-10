Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iebXj-0002us-9y
	for mharc-qemu-trivial@gnu.org; Tue, 10 Dec 2019 04:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iebXg-0002ue-Tn
 for qemu-trivial@nongnu.org; Tue, 10 Dec 2019 04:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iebXf-00047n-M2
 for qemu-trivial@nongnu.org; Tue, 10 Dec 2019 04:10:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28876
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iebXf-00047H-Ie
 for qemu-trivial@nongnu.org; Tue, 10 Dec 2019 04:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575969050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXhaKz5t0SnmdGGWEp19gAGZ5Jhfzdl8xxTalkAiyCM=;
 b=W9k4ZRiL5ncN+4TDAtmyyaT1kBze0ChtbCzzW9rlIfFb6Wg312pfdrwYS8YIv8SHF5d5N7
 5P2nl1BSIYzZ7jDW24u2x5lkZk4NAxTVWnNJhg8DjU9K+2OW1zBmqJAIJTaGYhU+lXpxjd
 br1JnsYfPfpbr38UatPw7RuhkcSQqsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-9Upzbm85O7m_RBj9_HKZBQ-1; Tue, 10 Dec 2019 04:10:49 -0500
Received: by mail-wm1-f72.google.com with SMTP id i17so766690wmd.1
 for <qemu-trivial@nongnu.org>; Tue, 10 Dec 2019 01:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8EemnXVmh3q0qbc4kn14DfmQcPahbm4unXi1nZ9NCc=;
 b=CnC4N2sK8CwRJxEAI7PrZIarKbfF7y9XxuhGvj+G9aPGB2WmZbYeVAB7f52jtIqCEU
 K8xVvGmZEtZ1+BkOSFt4V2JMyXzGEQR22uAvgE8pXnqeYMDuTF2GPFLDqwJSgLSSLRdz
 yrwwFiKXX7Bk31GZ+HhUVFzmPk4ccRrZR82VF/74Cx5JEIP1T5AddR7EmAHRORf9jKrT
 lg37opjgIujGwE/9MolLW/3T6eaV0nR+94JDD/1vlNBMVxxIITg3u71gXMGe/HgiM4zp
 v7zS9DBV/09PNsOQ25wJh+0Z24SS7OVr3wMqaMx6LaayGvLwX/K7+HD8D5+IvZOlBP0M
 hpxg==
X-Gm-Message-State: APjAAAX6oy0ROFCixNC8d4ozB6wV/jlGOOVXerwn4L5WMiukxO0i1PD8
 /d3hApMsR/YPx2Q5mcRdRqBezIeXvl1UMFSOErt0S2y7EQDPYbIFHYYlHifBH3jgPoFxGUsxYm6
 kZ7BfmXvRJtJEqavT+g==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr1867369wro.352.1575969048584; 
 Tue, 10 Dec 2019 01:10:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzR9lo1IU2hc4RwXyb2OWIY3dWQOIEHWCmgxi3Wn0LP+FuJOdDyNSPuyRA9X8RdvHG17r6jYQ==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr1867348wro.352.1575969048362; 
 Tue, 10 Dec 2019 01:10:48 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id z6sm2660313wrw.36.2019.12.10.01.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 01:10:47 -0800 (PST)
Subject: Re: [PATCH] ppc: Drop useless extern annotation for functions
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <157596536058.115682.18155243603867418789.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <49c6ac09-d047-0b51-147f-1e07a27adf22@redhat.com>
Date: Tue, 10 Dec 2019 10:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <157596536058.115682.18155243603867418789.stgit@bahia.lan>
Content-Language: en-US
X-MC-Unique: 9Upzbm85O7m_RBj9_HKZBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 10 Dec 2019 09:10:54 -0000

On 12/10/19 9:09 AM, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   include/hw/ppc/pnv_xscom.h |   22 +++++++++++-----------
>   include/hw/ppc/spapr_vio.h |    6 +++---
>   2 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index a40d2a2a2a98..1c1d76bf9be5 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -109,16 +109,16 @@ typedef struct PnvXScomInterfaceClass {
>   #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
>   #define PNV10_XSCOM_PSIHB_SIZE     0x100
>  =20
> -extern void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp=
);
> -extern int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
> -
> -extern void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
> -                                    MemoryRegion *mr);
> -extern void pnv_xscom_region_init(MemoryRegion *mr,
> -                                  struct Object *owner,
> -                                  const MemoryRegionOps *ops,
> -                                  void *opaque,
> -                                  const char *name,
> -                                  uint64_t size);
> +void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
> +int pnv_dt_xscom(PnvChip *chip, void *fdt, int offset);
> +
> +void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
> +                             MemoryRegion *mr);
> +void pnv_xscom_region_init(MemoryRegion *mr,
> +                           struct Object *owner,
> +                           const MemoryRegionOps *ops,
> +                           void *opaque,
> +                           const char *name,
> +                           uint64_t size);
>  =20
>   #endif /* PPC_PNV_XSCOM_H */
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index 72762ed16b70..ce6d9b0c6605 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -80,10 +80,10 @@ struct SpaprVioBus {
>       uint32_t next_reg;
>   };
>  =20
> -extern SpaprVioBus *spapr_vio_bus_init(void);
> -extern SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t =
reg);
> +SpaprVioBus *spapr_vio_bus_init(void);
> +SpaprVioDevice *spapr_vio_find_by_reg(SpaprVioBus *bus, uint32_t reg);
>   void spapr_dt_vdevice(SpaprVioBus *bus, void *fdt);
> -extern gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
> +gchar *spapr_vio_stdout_path(SpaprVioBus *bus);
>  =20
>   static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
>   {
>=20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


