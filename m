Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkThT-0002VW-S8
	for mharc-qemu-trivial@gnu.org; Wed, 02 Dec 2020 10:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kkThS-0002TP-Ja
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 10:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kkThO-0000kE-CB
 for qemu-trivial@nongnu.org; Wed, 02 Dec 2020 10:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606921540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37HR1rPOCsaZprDQ6kpD5DvqKCgj2XPvjksXb07SkCo=;
 b=iUrPMdFqiRnW4LGqGdo5QTU/gMFXifkU4xZ3qayxCrsEEwGJpFO1O9n3cLqmiYLy/8Gqe6
 UcFyKCgT+A0HSLAz7QjzqHMdvb7jWOA8cR8wvucucs+R1+JLuVc8QPGe4v80S4/k7DuVH6
 Nz5MSFzKWLpoIyBxJNfVmBVitZZcFww=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-hqVepdf0MY-vS7KC9tDWxw-1; Wed, 02 Dec 2020 10:05:38 -0500
X-MC-Unique: hqVepdf0MY-vS7KC9tDWxw-1
Received: by mail-ot1-f70.google.com with SMTP id y4so1056519ota.16
 for <qemu-trivial@nongnu.org>; Wed, 02 Dec 2020 07:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=37HR1rPOCsaZprDQ6kpD5DvqKCgj2XPvjksXb07SkCo=;
 b=GVoLuXOKVDA60u0Q+QQVQMRXhzuMSSB+8d9Rds3z5encNbrWI6nTMc+MptpgT3z6JV
 laFVCq/6Em7KTR8NVUKq8xYYlT8sKfTQ3RSTuOMyHJtTnzxkWPrG3QgaDRiICoIF8LRR
 P+I5TU0JnMm0kZXqKQ16QfvCGpZA5FCLx4hATtvlzK/AI0EsoKmcLLAszzE04e9P/ifl
 OfzHe31M26Dq3Pu8SeWMGxtkc4pCt0XIlLUHUaflT9/JkYXei1xjpIJ2A/uOoEm/YtAg
 Kr3PT51JHt1E/U5WB+FKQQxZybSZHW/aN/8zA8317EUUOwBFBYzrZyAWfZ1pE5hUpsVE
 JuWA==
X-Gm-Message-State: AOAM5304UDn1I3UISaLLWT9SjFw5n2M4YgXbSLk2p1FSJ93eN1jpcc2u
 yM6B9fJ31u/TydVLFxAHTN6pANlRJiZZBQ/HNrSALqKPcPH5jUi+6S1b6zLXVpgk7OoBR2EFV6K
 QGeGPNlz/rMDNYk4h7VnBj2z9JT0p4ikfjQ==
X-Received: by 2002:a05:6830:1002:: with SMTP id
 a2mr2115358otp.316.1606921538174; 
 Wed, 02 Dec 2020 07:05:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaceapKJNMui+xRoV8p7s2QKTeVoydWGaEu3tlATelw+UAeRp2fVDftSZYCZbh/FMvfJ+wqm2TC0E5po+IPz4=
X-Received: by 2002:a05:6830:1002:: with SMTP id
 a2mr2115340otp.316.1606921537988; 
 Wed, 02 Dec 2020 07:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20201202132038.1276404-1-philmd@redhat.com>
In-Reply-To: <20201202132038.1276404-1-philmd@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 2 Dec 2020 16:05:23 +0100
Message-ID: <CAMDeoFWm6TQirYh-B31A+V4rPnd+2ibis9X9fBFDJRoS_jhN1Q@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host/pam: Replace magic number by
 PAM_REGIONS_COUNT definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Dec 2020 15:05:46 -0000

On Wed, Dec 2, 2020 at 2:24 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> While this change helps triskaidekaphobic developers, it
> is a good practice to avoid magic values and using constant
> definitions instead.
>
> Introduce the PAM_REGIONS_COUNT and use it. No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/pci-host/i440fx.h | 2 +-
>  include/hw/pci-host/pam.h    | 2 ++
>  include/hw/pci-host/q35.h    | 2 +-
>  hw/pci-host/pam.c            | 2 +-
>  hw/pci-host/q35.c            | 2 +-
>  5 files changed, 6 insertions(+), 4 deletions(-)

:D

Reviewed-by: Julia Suvorova <jusual@redhat.com>


