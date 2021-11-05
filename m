Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj1bE-0006Jb-1V
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mj1b6-0006Hk-Jr
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 11:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mj1b2-0006zq-ME
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 11:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636127858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lbw4urAsY28vIOFJXljLaDDWbNRUmdHZJKje1qEhY4=;
 b=ciLTgFgEp6GwEA3wBltUyj2ZUcJ348JikgBRXchn4M0L9ghkFoTBosrN1kZ2Vy+bxAuUdy
 l2fG/0m+JDysM+Fuwtc6jdDGaY89UzpZ/YNtuKtWg4luNGOX4SZduWXCRAdaEGOxDdsWGD
 yJ4HcTsYwvlJIa2B5AznuKocFD6dHII=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-sVUSGWs-OxeFAdLRSVEagA-1; Fri, 05 Nov 2021 11:57:37 -0400
X-MC-Unique: sVUSGWs-OxeFAdLRSVEagA-1
Received: by mail-pf1-f198.google.com with SMTP id
 134-20020a62198c000000b0047bf0981003so6049563pfz.4
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 08:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lbw4urAsY28vIOFJXljLaDDWbNRUmdHZJKje1qEhY4=;
 b=7EdKPO3dnXfcvPzXB1+qI4XE2pZcq2aW6dmJKQpoJeewITZNcErqkKi/onIBsxRak4
 vOyZRok3qeMVS8ivDT6Tv8vCnnhzn0v+LWRzLhYfifHMtlP8TF0hSUnneaTaUuzE0PmU
 IrdB9L4AOXlrhr8jbl7lQrerUGzhsjhHU/ovBg/+sS+RcbQqVho7zv6bwRb7nEdFxL0z
 FP+IwfJqHZnyJcrkpeNdT0klkd3OStRU/NXEfdlro2cIvYOlAsO7kML3V3X+m5x7Py88
 cygAWod38kTzeZfB0gDP0TFVDTecdLhdGDD8bgDF/bYpeVSEL350Eut3ojONDjMTfvT6
 aoTw==
X-Gm-Message-State: AOAM5328rc/eJcYFTm41kdvoj2rD4mObEB6xRBf8/Pakp+OVSMtUMdbH
 2iMoZ6nUvkul0CClaVTCrVg5zusLBW+6BwHYverdbXyMA+YQUK70Iq05pDKxOoj+79qk7ZOIOT3
 uKFsPWZfU0fZ7N4VsIFahww5pf8J/tn0eRQ==
X-Received: by 2002:a63:f316:: with SMTP id l22mr43615148pgh.439.1636127856729; 
 Fri, 05 Nov 2021 08:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys2rARk8S7Ssc/G/TwW46I3lJEGCYcAWAHjRwFq5ZXoiXOjMlJSDpbVfY9/3PyTi1CDoOZQzPN4VO/7MGXmH8=
X-Received: by 2002:a63:f316:: with SMTP id l22mr43615118pgh.439.1636127856393; 
 Fri, 05 Nov 2021 08:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211105142656.145791-1-philmd@redhat.com>
In-Reply-To: <20211105142656.145791-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Nov 2021 12:57:10 -0300
Message-ID: <CAKJDGDYYizAtxCVeJJH0VfDpmOjXwbbJULnxYv7g2nMo5bfUgg@mail.gmail.com>
Subject: Re: [PATCH] docs/about/deprecated: Remove empty 'related binaries'
 section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, libvir-list@redhat.com, 
 Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 15:57:47 -0000

On Fri, Nov 5, 2021 at 11:31 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
> removed the content of the "Related binaries" section but forgot
> to remove the section title. Since it is now empty, remove it too.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/about/deprecated.rst | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


