Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmNgQ-0003Yx-E7
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 17:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmNgN-0003Qc-RE
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 17:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmNgK-0002cN-6r
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 17:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622151401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjyMKTLlH88qyw3COXy0Mm8PeLWbkH37xlEzfJ+HQLQ=;
 b=NPXk9kksuyfV8CN9VDaQWbo6TW3p9j5mDvus9l0Yl94V5asB09VooB1esAkXAn/1atlI+8
 A6UeJtmlPzfOIK5qqwAx0F7CDwFjmbvW2l+/kXTj1M5fw4Moyvu5OG7OeyjOozqg4Q6Uqy
 9Vs+MiZCxYD9RGn5TlHBSEA1DGXrKZk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-dAx0umEANVK0fMzeYSjLcQ-1; Thu, 27 May 2021 17:36:39 -0400
X-MC-Unique: dAx0umEANVK0fMzeYSjLcQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qh7-20020a170906eca7b02903e635498f8aso570828ejb.9
 for <qemu-trivial@nongnu.org>; Thu, 27 May 2021 14:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjyMKTLlH88qyw3COXy0Mm8PeLWbkH37xlEzfJ+HQLQ=;
 b=BG+ez+3gv4Ht1aklYLlqxwe1LTFQlhfPGquuCnWvObNeUXn2euwPIzVS50mFHdDcih
 5mM85+/v+OyEsZCCbluFTqk1kYatqRFIsahQLwICeQmnqdwXWzdn1OlgYMsbhURgN6FY
 21XOlGPWm+R7LCzSYU1VjejN3+pAD4u+iXZDadUjHbedDNBUU2sRxFi9PQuDpqcf85uP
 IAPoNG4UhUvhXRi1Pxn1IEsBsyplhV150kviKHWgJttooxNOJjbB0HP8iJkvsFKOHexn
 XwVXDliuvFTehSMvuMCu9E0KFSg+6mIgty2/jyb93nQ0hezsB4nJdrcet4pyE3NQI5lp
 FKbg==
X-Gm-Message-State: AOAM5322IjsK3jJd5FtmcRCV2QzyslULxipd3sF5CElXJ00n32/i51yJ
 uyzWn1y54WdsUg5egM/CcePpYp1dUodh8ThNKzXbiQM4EP4+mpAa2eHDOROuNPBI4ZtZICEAPYs
 oPHsklO3+dy6pMwWPlmGmTAqcnUJ0SaFc4g==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr6265671edr.144.1622151398570; 
 Thu, 27 May 2021 14:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAEc76t0WtsBEI+PHv2BIS5VsXow1/p6n1DXrbLqIAaXsQnFgGaxlcYnGbQBOEU2HfQBYOMKoWcjTWQabuUro=
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr6265650edr.144.1622151398301; 
 Thu, 27 May 2021 14:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210430134830.254741-1-ckuehl@redhat.com>
 <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
In-Reply-To: <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 27 May 2021 23:36:26 +0200
Message-ID: <CAP+75-WxB3aKHC51gEF+vR0T9iEvkfC7mwJk+GdJEp8HpqhqYw@mail.gmail.com>
Subject: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 27 May 2021 21:36:48 -0000

ping^3...

On Tue, May 11, 2021 at 9:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cc'ing qemu-trivial@
>
> On 4/30/21 3:48 PM, Connor Kuehl wrote:
> > Connor Kuehl (2):
> >   sev: use explicit indices for mapping firmware error codes to strings
> >   sev: add missing firmware error conditions
> >
> >  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
> >  1 file changed, 25 insertions(+), 23 deletions(-)
> >
>


