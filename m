Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMwo5-0000EB-V3
	for mharc-qemu-trivial@gnu.org; Thu, 18 Mar 2021 13:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMwo3-00008I-MB
 for qemu-trivial@nongnu.org; Thu, 18 Mar 2021 13:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMwnu-0000ws-LX
 for qemu-trivial@nongnu.org; Thu, 18 Mar 2021 13:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616089883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLrySQOLEYLsKV5NF3SpeTIN8SG+7u9DfeWiXT/JzVw=;
 b=gsyOPPcyxMGAY+U5YDsHH6Wpq+QT1nnLeKk5wLw9J42ZwczuHFt0jCM+j4uh4Ev1b4wWY8
 bIbakYtTFcXO5TqGVFSpx0Jy2l5MFl8r21kjsM9ZpZUH2qrlywYd2L5U+Q5EaK7EPPneqf
 ahCuiWZgnUBQeqwWMtmjeozuyJvOJZM=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-YI4dQnLMPf69yE8Sp58QPw-1; Thu, 18 Mar 2021 13:51:21 -0400
X-MC-Unique: YI4dQnLMPf69yE8Sp58QPw-1
Received: by mail-vs1-f69.google.com with SMTP id s63so10827786vss.18
 for <qemu-trivial@nongnu.org>; Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLrySQOLEYLsKV5NF3SpeTIN8SG+7u9DfeWiXT/JzVw=;
 b=WHxO5E72LXof6kWPf7Enh+W4poNNCrPXAyQCPo9YZUIvUSGn2mIOL7mBBXqbME0far
 HqQtXnr+YivpCd/LR/kO5NyPQYt93SgjZP0ARHYyRceiFdV6xNZ3eBMRhBQfyrlyAOMi
 yjALjXRB6tMO1ic4peJSro1Vf4862lLSf84jnPIsfYz25/42NkWqUef2S1m3H87AaiTp
 thRee5/4cpxO/h/G2FDxrhbBJKW+7j2NG/kx+xTIz4OfLVUh2rewvD8J5kKuE6H/UHFm
 OhJ/HOqcBhYAEj3CXeU9WL+6EbLcsjg05/LRqGcteGBYOcVnXW+pfzSRkW9XJPbQdmbN
 dokA==
X-Gm-Message-State: AOAM533Nqb4OfZc4fLCKdRVqDhiGf5qhC5YOxyOT/yGqN46dpXxVfnXl
 Lih0n0FZ6Z27WKgeH7+ZELdCBd/cjqPyqfJdg6e2ay7cv9KGq3hFTJ8L8Acv0t4OkIiEMjNppz4
 Iy5RdYvwiJxr6056kvk3JbZ2lkVrU5n9gAA==
X-Received: by 2002:ab0:3388:: with SMTP id y8mr3234894uap.113.1616089881383; 
 Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymxKozgua9JvqoRC7ToVgSa0jsjSFBqWJwyaXI+R0324dOPpjcRqcHScg0LpCwfo7UYt1Sql1q4UmDTfxpKLE=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr3234886uap.113.1616089881224; 
 Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174407.2299930-1-wainersm@redhat.com>
In-Reply-To: <20210318174407.2299930-1-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 18 Mar 2021 14:50:55 -0300
Message-ID: <CAKJDGDZeADLuQs-h4rqsgoLSohriJCv2VkUE2xoOOW2Je3PQwA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/devel/testing.rst: Fix references to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 18 Mar 2021 17:51:36 -0000

On Thu, Mar 18, 2021 at 2:49 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
>
> Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
> v1->v2:
>  * Fixed typo on subject [jsnow]
>  * Replaced Related-to with Fixes [jsnow]
>
>  docs/devel/testing.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


