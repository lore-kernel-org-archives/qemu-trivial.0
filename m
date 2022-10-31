Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opYnk-0000jO-My
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 13:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opYng-0000hV-BL
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 13:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opYnX-00008u-Gf
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 13:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667238126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FaXFcc9C+5XoKkXqBqLM25UVfqVRdaikneEi16kc4o=;
 b=CoDWwqr2PiIPXuRFb4A2VfMmNjZFZXk/N/9MPeFJzpxVyul5BMNsWIDO7/2UTcoqatOF2P
 l8QgQPNEqX0jDdWoqzQ8MSNUbIc8WBGIKUQlLsBLALzE1W926UD3OSOkNi7KRoesOj+vsw
 ETJuFpWjLXd2X0YxkmP9zmojHGUYemA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-sA8LUlXiONiklXbdJSdtKQ-1; Mon, 31 Oct 2022 13:42:05 -0400
X-MC-Unique: sA8LUlXiONiklXbdJSdtKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t20-20020a7bc3d4000000b003c6bfea856aso2862450wmj.1
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 10:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5FaXFcc9C+5XoKkXqBqLM25UVfqVRdaikneEi16kc4o=;
 b=wO+x03AQ8sMBNJgHFaIG0YB5+F9ltdw67qijUTY2UlEs+NU8gECkQopT9d5L9h2EIV
 v+vEZr1pvnsDAjMBbO+rD+pVQtUx34IrBp7OszYn0fJm686CC4CUZgZwwcuNJHjLevcX
 DxBijsxS081L26MgMlGcSPopqP9F5BQ5s7QWiBFsPJ9WZpF3Z1UkaYJaRyZ5fU3T8rsc
 j8ok23w9RoIDVsS4fik961iwPSKi+T/wlNkbL1KD3Cg2i0A06tvFy2mk93DEld1mnMxL
 XNadH4/dtnx1dfHBFUtgM9NBnd/hoQWJ+/jJSGeX5zuMqU8Xjun+4MxtEqF1jBWjoLYR
 v/9Q==
X-Gm-Message-State: ACrzQf2uylXR1IifMcNFJ8z5k+AX4CU5BYKT1fnkdQJ/p0qp3sTjTOF2
 YZb6gh6repIWYQwySaNOtkH2i6BaWsw+Igw8v1uAjcGZVfKilVVuYkMhcDMOI4ASiNch1bCxVo2
 0cH2pym1WqHl7+ey01g==
X-Received: by 2002:a05:600c:2242:b0:3cf:4ccc:7418 with SMTP id
 a2-20020a05600c224200b003cf4ccc7418mr18412975wmm.191.1667238124277; 
 Mon, 31 Oct 2022 10:42:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+lZsFcduWlGpytm6eayD58ynXF/KFqeeIIkZ3+YSD9V4LxrKXG9hGu9yWfQ2i3UvRTmM/uQ==
X-Received: by 2002:a05:600c:2242:b0:3cf:4ccc:7418 with SMTP id
 a2-20020a05600c224200b003cf4ccc7418mr18412954wmm.191.1667238123980; 
 Mon, 31 Oct 2022 10:42:03 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm8944615wmc.45.2022.10.31.10.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:42:03 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:41:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221031134045-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-3-shentey@gmail.com>
 <20221031134529.5f7250ce@fedora>
MIME-Version: 1.0
In-Reply-To: <20221031134529.5f7250ce@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 31 Oct 2022 17:42:18 -0000

On Mon, Oct 31, 2022 at 01:45:29PM +0100, Igor Mammedov wrote:
> On Fri, 28 Oct 2022 12:34:18 +0200
> Bernhard Beschow <shentey@gmail.com> wrote:
> 
> > The is_piix4 attribute is set once in one location and read once in
> > another. Doing both in one location allows for removing the attribute
> > altogether.
> 
> we also test for piix4 in acpi_get_pm_info(),
> Perhaps we should move is_piix4 to AcpiPmInfo
> and reuse it in build_dsdt()?
> Also should use is_piix4 as argument to build_iqcr_method()
> to make its call places self documenting. But that's another patch.

Well I picked this up for pull req since i had to make
a decision before freeze.  But sure, a cleanup like
this might even be acceptable before rc1 I think.
Bernhard?

> 
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Message-Id: <20221026133110.91828-3-shentey@gmail.com>
> > ---
> >  hw/i386/acpi-build.c | 20 ++++++--------------
> >  1 file changed, 6 insertions(+), 14 deletions(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 1ebf14b899..73d8a59737 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
> >  } AcpiPmInfo;
> >  
> >  typedef struct AcpiMiscInfo {
> > -    bool is_piix4;
> >      bool has_hpet;
> >  #ifdef CONFIG_TPM
> >      TPMVersion tpm_version;
> > @@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
> >  
> >  static void acpi_get_misc_info(AcpiMiscInfo *info)
> >  {
> > -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> > -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> > -    assert(!!piix != !!lpc);
> > -
> > -    if (piix) {
> > -        info->is_piix4 = true;
> > -    }
> > -    if (lpc) {
> > -        info->is_piix4 = false;
> > -    }
> 
> ack for this hunk
> 
> >      info->has_hpet = hpet_find();
> >  #ifdef CONFIG_TPM
> >      info->tpm_version = tpm_get_version(tpm_find());
> > @@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> >             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> >  {
> > +    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> > +    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> >      CrsRangeEntry *entry;
> >      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> >      CrsRangeSet crs_range_set;
> > @@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> >                          .oem_table_id = x86ms->oem_table_id };
> >  
> > +    assert(!!piix != !!lpc);
> > +
> >      acpi_table_begin(&table, table_data);
> >      dsdt = init_aml_allocator();
> >  
> >      build_dbg_aml(dsdt);
> > -    if (misc->is_piix4) {
> > +    if (piix) {
> >          sb_scope = aml_scope("_SB");
> >          dev = aml_device("PCI0");
> >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > @@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> >          }
> >          build_piix4_pci0_int(dsdt);
> > -    } else {
> > +    } else if (lpc) {
> >          sb_scope = aml_scope("_SB");
> >          dev = aml_device("PCI0");
> >          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));


