Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKFsy-00075P-A3
	for mharc-qemu-trivial@gnu.org; Wed, 16 Feb 2022 03:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFsv-00071Q-JB
 for qemu-trivial@nongnu.org; Wed, 16 Feb 2022 03:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFsq-0000cF-Lz
 for qemu-trivial@nongnu.org; Wed, 16 Feb 2022 03:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645000916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Gz/PwqWj9RckiXEaGHWL+SwMi/CIWG9m1MHya/41AI=;
 b=gqAtD/j+Kwv8kfvm3WoCs9oF2aZ9wjFzpxt7hxPQFgmghtHrs34JOeVGXmtj0z10GOEgF/
 tdi8yf0jWFc4UOrNaj9hwsCgjYEwhoM9f2pC1ycstc1FruYKtkFlNFOzMwtWDaKyiWqWhf
 RPN/IiFiBddVcyrrdgNxImcIiZ0+02A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-Yzo1mwQ6MdKOPsAf1Pw0fw-1; Wed, 16 Feb 2022 03:41:55 -0500
X-MC-Unique: Yzo1mwQ6MdKOPsAf1Pw0fw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y1-20020ac87041000000b002c3db9c25f8so1057914qtm.5
 for <qemu-trivial@nongnu.org>; Wed, 16 Feb 2022 00:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5Gz/PwqWj9RckiXEaGHWL+SwMi/CIWG9m1MHya/41AI=;
 b=utKziIFcig/s08radtbwVfX/74RsSoAbE1r2wBwig1GkoBPDokqDMpFyO4C5ptztxB
 MC+4lRTbJD6wYH82sSvGNJlBv2avZS150u4iSzuRVdCVoiT+uDExCZYPanduyqM+k8e1
 ndfgFw4kmmYUQg6YWszoX6opEyOluFQVAgdDiSE1lCuJ0ZjO3lCSnII8FP7CNszrlNHr
 dNyt3mFsm1QtBTeN8e8f4t1G4nfXZNW8494MUarc5rZPvirB3Egg/6N42YWbCbMDCKgZ
 fns+psELdoNIAjVuQRy2zhsQjE0yruAf7R0qJ2vxvAIfEvl0jjfRN9Qtr8Y5VD+2f1G8
 vEsQ==
X-Gm-Message-State: AOAM530vUHK89kdjpFZBIOR/Njj4I+rcj0xepsD29rP/tYgeFUNumdgU
 1GDAZOriBPIqr6P1nqNHCNmB8PymBYOOox1F7YfIY5XJzwrCwd/kFapBKy5y5RH9bALGo2ydTih
 KA9gI/3Zh2WeHbWRrwg==
X-Received: by 2002:ac8:7f88:0:b0:2cc:a868:bdb0 with SMTP id
 z8-20020ac87f88000000b002cca868bdb0mr1172654qtj.591.1645000914291; 
 Wed, 16 Feb 2022 00:41:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVlL/PLVVcBa1YZU6jrLCD1muqbK36Sppe++7QF27tmA11dXZ9QCZ2n1dRqYP5DNOGX7rmEQ==
X-Received: by 2002:ac8:7f88:0:b0:2cc:a868:bdb0 with SMTP id
 z8-20020ac87f88000000b002cca868bdb0mr1172648qtj.591.1645000914074; 
 Wed, 16 Feb 2022 00:41:54 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id h23sm1204702qto.36.2022.02.16.00.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 00:41:53 -0800 (PST)
Date: Wed, 16 Feb 2022 09:41:49 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/1] vdpa: Make ncs autofree
Message-ID: <20220216084149.c7clj3nhlsxposp6@sgarzare-redhat>
References: <20220214193415.1606752-1-eperezma@redhat.com>
 <20220214193415.1606752-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220214193415.1606752-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 08:42:02 -0000

On Mon, Feb 14, 2022 at 08:34:15PM +0100, Eugenio Pérez wrote:
>Simplifying memory management.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> net/vhost-vdpa.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 4125d13118..4befba5cc7 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> {
>     const NetdevVhostVDPAOptions *opts;
>     int vdpa_device_fd;
>-    NetClientState **ncs, *nc;
>+    g_autofree NetClientState **ncs = NULL;
>+    NetClientState *nc;
>     int queue_pairs, i, has_cvq = 0;
>
>     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>@@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>             goto err;
>     }
>
>-    g_free(ncs);
>     return 0;
>
> err:
>@@ -310,7 +310,6 @@ err:
>         qemu_del_net_client(ncs[0]);
>     }
>     qemu_close(vdpa_device_fd);
>-    g_free(ncs);
>
>     return -1;
> }
>-- 
>2.27.0
>
>


