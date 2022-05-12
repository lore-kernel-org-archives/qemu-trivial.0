Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npBI3-0002nW-NL
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2022 12:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBI2-0002jY-2U
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 12:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBI0-0008J0-DS
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 12:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652371423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyYH+MV/bDDU4hvPkHGyhuVApNBPS5r2zvsUOrUMsKQ=;
 b=dSVY/n68j5CO8Sa0Chzupamj52u/WMml6hH/WdbH09TQ78yF3lyxWtnmGdOkK1AYpuRASm
 Fs4OFidCu47yh6rHn5lLsjdUy0iK3nTmYv8Qu43IDCZozA7iNllYPO6x0WMgml8h+wuKry
 IRW/FO3m+cTdPPResUQr5tTARM+8MjU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-XoJvSH9gNpCleVs-0VdgOg-1; Thu, 12 May 2022 12:03:34 -0400
X-MC-Unique: XoJvSH9gNpCleVs-0VdgOg-1
Received: by mail-il1-f197.google.com with SMTP id
 q6-20020a056e0215c600b002c2c4091914so3518172ilu.14
 for <qemu-trivial@nongnu.org>; Thu, 12 May 2022 09:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uyYH+MV/bDDU4hvPkHGyhuVApNBPS5r2zvsUOrUMsKQ=;
 b=BGHEUhwzezRDEusNKoOcKzyDvggH00VKLI4z9K8PDFr3bZlcCrzuI738j6Cva0crdv
 ql0yIrDNFr+EgmE51H7HLqBn+tEhfpQMJ3DKxVnTVTEKcwIhO4IuEaNH6PJvkImUdXu9
 LOn7aPSBs7Bs0boBeWkR62GOKTIdBJw9gekSjh1Ni3qc5mw9PB4QJnK9zjDjFShmxu+r
 VrFjB83817/9yhdi+w7+TNElu8uBibc61d/psAQ5BWgLKjsJ75znp+Pc5KWwiCqkEcze
 O4j8vxQ6eCQ/1l2E00ptOkbFUL8HojuJEeGR/1kUsKFMACViy3g8l1TDRLe9WP3s9MqH
 03bQ==
X-Gm-Message-State: AOAM532C4Cpa8HWpRcfwNRKLLpnY0gzFj+7LxEf2fuL+osyKt2qczV/8
 fPvhTPRBhK8OlZ3FNsi4RN88sKBYaHamBiRGoN++qol7sRXmGA/QOXVOLHHIDgFh/KOxUddv80C
 ulmAkpAjdYhXPoRMA9w==
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr364480iom.80.1652371409322; 
 Thu, 12 May 2022 09:03:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLmdC9m46GmOqmEocB50WnbzVjg9royiWaZHOe5iLgpw652NL4xCwMkI23oLUzn1y/yzWocg==
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr364468iom.80.1652371409112; 
 Thu, 12 May 2022 09:03:29 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056e020b2600b002cde6e352c7sm1479832ilu.17.2022.05.12.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:03:28 -0700 (PDT)
Date: Thu, 12 May 2022 12:03:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] util: Return void on iova_tree_remove
Message-ID: <Yn0vz+6nYs0d/Hvj@xz-m1.local>
References: <20220427154931.3166388-1-eperezma@redhat.com>
 <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
X-List-Received-Date: Thu, 12 May 2022 16:03:46 -0000

On Thu, May 12, 2022 at 05:48:47PM +0200, Eugenio Perez Martin wrote:
> On Wed, Apr 27, 2022 at 5:50 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > It always returns IOVA_OK so nobody uses it.
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> 
> Hi! Friendly ping about this, is it something pending from my side?

Don't think so. :)

This patch does look fine to go via trivial branch, Laurent?

Also copying Michael since for other iova-tree change it always go via
Michael before.

Thanks,

-- 
Peter Xu


