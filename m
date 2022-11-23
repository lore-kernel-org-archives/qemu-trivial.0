Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxjcf-0006NK-Vd
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2022 01:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjce-0006My-Kc
 for qemu-trivial@nongnu.org; Wed, 23 Nov 2022 01:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjcc-00055M-8H
 for qemu-trivial@nongnu.org; Wed, 23 Nov 2022 01:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669186355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBEMqOWrWZrRa5uxz3NTQ/ce9gnZt5df5XLXzQMPVbs=;
 b=Bn06pb2/c9v9XgLl7Ev7Z2YDutegUGBOAlUJc7GwyjwbywhcM8fgZses3uTCu8sO3KMWnW
 CFg6wCbH2m/QcVxo37ACdr1vTV/82l63oVtxROGEcAvfrV6gK97xIljM2gXrC9xY+3kQtm
 qtoaoOIbDV3d4wzdXr1SPhdD+a7FgQg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-kiQWQUK8MOiLvWILHm6SwA-1; Wed, 23 Nov 2022 01:52:34 -0500
X-MC-Unique: kiQWQUK8MOiLvWILHm6SwA-1
Received: by mail-wr1-f69.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so4663427wrg.16
 for <qemu-trivial@nongnu.org>; Tue, 22 Nov 2022 22:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBEMqOWrWZrRa5uxz3NTQ/ce9gnZt5df5XLXzQMPVbs=;
 b=5/a9GF8Z91FnlYZA7uLNhMo8QZahsizaZtzbcVCudF8H9K0ukD+O+71eS7HqM81eHY
 dzl5nSJQXcQNpxM8HZKKgE/Pif59ebzIAoSG/3Ur3zKKi7qpRrO0v5LWHJGt23qEOrgi
 +R1B65zJbJA42g6zaHbZsS189Yt+KnzDWhP/WLKfJ+2TRq1Z+/L/Z5j9ydRVFKm2+sMN
 ZYbFMu2yPzB0Ai8iVY+sDeDxBiI/qylmotOmvokaVH7rnJbu1W5Hh6c8qvxEMTmLWGoE
 veSzTKx9Jeq2YnIeO6Jch77faznHDvbYKyva5osaxR4hY4UG3b3yBR8KAR5hnT0FB86M
 3nNw==
X-Gm-Message-State: ANoB5pmdUmp9q+B6kVppx/dePWgUF3CaHFKmjn5LREUXt/Mb0Iqwr9a9
 8te7OJFBJk0AlADAOErzMUV4jrIP+u9ddtIakQYv3pWilDIS4B1dtkRUEhkMSIF+XJXufMTH/S0
 f1jKyVAArDAyQ7uSeyg==
X-Received: by 2002:a5d:4106:0:b0:241:e8d0:7de9 with SMTP id
 l6-20020a5d4106000000b00241e8d07de9mr2026631wrp.260.1669186353244; 
 Tue, 22 Nov 2022 22:52:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g5dattWWuEeNYjdwxwE+CHzOVDynMMcLVRZ8dFyo+v8VSDnswf0lY2rQoM2L7Ay7IsNiLPQ==
X-Received: by 2002:a5d:4106:0:b0:241:e8d0:7de9 with SMTP id
 l6-20020a5d4106000000b00241e8d07de9mr2026620wrp.260.1669186352995; 
 Tue, 22 Nov 2022 22:52:32 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b003cf894c05e4sm1180233wmq.22.2022.11.22.22.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 22:52:32 -0800 (PST)
Date: Wed, 23 Nov 2022 01:52:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-7.2 v2 3/4] libvhost-user: Fix two more format strings
Message-ID: <20221123015218-mutt-send-email-mst@kernel.org>
References: <20221105102448.436469-1-sw@weilnetz.de>
 <20221105102448.436469-4-sw@weilnetz.de>
 <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
 <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
 <06a55dd7-4d98-8c6c-c9aa-b1f4222829d8@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <06a55dd7-4d98-8c6c-c9aa-b1f4222829d8@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
X-List-Received-Date: Wed, 23 Nov 2022 06:52:40 -0000

On Wed, Nov 23, 2022 at 07:49:53AM +0100, Stefan Weil wrote:
> Am 23.11.22 um 07:35 schrieb Stefan Weil:
> > Am 15.11.22 um 08:25 schrieb Stefan Weil:
> > > Am 05.11.22 um 11:24 schrieb Stefan Weil:
> > > 
> > > > This fix is required for 32 bit host. The bug was detected by CI
> > > > for arm-linux, but is also relevant for i386-linux.
> > > > 
> > > > Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
> > > > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > > > ---
> > > >   subprojects/libvhost-user/libvhost-user.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/subprojects/libvhost-user/libvhost-user.c
> > > > b/subprojects/libvhost-user/libvhost-user.c
> > > > index d67953a1c3..80f9952e71 100644
> > > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > > @@ -651,7 +651,8 @@ generate_faults(VuDev *dev) {
> > > >           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
> > > >               vu_panic(dev, "%s: Failed to userfault region %d "
> > > > -                          "@%" PRIx64 " + size:%zx offset: %zx:
> > > > (ufd=%d)%s\n",
> > > > +                          "@%" PRIx64 " + size:%" PRIx64 "
> > > > offset: %" PRIx64
> > > > +                          ": (ufd=%d)%s\n",
> > > >                        __func__, i,
> > > >                        dev_region->mmap_addr,
> > > >                        dev_region->size, dev_region->mmap_offset,
> > > 
> > > 
> > > There is still no review for this patch.
> > > 
> > > I added "for-7.2" to the subject here in my answer. How can we get
> > > all 4 patches of this series into the new release?
> > > 
> > > Stefan
> > 
> > Ping? Those bug fixes are still missing in -rc2.
> > 
> > Stefan
> 
> Hello Michael,
> 
> I just noticed that MAINTAINERS has no entry for the files in
> subprojects/libvhost-user, so I did not cc you in my previous e-mails.
> Should that directory be added to the "vhost" section"?
> 
> Stefan

pls do


