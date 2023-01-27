Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLNgx-0004MO-SJ
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2023 07:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNgn-0004Id-8g
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 07:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNgk-0008DM-3o
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 07:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674821916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVVeR2P6S8mRJ+Y2ONHvQHaqd34ZySsnQbvzzI1vQW8=;
 b=M5Wb1Gmj+Bxl/A6U3Z3u2ab2OZnlwBMl0suOfREbCkzQllRQswygGAYJ4azMiTD/CPlEr4
 0258KA+nXg6XzRU0FEozrAf/WqysMxjwUY22+4VNf7f0l5BJyBxOqLJMsDe7XUgiQFPMmT
 cuelNBzCUnYn/AX8fYwC+n1iaXOrMzI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-8yyqg3RsMyqWGYa536ZdDg-1; Fri, 27 Jan 2023 07:18:35 -0500
X-MC-Unique: 8yyqg3RsMyqWGYa536ZdDg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003db0cb8e543so1355033wmi.3
 for <qemu-trivial@nongnu.org>; Fri, 27 Jan 2023 04:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVVeR2P6S8mRJ+Y2ONHvQHaqd34ZySsnQbvzzI1vQW8=;
 b=8LEk7bHXXbZx8+sDFW83HNnJiP4jZwCZYSLSI3V1GPD6PhJZBXioZsiy7EdX/XJYBy
 WqfY5ukHh9D216G6Qw3E2v1DkN3GDbeIKKNie9aka1HhoJid5uv2kvX1VmvwUpLivHNi
 kEc1vGXjHP9MxbjM0pm4Or1SmS1nAOZzBWHFot67uwp+p8ctaueTFSwKspyDh+yPVM0b
 snecnHtco/prpBa3zCmstxWWPrd6+ehW4LstdZ68KVW9diO5xuYCUKFVKtevxQ7Oig/8
 0cybTKtjKMS5XoG5rsfNBkDXJXOmUl7xKGgZFVbJxLUBz1UAJUEIwRSmg1W1hYxnEeIZ
 xkgg==
X-Gm-Message-State: AFqh2kpZ3tR6BS9NiuZqxVWyQgr9xpjzbrejJBpKBT1cH1sUexMGQNoI
 1uxKx2M6H4ZGgbnbePrQw4PnYYZlVWFdJEaR90ZkXs+HbVyskr5ajHwQlY8wMYTQavLyn7Imeuh
 o91VkhxSK+Bhxd1jr/OGQZPSRG/GPylR3gQ==
X-Received: by 2002:a05:600c:aca:b0:3da:50b0:e959 with SMTP id
 c10-20020a05600c0aca00b003da50b0e959mr3000495wmr.138.1674821914462; 
 Fri, 27 Jan 2023 04:18:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2oUNAZJq+5FobR160H/yJyA1IYeHfa66BRViU7wgBFNRlEOCfh5Ck9E1HhUyk3E7A8UnYeNYMibjvFe/N0go=
X-Received: by 2002:a05:600c:aca:b0:3da:50b0:e959 with SMTP id
 c10-20020a05600c0aca00b003da50b0e959mr3000494wmr.138.1674821914197; Fri, 27
 Jan 2023 04:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20230127084604.53175-1-smitterl@redhat.com>
 <87h6wcuv62.fsf@redhat.com>
In-Reply-To: <87h6wcuv62.fsf@redhat.com>
From: Sebastian Mitterle <smitterl@redhat.com>
Date: Fri, 27 Jan 2023 13:17:58 +0100
Message-ID: <CAKgrZ6+Bp9XiL9gkhGVcB7TL1+Z335H9vq5Lqpa+Q4KSjAnNeA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, clegoate@redhat.com, 
 qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 27 Jan 2023 12:18:50 -0000

On Fri, Jan 27, 2023 at 11:30 AM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Fri, Jan 27 2023, Sebastian Mitterle <smitterl@redhat.com> wrote:
>
> > Add some documentation about the zpci device and how
> > to use it with pci devices on s390x.
> >
> > Used source: Cornelia Huck's blog post
> > https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> >
> > Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> > ---
> > v2: move section below 'Device support'
> > ---
> >  docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
> >  docs/system/target-s390x.rst     |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 docs/system/s390x/pcidevices.rst
> >
> > diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> > new file mode 100644
> > index 0000000000..fec905d6e6
> > --- /dev/null
> > +++ b/docs/system/s390x/pcidevices.rst
> > @@ -0,0 +1,34 @@
> > +PCI devices on s390x
> > +====================
> > +
> > +PCI devices on s390x work differently than on other architectures.
>
> add "and need to be configured in a slightly different way." ?
>
> > +
> > +To start with, using a PCI device requires the additional ``zpci`` device. For example,
>
> I think the "zpci" device is not technically "required" (ISTR that we
> autogenerate it, if needed); however, you need it if you actually want
> to specify uid/fid/... what about:
>
> "Every PCI device is linked with an additional ``zpci`` device. While
> the ``zpci`` device will be autogenerated if not specified, it is
> recommended to specify it explicitly so that you can pass s390-specific
> PCI configuration."
>
> ?
>
> > +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
> > +
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> > +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> > +
> > +Here, the zpci device is joined with the PCI device via the ``target`` property.
> > +
> > +Note that we don't set bus, slot or function here for the guest as is common in other
> > +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
>
> "Topology information is not available on s390x, and the guest will not
> see any of the bus/slot/function information specified on the command
> line."
>
> ?
>
> > +and ``fid`` determine how the device is presented to the guest operating system.
> > +
> > +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> > +``fid`` identifies the physical slot, i.e.::
> > +
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> > +                   ...
> > +
> > +will be presented in the guest as::
> > +
> > + # lspci -v
> > + 0007:00:00.0 ...
> > + Physical Slot: 00000008
> > + ...
> > +
> > +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
> > +it.
>
> I'm wondering what the current state of that feature is -- is it present
> by default in the newer named models? (My original blog entry was
> written nearly five years ago ;)
>
David Hildenbrand confirmed the feature is default-on in the qemu
model since qemu 4.0 and also for the host model if supported by the
modern hardware. Therefore, I'll omit this sentence.


