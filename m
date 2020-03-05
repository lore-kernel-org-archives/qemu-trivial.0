Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9oWb-0003b4-KV
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 06:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j9oWZ-0003ar-CT
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j9oWY-000113-9a
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:18:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35345
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j9oWY-00010l-6B
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 06:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583407121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrVtzktr0qiOU8ITwSEN0ihc/kYonAkgE5cdM+DSZys=;
 b=AgsEgN3LTHlHY2Bgz922uxf2vdD/FtOmvSEfRMORFnUdEdQs1XzMN3tpp8xGgMz1GumF2v
 m53WLnzHTUFVTi9OnS6cZ4imYBxC7KaJB/q6VTjVso3wgT7nNCXYY85J3l4ibCrdNydJnr
 rtheO1oHLk5Zn3HE8trtK229SWbp/0c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147--2A_62NIN2mFGDrjPu0Zlg-1; Thu, 05 Mar 2020 06:18:38 -0500
X-MC-Unique: -2A_62NIN2mFGDrjPu0Zlg-1
Received: by mail-qk1-f199.google.com with SMTP id 22so3559730qkc.7
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 03:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kLQGRxKT3nC1QBPHTb+Z4AYfSERnI81tpjagDVFshsw=;
 b=lOA+MpLsHuTuowR1yrekl2hx/7HiXBP3unxori791kFTL77sojoZ3/boHEpyjCFUVS
 nZ5SUJd2DYi1Gz5TPv3ensDtN3K5f2RTX8ep/5QbnkALbduzWzeiX2BUnTC13Xo964Gw
 zNdq1YB1oXbKU3Az0iIH9HKqvQPryowi/CTNgK7aHXqylmpZx5mZ+1gWdVWoQ6rUFcOk
 G7JcDaIFzuvBzPhxbz06WFel2wTwSdkaR6RgK/mZLkhvQVs+6tqGUCFoVrRxP58LV0B2
 Qh41JTxEQE6zYe5z4J8+Vyi8Akt9GkRimBujcOebVfOc2yqaCZo1RKR79Cvt/cUKq8Xz
 mSsw==
X-Gm-Message-State: ANhLgQ2oI1KwK2FVSEGgOfCMXGHMyrwb2Kb+y/Uh8j3sYFCwteLP5ic/
 IsFFFqUXaz1/3ZWs+7wGflms2ait3sh+b4a08024o9aCA4ZwQX02M+X/4nJm+O55kIPH2j4zLip
 wXEUJ/QyNSiQ24lOeaw==
X-Received: by 2002:a37:b304:: with SMTP id c4mr7630524qkf.348.1583407117832; 
 Thu, 05 Mar 2020 03:18:37 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvi89OFp9a1bai4JatJvF/e2yckl006J6IaXUvmNHMnL2IjmZPTdRCi47N2iNcXyBf2+hK5hw==
X-Received: by 2002:a37:b304:: with SMTP id c4mr7630490qkf.348.1583407117532; 
 Thu, 05 Mar 2020 03:18:37 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id 69sm535439qki.131.2020.03.05.03.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 03:18:36 -0800 (PST)
Date: Thu, 5 Mar 2020 06:18:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Yi Sun <yi.y.sun@linux.intel.com>,
 Liu Yi L <yi.l.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4] hw/i386/intel_iommu: Simplify
 vtd_find_as_from_bus_num() logic
Message-ID: <20200305061809-mutt-send-email-mst@kernel.org>
References: <20200305102702.31512-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200305102702.31512-1-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 05 Mar 2020 11:18:44 -0000

On Thu, Mar 05, 2020 at 11:27:02AM +0100, Philippe Mathieu-Daud=E9 wrote:
> The vtd_find_as_from_bus_num() function was introduced (in commit
> dbaabb25f) in a code format that could return an incorrect pointer,
> which was later fixed by commit a2e1cd41ccf.
> We could have avoided this by writing the if() statement differently.
> Do it now, in case this function is re-used. The code is easier to
> review (harder to miss bugs).
>=20
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I'll queues this.

> ---
> Since v1: Re-worded commit description, patch sent without -w.
> Since v2: patch send without diff
> Since v3: Fix typo in description and comment (Eric Auger)
>=20
> This patch is easier to review with 'git-diff -w' (--ignore-all-space)
> ---
>  hw/i386/intel_iommu.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6258c58ac9..204b6841ec 100644
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
> +     * currently holds this bus number and update the bus_num
> +     * lookup table.
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
> --=20
> 2.21.1


