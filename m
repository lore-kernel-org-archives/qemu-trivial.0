Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK1cP-0001vE-8K
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 11:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK1OY-0003s3-L7
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK1OX-0006nn-5x
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+Csusx3xhJjfy/PEm2ywep6oc4tfFjzlLIYF6gayF8=;
 b=JlUDVznGL8hkPv00TOM8MJ5ZGXx/3eZmJX95cRzDXvX2bu5ii2Cc8zGz/FuocuAHkv2mP9
 2aLYq9fLax3XQQFDhwD0dsg/EP7fljo3ssnBZzmT9VS9DRFYvxziZr6RIbS65P2cCuLCL5
 zB4tYUxWvIG4uGZlQ9AlCT8K6tUvvOM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-FUx9FKr2MFS1c2FJf8kYtw-1; Wed, 10 Mar 2021 11:09:04 -0500
X-MC-Unique: FUx9FKr2MFS1c2FJf8kYtw-1
Received: by mail-vs1-f71.google.com with SMTP id k12so5132748vso.2
 for <qemu-trivial@nongnu.org>; Wed, 10 Mar 2021 08:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+Csusx3xhJjfy/PEm2ywep6oc4tfFjzlLIYF6gayF8=;
 b=d/rqVJQLE2taed0pYKzxLqxu4mCVG2QS8j8yPLxFqXvZgbUP4azx4cLnO4Ja4ytHf2
 QnWBZo14OA5o/Y8XEwGKQM2osRid0Rn/ulbV5loS2Ettb8naQHc/AddEmpo++iKTR58M
 UyOgCd0bL11+T3mMmsxFG1/A0/SrAYuR9ZE67VVFobcaD+QQ90GFKce5z4G3QQwgC6JX
 /hTHQeiYo1JhyXseigv5Ob163AwtUHhmd7R1d1d1wZ2nEDh4SYoGQtZyMuwNNLe76lnq
 j1OaSWB2P4hmAuUmNUHQySY0NbHFMhlTWfRyNeYCdTrMCFcDWbiNhHm0b5QE5Or63oHS
 M6Zw==
X-Gm-Message-State: AOAM533/RIZpvFD5F04tqj7GNEgFgmN65FEn5nbO9AEVkTJFesloI9l8
 PDcNSdp/Yi4UAUb61tj7Nmrx4s6UmPe9V3ULCg55SNcFMn+8iOP0HGx9mmwb07XluH3gqsRorLw
 IhMxb6xlhfFW9MMlkN+Ms8lJN3wg3oggeVA==
X-Received: by 2002:a67:8702:: with SMTP id j2mr1812114vsd.50.1615392543889;
 Wed, 10 Mar 2021 08:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFfJpN9T8p8HC4ZSNkAyhFU1WShvZIUBEOLjAd82onPu2Hb84xX4BVY+VhLP6aG3i55JWTVcqvv9Ha7di8Dn8=
X-Received: by 2002:a67:8702:: with SMTP id j2mr1812085vsd.50.1615392543680;
 Wed, 10 Mar 2021 08:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20210310094936.1318317-1-thuth@redhat.com>
 <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
 <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
In-Reply-To: <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 13:08:37 -0300
Message-ID: <CAKJDGDbd6sZ0swGju-rCv9Lf-ADU3Tg1zeDxO-nfgpVxoONb-Q@mail.gmail.com>
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:23:27 -0500
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
X-List-Received-Date: Wed, 10 Mar 2021 16:09:11 -0000

On Wed, Mar 10, 2021 at 1:04 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/03/21 16:49, Willian Rampazzo wrote:
> > On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> When running "make check-speed", currently nothing happens. This is
> >> because the redirection to "bench-speed" is not working as expected
> >> (since the bench-speed rule in the generated Makefile.mtest filters
> >> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
> >> Fix it by calling "make bench-speed" instead of using a dependency.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   tests/Makefile.include | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Tested-by: Willian Rampazzo <willianr@redhat.com>
> >
>
> I don't object to the patch, but if no one has noticed in 6 months
> perhaps the target can go (replaced by "make bench"/"make bench-speed").
>

I was also thinking about it. If the target was not working and no one
complained, maybe remove it is just fine, so, +1 here for
removing/renaming.

> Paolo
>


