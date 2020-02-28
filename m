Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7d4W-0004hG-0G
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 05:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7d4U-0004fe-0d
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:40:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7d4S-000346-U2
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:40:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49694
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7d4S-00033m-Ql
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582886440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjXZYgVMYS9HYhIynJ+DtQWdZtpQygbf+02zwFFdriI=;
 b=OsCcw+j93vwtoK5PNLH/4RnSchXqWOyfQA5nvyrOMUDLBzMb042tOF5p9mIo7rHz1rrZGi
 72kcSPnX2sWE0wYRs8WGapdIPHiGIjF/pU6ClE34AmamQ0lZ0hfRFIkVM7aDkBDM+foWwg
 hIhL4UissmdgrqHqLMxFSMOn7h95+Ig=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-FhQyHM2vPkSsvXuxvqJEYQ-1; Fri, 28 Feb 2020 05:40:35 -0500
X-MC-Unique: FhQyHM2vPkSsvXuxvqJEYQ-1
Received: by mail-wr1-f70.google.com with SMTP id f10so1167236wrv.1
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 02:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=heyyN7weG3TiKSqFTiBsmETw+4JQx1i7XhKY4p5O9nc=;
 b=XUcdkxUMCFphIq/OT3ML06vIr2MPE3DU2MD1qumkstfYFqil+jgusDoXMrdCoxbn3T
 TGOLaJZph47ToANL/cjOCmD0WmfnXmjUiyhtEAxOMk7rtB88aekhnTl1Pd1r28OamXW8
 1bzAX9vQc01Hunvo2yPsqF796kuD4tmsmHZPh6i95aoROnzCbru/hImAi0TC+BUCt2bM
 BSAoFyD1O60l8sysQShGya7da9FTvEDn2S5gqcLjpCpbTumM6b3T6dz+TsZATnuIww7E
 RtaXQIU7RAtsPw0x+CJQ5jcJaVPPXn6zabBEHjYkAjSHfajLlW1mPtKrZ29WDzbKUgkg
 v8OQ==
X-Gm-Message-State: APjAAAXUiFRhkvkGFj6ylFvurvLxvLPDHubQ+i69SKjYWFQfe1CxdfWb
 dPp/sYiXfvzAqZWINyQ4x8XpTNXetRKE9LfUWhrQ10mBJusIW6q1o+zdMn/8qK7+C3E7wJ2eeKc
 sPqa7q3vliS0QX2Xbeg==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr4032633wrs.50.1582886434069; 
 Fri, 28 Feb 2020 02:40:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcg138t5RVp7omIEz+5Xw0Iqho0rWsIess+bRxzm91Tw9rUl/8JBfEiChp+RXw9FdaS4UlwA==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr4032611wrs.50.1582886433781; 
 Fri, 28 Feb 2020 02:40:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:d0d9:ea10:9775:f33f?
 ([2001:b07:6468:f312:d0d9:ea10:9775:f33f])
 by smtp.gmail.com with ESMTPSA id t187sm1677423wmt.25.2020.02.28.02.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:40:33 -0800 (PST)
Subject: Re: [PATCH v2] hw/i386/intel_iommu: Simplify
 vtd_find_as_from_bus_num() logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Yi Sun <yi.y.sun@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Xu <peterx@redhat.com>, Liu Yi L <yi.l.liu@intel.com>
References: <20200226201030.22583-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba1d3a0b-f1ae-21d2-45e9-a3c1fae650df@redhat.com>
Date: Fri, 28 Feb 2020 11:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226201030.22583-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 28 Feb 2020 10:40:43 -0000

On 26/02/20 21:10, Philippe Mathieu-Daud=C3=A9 wrote:
> The vtd_find_as_from_bus_num() function was introduced (in commit
> dbaabb25f) in a code format that could return an incorrect pointer,
> which was later fixed by commit a2e1cd41ccf.
> We could have avoid this by writing the if() statement differently.
> Do it now, in case this function is re-used. The code is easier to
> review (harder to miss bugs).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Since v2: Re-worded commit description, patch sent without -w.
>=20
> This patch is easier to review with 'git-diff -w' (--ignore-all-space):
>=20
> @@ -987,14 +987,17 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, =
uint32_t level)
>  static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_=
num)
>  {
>      VTDBus *vtd_bus =3D s->vtd_as_by_bus_num[bus_num];
> -    if (!vtd_bus) {
> +    GHashTableIter iter;
> +
> +    if (vtd_bus) {
> +        return vtd_bus;
> +    }
> +
>      /*
>       * Iterate over the registered buses to find the one which
>       * currently hold this bus number, and update the bus_num
>       * lookup table:
>       */
> -        GHashTableIter iter;
> -
>      g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
>      while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
>          if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
> @@ -1002,9 +1005,8 @@ static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUS=
tate *s, uint8_t bus_num)
>              return vtd_bus;
>          }
>      }
> -        vtd_bus =3D NULL;
> -    }
> -    return vtd_bus;
> +
> +    return NULL;
>  }
> ---
>  hw/i386/intel_iommu.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6258c58ac9..e720a8939c 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -987,24 +987,26 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, =
uint32_t level)
>  static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_=
num)
>  {
>      VTDBus *vtd_bus =3D s->vtd_as_by_bus_num[bus_num];
> -    if (!vtd_bus) {
> -        /*
> -         * Iterate over the registered buses to find the one which
> -         * currently hold this bus number, and update the bus_num
> -         * lookup table:
> -         */
> -        GHashTableIter iter;
> +    GHashTableIter iter;
> =20
> -        g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> -        while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> -            if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
> -                s->vtd_as_by_bus_num[bus_num] =3D vtd_bus;
> -                return vtd_bus;
> -            }
> -        }
> -        vtd_bus =3D NULL;
> +    if (vtd_bus) {
> +        return vtd_bus;
>      }
> -    return vtd_bus;
> +
> +    /*
> +     * Iterate over the registered buses to find the one which
> +     * currently hold this bus number, and update the bus_num
> +     * lookup table:
> +     */
> +    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
> +    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
> +        if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
> +            s->vtd_as_by_bus_num[bus_num] =3D vtd_bus;
> +            return vtd_bus;
> +        }
> +    }
> +
> +    return NULL;
>  }
> =20
>  /* Given the @iova, get relevant @slptep. @slpte_level will be the last =
level
>=20

Queued, thanks.

Paolo


