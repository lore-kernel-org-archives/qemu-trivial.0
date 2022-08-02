Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIrfb-000291-CJ
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2022 09:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrfA-00024J-QR
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 09:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIrf6-00075h-Dn
 for qemu-trivial@nongnu.org; Tue, 02 Aug 2022 09:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659445812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhZtIgUyaiXv9bi4AZmiWjodQ77c+dgh88Ul/MHjT2M=;
 b=BrUbS/RDczAtApjoFV3Db1s3UN1iH4+Q6b8T1HXhzGmGDR2ddDjfPoOM4zPbNopHRbuXX2
 fnYDm8Fs7io/H1PENnTnrZRxuyh/Ca6bOKjQHDj5CwwOl5q9otGiScPc+7jkJiDQML8c54
 24qqL7kZxaqiFZWbZ2hhI84uqXYwbQY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-6d93jMU4OgG1sTthvaCmrw-1; Tue, 02 Aug 2022 09:10:05 -0400
X-MC-Unique: 6d93jMU4OgG1sTthvaCmrw-1
Received: by mail-ej1-f71.google.com with SMTP id
 sg42-20020a170907a42a00b0072e3fc6cdd1so4134000ejc.13
 for <qemu-trivial@nongnu.org>; Tue, 02 Aug 2022 06:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=YhZtIgUyaiXv9bi4AZmiWjodQ77c+dgh88Ul/MHjT2M=;
 b=kMWxRO358Ize+UXrOAmWaenYHPfkrYF10zLIXpHy8412pgft1asHUbncQCQm6Yzib3
 YS0wiNMd9GZK0GUUtPytWWuHen0J1q6j68Yy3pcLyDRZSyWxGbdk2RgpVOrtxs/hhs1L
 EUB4JGrs738/UYD76eUW1Fv2IbvZXL/bxChfUmazDd6QSal08Sa/wvMWJntXhlF2KtHp
 MGyHKLHdlDF74ELBQtT/SAVZZjhWCA/zxHLEjB6rYeNKdMJZRjQrbNGvXjwK6Q0e0faX
 zGr6RHu10DdtnWBnujdM9n3rXOQAsz1idNPgNObFfHFBhQsg6VS9tGBBN16dsT2ZIa8s
 wijQ==
X-Gm-Message-State: AJIora/llPLfCq50m4xBnw6aS0qz9fbAwl7Ut24w+rR50DidXx1zEMPO
 UYwPsw4Er3hHg7idKYvML6mT3G7ychS7vHs5rF8oLgU3eGoMHfPuv+51ckf637CYfZITDJmrTZ6
 rQGE77bIkja7C1V72fw==
X-Received: by 2002:a17:907:2889:b0:72b:50c8:c703 with SMTP id
 em9-20020a170907288900b0072b50c8c703mr15568321ejc.694.1659445803670; 
 Tue, 02 Aug 2022 06:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4fstQGB9xXQRD06A+SC97QR/cfqyuU7ATkDf4f26/Iizbx4u5fXgWrKY/Fv94qt3bVM2HCA==
X-Received: by 2002:a17:907:2889:b0:72b:50c8:c703 with SMTP id
 em9-20020a170907288900b0072b50c8c703mr15568295ejc.694.1659445803356; 
 Tue, 02 Aug 2022 06:10:03 -0700 (PDT)
Received: from redhat.com ([2.52.130.0]) by smtp.gmail.com with ESMTPSA id
 r18-20020a17090609d200b0072abb95c9f4sm6224694eje.193.2022.08.02.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:10:02 -0700 (PDT)
Date: Tue, 2 Aug 2022 09:09:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Message-ID: <20220802090938-mutt-send-email-mst@kernel.org>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
 <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
 <20220802085655-mutt-send-email-mst@kernel.org>
 <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 02 Aug 2022 13:10:22 -0000
X-List-Received-Date: Tue, 02 Aug 2022 13:10:22 -0000

On Tue, Aug 02, 2022 at 02:58:36PM +0200, Laurent Vivier wrote:
> On 02/08/2022 14:57, Michael S. Tsirkin wrote:
> > On Tue, Aug 02, 2022 at 02:10:43PM +0200, Laurent Vivier wrote:
> > > On 02/08/2022 13:24, Eugenio Pérez wrote:
> > > > Few steps allocate new resources, and all of the allocated can be
> > > > checked to avoid trying to free an invalid one.
> > > > 
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > 
> > 
> > qemu-trivial too I guess then?
> 
> For 7.1 or later?
> 
> Thanks,
> Laurent

I don't really care. Since you are merging this you get to decide.

> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > > > ---
> > > >    net/vhost-vdpa.c | 6 ++----
> > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 303447a68e..ac1810723c 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >        queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
> > > >                                                     &has_cvq, errp);
> > > >        if (queue_pairs < 0) {
> > > > -        qemu_close(vdpa_device_fd);
> > > > -        return queue_pairs;
> > > > +        goto err;
> > > >        }
> > > >        if (opts->x_svq) {
> > > > @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >            if (invalid_dev_features) {
> > > >                error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
> > > >                           invalid_dev_features);
> > > > -            goto err_svq;
> > > > +            goto err;
> > > >            }
> > > >            vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > > @@ -640,7 +639,6 @@ err:
> > > >            }
> > > >        }
> > > > -err_svq:
> > > >        qemu_close(vdpa_device_fd);
> > > >        return -1;
> > > 
> > > Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> > 


