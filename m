Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYdnx-000645-Ed
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2024 23:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sYdnu-0005wM-FL
 for qemu-trivial@nongnu.org; Mon, 29 Jul 2024 23:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1sYdnr-0005L2-T5
 for qemu-trivial@nongnu.org; Mon, 29 Jul 2024 23:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722311135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXJNjky8EefqMLiwUpRfOObSGdedE0BP/ZPWloO0qjA=;
 b=aw8Q248reBjVY5uCoe3H5e1fTBvcGPei2KaF0bunHENTfZEY9iOZEHzEl4Fo2ms9mNDjAB
 1Tr3zHuKd6HS7eloolD8rRzwdqEoMbD1MLrtvr8Igfcccb/Ut2Tv981762S7Cro+lAh2lS
 HBTJFVNlMIpg+viz2Qct1Swx7X/0LlI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-89_UZmjLPLiLpD8Aqxut-Q-1; Mon, 29 Jul 2024 23:45:33 -0400
X-MC-Unique: 89_UZmjLPLiLpD8Aqxut-Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2cb5847ff53so5229746a91.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Jul 2024 20:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722311132; x=1722915932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXJNjky8EefqMLiwUpRfOObSGdedE0BP/ZPWloO0qjA=;
 b=ZdpdXCxkz9EHwS53zfHXxUHzaTGE5Uddch68Ga3op//uX4Fqq/CpC5zoAzIBUqdH44
 LMmRpx3BKzG7zumqtcbyucim2vf2dwC5yDRCAwZudwxq03x+KADLil9yQbafrOhRsiPy
 T1rnonjwduMO3ibvabQbFTygl7f4A3fYkk+ekXqlKuqgpSsvq7aWMCe+BW9KlyfGYORQ
 6ky4CtKQQvNZDlb4zXENec0m2D/q2OCtigVIsfbjBd/l7Ete8K7NRTXieu22B4NBV0bn
 vBfumK8Ja/rBU8zABtulx4LNshfZrBGG9WnK+eC6byqG7SA87CkYTcM+ZRuHTXOi1eGi
 F0VQ==
X-Gm-Message-State: AOJu0YwBEZXTB2ih9365U4j1rO6qi6RAC5GWAev3UoK9tKBnjxkZ40Y+
 qnh/o18UAUhMNgtgDLpZnRH5tWRLr+jFve2BcFAmcW1Jr2R5hw5W06VSaqhsKRGvDOvP2zELxLY
 0RmHhlgWFrLILmySmxU8be0GL6mDi340OrynnOrbWkefBLAYHUQnfJ/JagIPTp/BwtDy9O0M8bn
 67U4sergnDi5LY4dYPn9z6n78pNH/fqkXJzRFBezAA
X-Received: by 2002:a17:90a:1c17:b0:2cb:5678:7a1c with SMTP id
 98e67ed59e1d1-2cf7e1e1e69mr11933277a91.18.1722311131983; 
 Mon, 29 Jul 2024 20:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGd6vw/rBrRerbfBAm+yBhRqY7rgAK5UBbOS+OQx23lyHGKA9xXIMF5+7Yitk+KRhqgZvJWmCozOiEe2YCnp8=
X-Received: by 2002:a17:90a:1c17:b0:2cb:5678:7a1c with SMTP id
 98e67ed59e1d1-2cf7e1e1e69mr11933257a91.18.1722311131530; Mon, 29 Jul 2024
 20:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240708092630.2596945-1-zhao1.liu@intel.com>
 <ZpdlQDIjGp4wR8aR@intel.com>
 <CACGkMEsGyKb932T_AJ63sWFObYSJRvghTYywvbDT0BpVV-c9Vw@mail.gmail.com>
 <Zqhhv3lnyMfxLCvV@intel.com>
In-Reply-To: <Zqhhv3lnyMfxLCvV@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 30 Jul 2024 11:45:20 +0800
Message-ID: <CACGkMEvSYA1bJu6bV55MauYNHhpcyTjP6DjM5ruNf87rY4FHcg@mail.gmail.com>
Subject: Re: [PATCH] doc/net/l2tpv3: Update boolean fields' description to
 avoid short-form use
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 30 Jul 2024 03:45:38 -0000

On Tue, Jul 30, 2024 at 11:29=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
>
> On Tue, Jul 30, 2024 at 10:54:07AM +0800, Jason Wang wrote:
> > Date: Tue, 30 Jul 2024 10:54:07 +0800
> > From: Jason Wang <jasowang@redhat.com>
> > Subject: Re: [PATCH] doc/net/l2tpv3: Update boolean fields' description=
 to
> >  avoid short-form use
> >
> > On Wed, Jul 17, 2024 at 2:15=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> =
wrote:
> > >
> > > Hi Jason,
> > >
> > > Just a kind ping. Does this update satisfy you?
> > > Since the original example generates the warning.
> > >
> > > Thanks,
> > > Zhao
> >
> > Queued.
> >
> > Thanks
> >
>
> Hi Jason, thank you! I noticed Michael has already helped me merge this
> (commit cb8de74ac6df "doc/net/l2tpv3: Update boolean fields' description
> to avoid short-form use").

Great, so I dropped it.

Thanks

>
> Best Regards,
> Zhao
>


