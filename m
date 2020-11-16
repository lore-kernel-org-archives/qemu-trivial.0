Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kebCh-0004fd-DN
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 04:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kebCf-0004er-HF
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 04:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kebCd-00071Y-AM
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 04:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605520418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZYqBjX8yYGXMhNDpYQC9X1C9lD25rvo3M3MRvUXFHs=;
 b=DIUOSSP/P1fAmMaf1pJyKY4qU2wO2K8cLrlCvxDigh7iB+5u23WRRr+WH35rEW7YpjKlFL
 uZ2hfbcnUH1dPJuGjpaWBSFg/gdCDwo9VRZXI3KbmV4MNqg6o6OZVJOkzpNGM8PPtKBE5J
 uM3URL9MykMyPfz4hEE6EhDpgeWiJWA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-VZacs1ZiPvet-gtJaMMqlQ-1; Mon, 16 Nov 2020 04:52:54 -0500
X-MC-Unique: VZacs1ZiPvet-gtJaMMqlQ-1
Received: by mail-wr1-f71.google.com with SMTP id 91so10569847wrk.17
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 01:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aZYqBjX8yYGXMhNDpYQC9X1C9lD25rvo3M3MRvUXFHs=;
 b=dS1Y80vmMc7/ShXWqwPxoKCBNdhfHfQXRIuQWFspbA0nDzchxUlXcN7KcRMVGe76E7
 7ZTUVUs5O9s54YhAn7iwtuykuVHI+jwvKDBRjpVbTovQC7WNUHi/wuyg9e759yem8g7z
 90V4NmtcrPaTCISm49utTaVYJz/4ZUx62gFrKcC6ZFNIokd2IaseXwPVfPLFzwvv8hF+
 CMWQjCCbttKzeuxH6Y5cqqGms1TPQDbA0oFmm2KInxlfYRdo40yAWPYR9nJllBCcJf9C
 CU+UyWTpM5r9euWyfrOBJAS60tSvBSegopm2PP01uVrcqleqwb9R1WF7taqHb5j6JjC4
 tyig==
X-Gm-Message-State: AOAM530vREMQBxAMGG9xYz2ps3gmhY06toTjRCeXEwVxkDNQ8VjhbB9I
 HTPpDYV27omcHRjVH+/LqBu6bsfyCmbVkRdLlfZ4MoJRqeAm216RAFqYtqnotFTvaLJyip5szO0
 yqtBOoTie12gcEhgGZQ==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr14807551wmb.16.1605520372906; 
 Mon, 16 Nov 2020 01:52:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQkEuRwhk9WQ+2jgRdt/346ZUOIMV8Vu89S98gSicG73PjTJIkD3KIe3yYzsxTkAiuKNOJVg==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr14807518wmb.16.1605520372500; 
 Mon, 16 Nov 2020 01:52:52 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id a128sm19376773wmf.5.2020.11.16.01.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 01:52:51 -0800 (PST)
Date: Mon, 16 Nov 2020 04:52:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Cc: stefanha@redhat.com, marcandre.lureau@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 QEMU <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] contrib/libvhost-user: Fix bad printf format specifiers
Message-ID: <20201116045218-mutt-send-email-mst@kernel.org>
References: <5FA28106.6000901@huawei.com>
 <5FB1E074.50205@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5FB1E074.50205@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 16 Nov 2020 09:53:41 -0000

It's in the latest pull weren't you Cc'd?

On Mon, Nov 16, 2020 at 10:14:12AM +0800, Alex Chen wrote:
> Kindly ping...
> 
> On 2020/11/4 18:23, AlexChen wrote:
> > We should use printf format specifier "%u" instead of "%d" for
> > argument of type "unsigned int".
> > 
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
> > ---
> >  contrib/libvhost-user/libvhost-user.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> > index bfec8a881a..5c73ffdd6b 100644
> > --- a/contrib/libvhost-user/libvhost-user.c
> > +++ b/contrib/libvhost-user/libvhost-user.c
> > @@ -701,7 +701,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >          return false;
> >      }
> > 
> > -    DPRINT("Adding region: %d\n", dev->nregions);
> > +    DPRINT("Adding region: %u\n", dev->nregions);
> >      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
> >             msg_region->guest_phys_addr);
> >      DPRINT("    memory_size:     0x%016"PRIx64"\n",
> > @@ -848,7 +848,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
> >      VhostUserMemory m = vmsg->payload.memory, *memory = &m;
> >      dev->nregions = memory->nregions;
> > 
> > -    DPRINT("Nregions: %d\n", memory->nregions);
> > +    DPRINT("Nregions: %u\n", memory->nregions);
> >      for (i = 0; i < dev->nregions; i++) {
> >          void *mmap_addr;
> >          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> > @@ -938,7 +938,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
> >          return vu_set_mem_table_exec_postcopy(dev, vmsg);
> >      }
> > 
> > -    DPRINT("Nregions: %d\n", memory->nregions);
> > +    DPRINT("Nregions: %u\n", memory->nregions);
> >      for (i = 0; i < dev->nregions; i++) {
> >          void *mmap_addr;
> >          VhostUserMemoryRegion *msg_region = &memory->regions[i];
> > @@ -1049,8 +1049,8 @@ vu_set_vring_num_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int num = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.num:   %d\n", num);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.num:   %u\n", num);
> >      dev->vq[index].vring.num = num;
> > 
> >      return false;
> > @@ -1105,8 +1105,8 @@ vu_set_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int num = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.num:   %d\n", num);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.num:   %u\n", num);
> >      dev->vq[index].shadow_avail_idx = dev->vq[index].last_avail_idx = num;
> > 
> >      return false;
> > @@ -1117,7 +1117,7 @@ vu_get_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
> >  {
> >      unsigned int index = vmsg->payload.state.index;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > +    DPRINT("State.index: %u\n", index);
> >      vmsg->payload.state.num = dev->vq[index].last_avail_idx;
> >      vmsg->size = sizeof(vmsg->payload.state);
> > 
> > @@ -1478,8 +1478,8 @@ vu_set_vring_enable_exec(VuDev *dev, VhostUserMsg *vmsg)
> >      unsigned int index = vmsg->payload.state.index;
> >      unsigned int enable = vmsg->payload.state.num;
> > 
> > -    DPRINT("State.index: %d\n", index);
> > -    DPRINT("State.enable:   %d\n", enable);
> > +    DPRINT("State.index: %u\n", index);
> > +    DPRINT("State.enable:   %u\n", enable);
> > 
> >      if (index >= dev->max_queues) {
> >          vu_panic(dev, "Invalid vring_enable index: %u", index);
> > @@ -1728,7 +1728,7 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
> >          return false;
> >      }
> > 
> > -    DPRINT("Got kick message: handler:%p idx:%d\n",
> > +    DPRINT("Got kick message: handler:%p idx:%u\n",
> >             dev->vq[index].handler, index);
> > 
> >      if (!dev->vq[index].started) {
> > @@ -1772,7 +1772,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
> >      DPRINT("Request: %s (%d)\n", vu_request_to_string(vmsg->request),
> >             vmsg->request);
> >      DPRINT("Flags:   0x%x\n", vmsg->flags);
> > -    DPRINT("Size:    %d\n", vmsg->size);
> > +    DPRINT("Size:    %u\n", vmsg->size);
> > 
> >      if (vmsg->fd_num) {
> >          int i;
> > 


