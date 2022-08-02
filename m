Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIrSb-0004DT-E1
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2022 08:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrSY-0004Bu-Lk
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrSX-0008JA-C0
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 08:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659445036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEZzLE+ScArYj3dRBjh8bZaaZ5/oz7fgOC2UFuWm9iQ=;
 b=DipYCxq1fOcMVTz1USZwWiom9aSLTCHWVF8dhtfOf8TnuubjQqWDGGW8ug8FpU6ruMxFU5
 vmVxOi2srfjBINWouDvTCSmGBQD+1Oi9P8AlkTOpFEa/7V9dri4pprS/LW5QknXPkMAlig
 hM7q/iYZR7bCzR4pIfLu5L04xUACAvU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-mGDNHsZ-MZ6GPO8Rcg1lEA-1; Tue, 02 Aug 2022 08:57:15 -0400
X-MC-Unique: mGDNHsZ-MZ6GPO8Rcg1lEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 q19-20020a7bce93000000b003a3264f3de9so1980274wmj.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Aug 2022 05:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=AEZzLE+ScArYj3dRBjh8bZaaZ5/oz7fgOC2UFuWm9iQ=;
 b=IxnoLbgt4+twLnOGymH1bk8x9agoNvvRO015qvS5V1v2RdukrXZnQDdr/TJNtUTYTc
 me0HFUFPULJ0/ZvOMLpNQFnZP/8wXj7232C7Z33mbV0+PSe4BK9DqWFcg9yOKrJV3+CW
 UuC17YUxfemcsmn0ZQshSyYkHVS+DBRWeEO80QQ32Vn0GjTYxiF9EyZ2t+gOly8NsaGl
 rr1+PW/C4pq3g12k5vyQG768jBqb62H3u8zw76O7rDIBKrI0NM6jVGkQhFU57k2Ct0Qf
 p56lsHJTns+AANmhMHR6tX6b2mBm9lNrSKccVqGnkIWrBCT0/ix/k+2AhZAbVZLQ4dy9
 /4iA==
X-Gm-Message-State: ACgBeo2iwt2cJGU6yCkRICwIfx7puKRaf0EZjYpmKuRwBu/N0CWFC+KZ
 VmJbN4uB3aHLcDpPG1odJnJ/ZJVYkPW/L8Omt6d0kKTWAlbcHTu1vNyNHYrD4O2LDiRkYNDeESp
 1dM9+Z13HSLtUjiPNOw==
X-Received: by 2002:a05:600c:4106:b0:3a4:ec9a:3a50 with SMTP id
 j6-20020a05600c410600b003a4ec9a3a50mr1623871wmi.19.1659445033979; 
 Tue, 02 Aug 2022 05:57:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR42reWp7+lpO10NIeO+dlqmBugSaMWQHVpA4pTwkmiK6ndw7nhZMTMJaWIF1LhTXtrVXmpTTg==
X-Received: by 2002:a05:600c:4106:b0:3a4:ec9a:3a50 with SMTP id
 j6-20020a05600c410600b003a4ec9a3a50mr1623859wmi.19.1659445033754; 
 Tue, 02 Aug 2022 05:57:13 -0700 (PDT)
Received: from redhat.com ([2.52.130.0]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003a31673515bsm26371182wmq.7.2022.08.02.05.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 05:57:13 -0700 (PDT)
Date: Tue, 2 Aug 2022 08:57:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Message-ID: <20220802085655-mutt-send-email-mst@kernel.org>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
 <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Aug 2022 12:57:19 -0000

On Tue, Aug 02, 2022 at 02:10:43PM +0200, Laurent Vivier wrote:
> On 02/08/2022 13:24, Eugenio Pérez wrote:
> > Few steps allocate new resources, and all of the allocated can be
> > checked to avoid trying to free an invalid one.
> > 
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


qemu-trivial too I guess then?

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> > ---
> >   net/vhost-vdpa.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 303447a68e..ac1810723c 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
> >                                                    &has_cvq, errp);
> >       if (queue_pairs < 0) {
> > -        qemu_close(vdpa_device_fd);
> > -        return queue_pairs;
> > +        goto err;
> >       }
> >       if (opts->x_svq) {
> > @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >           if (invalid_dev_features) {
> >               error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
> >                          invalid_dev_features);
> > -            goto err_svq;
> > +            goto err;
> >           }
> >           vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > @@ -640,7 +639,6 @@ err:
> >           }
> >       }
> > -err_svq:
> >       qemu_close(vdpa_device_fd);
> >       return -1;
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>


