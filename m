Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLNXr-0001lo-I5
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2023 07:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNXm-0001lD-U2
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 07:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pLNXl-0005Ah-Ar
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 07:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674821359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oN4tyfQtB+VIjrVxVFLEiOZrPcbl5758PCnNZ1GxC64=;
 b=PWPdIN1s+whpqMaFWrsQIKBpt0Vtk9t20r3vRK81XVtZ4MpezZSIvSIJUkglXntNggXyuG
 xT9/RUgw7FcpraeDa/QgfTAU9WIe9EJCgRr9m7LnWGufwU64/bcn9w0VGStsYrteZXeTJL
 2YOfc9Y6ou+yrfJOlrjlx1ZL1upGtPE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-g2DasfrfMN-hms8DY_VkkA-1; Fri, 27 Jan 2023 07:09:15 -0500
X-MC-Unique: g2DasfrfMN-hms8DY_VkkA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso2682532wms.4
 for <qemu-trivial@nongnu.org>; Fri, 27 Jan 2023 04:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oN4tyfQtB+VIjrVxVFLEiOZrPcbl5758PCnNZ1GxC64=;
 b=R29tPcJG967Sk5J22T4+mN00fnRBLwaiUVRGmkHn1TdXdUoyCEIyBJGm0HM8Og3PSx
 0aL0P9DcGOlDIjU7R1mvM8vlijjmh5R0zMBRr4Iu5Uq4zc/pTgocGcHxxjhRqxMUaQYB
 14dQAFe/vsH37+BPn4W+xpqFBDUP6R0aQ82/0LAoyUGhtbdExX7OmXkTUCJs3kUm6qRH
 fqfi1bHBEvyBu/xTGxxuzeb32HTji4D+IYZzEHS5CKTsM0k+JhFm7KD6QAFIF8yDeOoo
 3i1sY57+Ax3xDczyOmlrishb3jujRQOMb/OaTPzhoj7/vgAwVoi7vVN6yrRkHo56+2aN
 K/xw==
X-Gm-Message-State: AFqh2kowbWybLDzKn30UdzuZjc0LcB9p4YYKckyKOZDFyb+ohzMODYd+
 p6oM0yJcMT/2zkz3FeTwVPCa8Qw3aetpyjFj6mE/GejGJ66xauAtF9zLyr4XHdfwRxVfDKKcAHq
 F1BqRHzIe6Zlnasam+mnMPoV2ziCFaddw2g==
X-Received: by 2002:a7b:ce8f:0:b0:3d9:e033:e2ee with SMTP id
 q15-20020a7bce8f000000b003d9e033e2eemr2200897wmj.117.1674821354747; 
 Fri, 27 Jan 2023 04:09:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTj9z88Zzv3k4g/NfuH0NJUUgwEuzscGt8rgm5qXRuwsz18kZ2IoboRecZ+PYR1a/RDf0WJGYQOBMCxRnjGSI=
X-Received: by 2002:a7b:ce8f:0:b0:3d9:e033:e2ee with SMTP id
 q15-20020a7bce8f000000b003d9e033e2eemr2200892wmj.117.1674821354398; Fri, 27
 Jan 2023 04:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20230127084604.53175-1-smitterl@redhat.com>
 <46642f8f-d514-798b-1e4e-bc337a206c38@redhat.com>
In-Reply-To: <46642f8f-d514-798b-1e4e-bc337a206c38@redhat.com>
From: Sebastian Mitterle <smitterl@redhat.com>
Date: Fri, 27 Jan 2023 13:08:38 +0100
Message-ID: <CAKgrZ6+=kPizSUh=0Bq3PRgbjLGGkeSGbUbgLhsREbqKtMa6uw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, cohuck@redhat.com, clegoate@redhat.com, 
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
X-List-Received-Date: Fri, 27 Jan 2023 12:09:26 -0000

On Fri, Jan 27, 2023 at 10:24 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/01/2023 09.46, Sebastian Mitterle wrote:
> > Add some documentation about the zpci device and how
> > to use it with pci devices on s390x.
>
> Thanks for tackling this! ... some comments below...
>
> > Used source: Cornelia Huck's blog post
> > https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> >
> > Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> > ---
> > v2: move section below 'Device support'
> > ---
> >   docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
> >   docs/system/target-s390x.rst     |  1 +
> >   2 files changed, 35 insertions(+)
> >   create mode 100644 docs/system/s390x/pcidevices.rst
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
> > +
> > +To start with, using a PCI device requires the additional ``zpci`` device. For example,
>
> Please wrap lines at 80 columns (if possible)
>
> > +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
>
> I'd suggest to be more explicit here:
>
> in order to pass a host PCI device ``0000:00:00.0`` through to the guest,
> you would specify::
>
> > + qemu-system-s390x ... \
> > +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> > +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> > +
> > +Here, the zpci device is joined with the PCI device via the ``target`` property.
> > +
> > +Note that we don't set bus, slot or function here for the guest as is common in other
>
> "as *it* is common" ?
>
I checked linguee.com and it seems to me it's correct to omit the 'it' here.
> > +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
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
>
> s/oder/order/
>
> (and it's a very long line again, please wrap at 80 columns)
>
> > +it.
>
> Should we also add some information about virtio devices? (can also be added
> later, not necessarily in your patch already)
>
I don't have experience with virtio pci devices on s390x. Therefore I
prefer not to add this information this time.
>   Thomas
>


