Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkLao-00016k-FL
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 02:30:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLam-000110-Ul
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 02:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLak-0008Mr-Nm
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 02:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwPT1QYVjGy3wzj6f3joG9IhoMPLqg0OMa8v2OxOmd4=;
 b=IWD64HNesPVMlvK0zL30vBgPqwyy1KNMxlOb2kSFTZqmS6FnnQZSLts1VoOPxlmKXvqJiV
 Ao3Mvx/OlkFkLHSyc0okLgq9h5VbMsc0Gap3aT9XrHOp8seZmaKZ1WSvqQf504mLeriR2R
 T5uwRXVwI4ot4M/Ay8BGL+3YOGx+/uo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-IKzgxjB-MMi8Lx6WsJkzYw-1; Tue, 09 Nov 2021 02:30:47 -0500
X-MC-Unique: IKzgxjB-MMi8Lx6WsJkzYw-1
Received: by mail-pl1-f198.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so8198744pls.11
 for <qemu-trivial@nongnu.org>; Mon, 08 Nov 2021 23:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GwPT1QYVjGy3wzj6f3joG9IhoMPLqg0OMa8v2OxOmd4=;
 b=AuHhjl9v+i67PLdAuvv/lp1M6gt84gSzlotK4F+JpkhVlolFGe6rHIJNU02OrXUEgY
 0EUthjAMf2bn7bpMFZW6xUgSkZN6JDCQa3nGabPanM5Ni69g6DiLtkyy7ew4OCDqpCAU
 syVz7zmDTYcvTiDvXIbebNKMUaM9jCan6zb9Zj40S4Wf1ZS+dzwyuKdPvYJA4sI5JapO
 d/ddoO1K+5dNYU+cH3uah1OWtL2f5ziVkUGT6Fc8deDJ0ENE3AOpl8Ms8CYB6xFc52/I
 JqeSvsWfprql+TW4ASPZfgvO7mHSIa0ouY1GE4T9lnkVw9wnZaYwEedO7/D0BY35JyXb
 zTVA==
X-Gm-Message-State: AOAM532IbUt2QTOzzQ2AhfIQQVOa2p/6EyB0/CXAq8NFijbiSd6dEJo7
 1w+Uovx5d2k0HOxb23qFZ2hwbTVQqzrrCZTCDaT05VQKxVlVymkGVoxd7W9xj5zcbQFuUSrHePT
 qQygc3nTjpTivudR7LhJIl3D6paCT+bq4iA==
X-Received: by 2002:a17:90a:9501:: with SMTP id
 t1mr5057729pjo.134.1636443046364; 
 Mon, 08 Nov 2021 23:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtlcRAZHq04IEqzEW7CgbhKxWU24cxLMyKgZRYx+ehi+ZoghfQD6MUl0cEvIYojui1a6vytoU0Inb0EQG1NgA=
X-Received: by 2002:a17:90a:9501:: with SMTP id
 t1mr5057702pjo.134.1636443046163; 
 Mon, 08 Nov 2021 23:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
 <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
In-Reply-To: <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 Nov 2021 11:30:35 +0400
Message-ID: <CAMxuvayxZaBzs4RuR9JR5ocMfcXr-phQzcsFbBSPt1CH0PnoRg@mail.gmail.com>
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 Stefan Berger <stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 07:30:53 -0000

Hi

On Tue, Nov 9, 2021 at 11:25 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> On Tue, Nov 9, 2021 at 4:37 AM Stefan Berger <stefanb@linux.vnet.ibm.com>=
 wrote:
> >
> > Add missing device identification objects _STR and _UID. They will appe=
ar
> > as files 'description' and 'uid' under Linux sysfs.
> >
> > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Ani Sinha <ani@anisinha.ca>
> > Fixes: #708
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> (on my host, for some reason the UID is 1, does this matter?)

And shouldn't this be done also for TIS device?

>
> > ---
> >  hw/arm/virt-acpi-build.c | 1 +
> >  hw/i386/acpi-build.c     | 4 ++++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 674f902652..09456424aa 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachi=
neState *vms)
> >
> >      Aml *dev =3D aml_device("TPM0");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")=
));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >
> >      Aml *crs =3D aml_resource_template();
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a3ad6abd33..d6d3541407 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
> >                      dev =3D aml_device("TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_string("MSFT0101=
")));
> > +                    aml_append(dev,
> > +                               aml_name_decl("_STR",
> > +                                             aml_string("TPM 2.0 Devic=
e")));
> > +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)))=
;
> >                  } else {
> >                      dev =3D aml_device("ISA.TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> > --
> > 2.31.1
> >


