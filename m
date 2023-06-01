Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q4jQc-0001lC-1N
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2023 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4jQa-0001kp-61
 for qemu-trivial@nongnu.org; Thu, 01 Jun 2023 10:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4jQT-0001Yr-7N
 for qemu-trivial@nongnu.org; Thu, 01 Jun 2023 10:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685630235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjWPm8/seOc+I32CVwyLov08i9XEn5i9AkTXXoaVIZE=;
 b=URzETI+TemUSTNC0r2PRY8tSpPd/xKog3kVR5eLZTzG+7AmzsgPtkk988eHY14MRWr0Ne8
 jVxxJ0K8xxmZQydOEq43RUJh8c6Pm2yoTiXeRQ6bTwYmsQgcqpIV41E/JA5JgDIdCtvy3C
 fHjT2QEms0OWSXPwrkI6EyyYSOsiyQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-WbEJxr-0N-mk_200I9DR4Q-1; Thu, 01 Jun 2023 10:37:14 -0400
X-MC-Unique: WbEJxr-0N-mk_200I9DR4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f6f58e269eso5710525e9.1
 for <qemu-trivial@nongnu.org>; Thu, 01 Jun 2023 07:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685630232; x=1688222232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjWPm8/seOc+I32CVwyLov08i9XEn5i9AkTXXoaVIZE=;
 b=RgzDNMqw0wroNS2V9vbLLUYr58AnRxy4aaqpCnUwVOPEL74q4yynOL0Gp4D1Z9WVmp
 hCNU1cj1mk+auQXjTl0J10TZbjhTFAkLB8luK34X8UbDSRLtbQN+u7DxxCqYeI/Vzq8L
 2Fe3U7Oq5kviNP/CifxGOy51bDc97Le4kVHLhjDah2Av8l6jfwOBYtTvfOgkgVmIzWQn
 X0a0vK8GcxbbFoJ0IC4JLZPH4LkwcUaYoYWaD9EwDyxQ9K8W+RFG6iWTNHoRVKIRHO34
 yAD9gnkLBzKH3FvA7gEdediBoF/R2NucQPDhVVJ2jVGLUJ90/pgKLGr5bWfScHFDvoAV
 YzlQ==
X-Gm-Message-State: AC+VfDyt3PRuMkStxVRK/GCO5EOKGLvz9w2oScfWuf+FpPPk/RBsLYrD
 JFY1HPac7J7UzK0kczVLAyr2Jy/pY8GT5LU74ayKlkLryuMUvz+kog2AHUh6zUAcI5R0gJbtycx
 MCDQAuqiYT7i9XQDTDQ==
X-Received: by 2002:a7b:cd8a:0:b0:3f6:cfc7:8bd0 with SMTP id
 y10-20020a7bcd8a000000b003f6cfc78bd0mr2201299wmj.36.1685630231797; 
 Thu, 01 Jun 2023 07:37:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6q4xlhj+jTaKwFhPwN/rlLUXKLSFDPubdwE79j2dHd5EhWOcCkRfE4Svxn8XYWNRD/oGM8dQ==
X-Received: by 2002:a7b:cd8a:0:b0:3f6:cfc7:8bd0 with SMTP id
 y10-20020a7bcd8a000000b003f6cfc78bd0mr2201276wmj.36.1685630231361; 
 Thu, 01 Jun 2023 07:37:11 -0700 (PDT)
Received: from redhat.com ([2.55.41.2]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003f42328b5d9sm2558657wml.39.2023.06.01.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 07:37:10 -0700 (PDT)
Date: Thu, 1 Jun 2023 10:37:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] Trivial cleanups
Message-ID: <20230601103652-mutt-send-email-mst@kernel.org>
References: <20230523195608.125820-1-shentey@gmail.com>
 <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
 <20230601080655-mutt-send-email-mst@kernel.org>
 <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 01 Jun 2023 14:37:24 -0000

On Thu, Jun 01, 2023 at 01:45:47PM +0100, Mark Cave-Ayland wrote:
> On 01/06/2023 13:07, Michael S. Tsirkin wrote:
> 
> > On Thu, May 25, 2023 at 05:03:15PM +0100, Mark Cave-Ayland wrote:
> > > On 23/05/2023 20:56, Bernhard Beschow wrote:
> > > 
> > > > This series:
> > > > * Removes dead code from omap_uart and i82378
> > > > * Resolves redundant code in the i8254 timer devices
> > > > 
> > > > v3:
> > > > * Drop TYPE_ISA_PARALLEL since they became obsolete by
> > > >     https://lore.kernel.org/qemu-devel/20230522115014.1110840-9-thuth@redhat.com/
> > > 
> > > Oh I didn't see that this had already been merged :/
> > > 
> > > It's not a reason to block this series, but I'd still like to see your
> > > changes to ParallelState and ISAParallelState merged separately since they
> > > are a better match for our QOM coding standards.
> > > 
> > > > v2:
> > > > * Export ParallelState and ISAParallelState (Mark)
> > > > 
> > > > Testing done:
> > > > * `make check`
> > > > 
> > > > Bernhard Beschow (3):
> > > >     hw/timer/i8254_common: Share "iobase" property via base class
> > > >     hw/arm/omap: Remove unused omap_uart_attach()
> > > >     hw/isa/i82378: Remove unused "io" attribute
> > > > 
> > > >    include/hw/arm/omap.h   | 1 -
> > > >    hw/char/omap_uart.c     | 9 ---------
> > > >    hw/i386/kvm/i8254.c     | 1 -
> > > >    hw/isa/i82378.c         | 1 -
> > > >    hw/timer/i8254.c        | 6 ------
> > > >    hw/timer/i8254_common.c | 6 ++++++
> > > >    6 files changed, 6 insertions(+), 18 deletions(-)
> > > 
> > > Do we know who is going to pick up these series? I can send a PR if no-one minds?
> > > 
> > 
> > 
> > Go ahead:
> > 
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Thanks Michael! Is there any objection to also including
> https://patchew.org/QEMU/20230531211043.41724-1-shentey@gmail.com/ at the
> same time?

I don't know, I wasn't copied on that one.

> Bernhard: if you are able to submit a rebased version of the ISA_PARALLEL
> cleanups at
> https://patchew.org/QEMU/20230521123049.312349-1-shentey@gmail.com/ I think
> it is worth considering those for inclusion in the PR as well (note the
> comments re: an updated commit message and register definitions, but I can't
> really do this myself because of the missing SoB).
> 
> 
> ATB,
> 
> Mark.


