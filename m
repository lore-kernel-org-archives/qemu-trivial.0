Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWxAr-00021a-WC
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2022 05:21:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWxAp-0001wX-1c
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWxAn-0005KN-Bl
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648027256;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w7TEpjQKYSCXMz48wbrgY5NgH8cUGKONZMTPXgO23rU=;
 b=YgBUVyGSyM4yub9PniQJo0sfL4qKnAKyWTy1Fom48kgZbUrj7Xe2bnZiq6mCvAAdjd2Nyd
 bIBg0k/GPPJB+EdSsj7Pr5q8M9NPY8bbBd7/j7eccR5QZi3g50TDyJxzJi4d/Fw0xpNrhs
 BHQegyLy8OQLsswXiSMYUOCsw81Qixg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-scYdeBRfMOq_C1XkP4dkzA-1; Wed, 23 Mar 2022 05:20:53 -0400
X-MC-Unique: scYdeBRfMOq_C1XkP4dkzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1C4918E0042;
 Wed, 23 Mar 2022 09:20:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29FA62166B2D;
 Wed, 23 Mar 2022 09:20:20 +0000 (UTC)
Date: Wed, 23 Mar 2022 09:20:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU Devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?B?QmVubtC40LZl?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 1/2] ci: Add github workflow for getting cirrus
 working properly
Message-ID: <YjrmUStDoWnk/t4A@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220322191409.1330-1-luoyonggang@gmail.com>
 <20220322191409.1330-2-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220322191409.1330-2-luoyonggang@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Mar 2022 09:20:59 -0000

On Wed, Mar 23, 2022 at 03:14:08AM +0800, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .github/workflows/main.yml | 29 +++++++++++++++++++++++++++++
>  MAINTAINERS                |  4 +++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 .github/workflows/main.yml
> 
> diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> new file mode 100644
> index 0000000000..85a392b962
> --- /dev/null
> +++ b/.github/workflows/main.yml
> @@ -0,0 +1,29 @@
> +# This is a basic workflow to help you get started with Actions
> +
> +name: CI
> +
> +# Controls when the action will run. Triggers the workflow on push or pull request
> +# events but only for the master branch
> +on:
> +  push:
> +    branches: [ master ]
> +  pull_request:
> +    branches: [ master ]
> +
> +# A workflow run is made up of one or more jobs that can run sequentially or in parallel
> +jobs:
> +  check-patch:
> +    name: Check Patch
> +    runs-on: ubuntu-latest
> +    steps:
> +      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
> +      - uses: actions/checkout@v2
> +        with:
> +          fetch-depth: 0
> +      - name: Install dependent packages
> +        run: sudo apt install perl
> +      - name: Checkpatch
> +        run: |
> +          git fetch https://git.qemu.org/git/qemu.git master
> +          git tag base_tag_to_rebase FETCH_HEAD --force
> +          ./scripts/checkpatch.pl --mailback base_tag_to_rebase..

I really don't think we want to start duplicating our CI efforts into
GitHub. We are using GitLab as our primary hosting platform for QEMU,
and have standardized on using GitLab for CI, only using Cirrus CI
and Travis for specific non-x86 or non-Linux tasks. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


