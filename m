Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osKNA-0005ap-4V
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2022 03:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKN5-0005aK-03
 for qemu-trivial@nongnu.org; Tue, 08 Nov 2022 03:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKN3-0004n1-JS
 for qemu-trivial@nongnu.org; Tue, 08 Nov 2022 03:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667897652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ewUlNdGcfZW60UY5SA4vb9ylWXeeb9MQjl4DijEkN8=;
 b=Y6DGfci0hmLA/qZ2lQwl7npWYcqnoq2BYpZPTGQdEedYZaG1YHV2haidzY0jxSTfKJmqdL
 vyKmEa+Hbf7XuhUUDodTpu/QmHdfsMNE9x4ZOQCrNLBLQRijbkYArlwUKlLWNMJipIkEyT
 rtIVTVzEyHWBqM0MaQ4lTlCSQqisbpQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216--Bp8kiphNzCAmRa7kf70Ug-1; Tue, 08 Nov 2022 03:54:11 -0500
X-MC-Unique: -Bp8kiphNzCAmRa7kf70Ug-1
Received: by mail-qt1-f200.google.com with SMTP id
 ew11-20020a05622a514b00b003a524196d31so9778437qtb.2
 for <qemu-trivial@nongnu.org>; Tue, 08 Nov 2022 00:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ewUlNdGcfZW60UY5SA4vb9ylWXeeb9MQjl4DijEkN8=;
 b=H3JgRD7ipxCYIV/W534X0q8BwOIcxNtOcAhkHQGsaK3iwkaGR4DdPS9mr3o/V/QrLS
 7JKAB25JBpvro9SK+v0J60F8lvb1Az2jJcLHXuQYoe39SeLwg0C74fGgXShzZoxQ87Uj
 hPreMh6jXLWwnpFbibNWVG1N/nCZT8aqGAd03K31HAdPRZBXN4AMNl7BaYhLo/VUUbFO
 MNrcr+RR/nqHwCgbbmv7+vLNUJ1GkpFE1IrwTlMrkdsgncKn4WniBmUPHbQcyJno46Tz
 qu8aKEHAtgFLHqE3VjA62ALBrQ2iQ/i9kgYBgbmAvnDfkqN7WrqYyAloFPNwc9H/aaVo
 hdRQ==
X-Gm-Message-State: ACrzQf183NS2dCrPBgy4Wxn97qpC80b6GO7D+ooM1FXDHqKssqGq3Lgn
 fN5H6SxaoWocIFK/nsDMWmAFVXqqZVIgoxK1gmcs1L+CKLOEBY9BLGiqDryzrP+jOKHpRJT/9pd
 fRSNJZCwFe2jpFea3Cw==
X-Received: by 2002:a05:620a:916:b0:6fa:2149:c535 with SMTP id
 v22-20020a05620a091600b006fa2149c535mr35550113qkv.413.1667897650745; 
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM68bNdFA5hamgqrmGaIin1zDvq4vRkXdX9lQFT3zVShCSeKrgRBP/OujzDuExjXVGoS76juqA==
X-Received: by 2002:a05:620a:916:b0:6fa:2149:c535 with SMTP id
 v22-20020a05620a091600b006fa2149c535mr35550107qkv.413.1667897650485; 
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 l2-20020ac80782000000b00343057845f7sm7653275qth.20.2022.11.08.00.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
Date: Tue, 8 Nov 2022 03:54:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jianchunfu <jianchunfu@cmss.chinamobile.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] libvhost-user: Handling potential memory allocation
 failures
Message-ID: <20221108033133-mutt-send-email-mst@kernel.org>
References: <20221108080141.5756-1-jianchunfu@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <20221108080141.5756-1-jianchunfu@cmss.chinamobile.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-List-Received-Date: Tue, 08 Nov 2022 08:54:19 -0000

On Tue, Nov 08, 2022 at 04:01:41PM +0800, jianchunfu wrote:
> Add malloc check of virtqueue element in libvhost-user.
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 47d2efc60f..901cd7a2c0 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -2551,6 +2551,10 @@ virtqueue_alloc_element(size_t sz,
>  
>      assert(sz >= sizeof(VuVirtqElement));
>      elem = malloc(out_sg_end);
> +    if (!elem) {
> +        DPRINT("%s: failed to malloc virtqelement\n", __func__);
> +        exit(0);
> +    }

exit is certainly not the right way to handle such errors.


>      elem->out_num = out_num;
>      elem->in_num = in_num;
>      elem->in_sg = (void *)elem + in_sg_ofs;
> -- 
> 2.18.4
> 
> 


