Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWxMu-000759-L4
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2022 05:33:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWxMs-00073B-1a
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWxMp-0000L5-If
 for qemu-trivial@nongnu.org; Wed, 23 Mar 2022 05:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648028002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iDr1Y3Y0CPwodEjqgMCkwFp5iws893Micv1Z0sNo5JA=;
 b=emyly5ff9QExri51G8MmQUnRX7Yqxs1B4bAPyeL0UD3MC8f58BYLhosFU9vZqXGuST/3bj
 NMPt47t7ioTTsC4kMtjdWW9kYwrAjJxxozeWkxc8nmhdVQq68EmU+Y7rnOoC6S6O+8uDsO
 hvhNau62/4iIlkMtA1L3NtiVS1oAsMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-zhqjMjShMlGM8bkyRw8Mzw-1; Wed, 23 Mar 2022 05:33:19 -0400
X-MC-Unique: zhqjMjShMlGM8bkyRw8Mzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F02C811E76;
 Wed, 23 Mar 2022 09:33:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E56CDC27D86;
 Wed, 23 Mar 2022 09:33:17 +0000 (UTC)
Date: Wed, 23 Mar 2022 09:33:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU Devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?B?QmVubtC40LZl?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 2/3] ci: Add empty github workflow for reporting
 historical cirrus result at github
Message-ID: <YjrpW2O8HqOT2PXN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220323080755.156-1-luoyonggang@gmail.com>
 <20220323080755.156-3-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220323080755.156-3-luoyonggang@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Mar 2022 09:33:26 -0000

On Wed, Mar 23, 2022 at 04:07:54PM +0800, Yonggang Luo wrote:
> Looks like https://github.com/lygstate/qemu/actions does
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .github/workflows/main.yml | 24 ++++++++++++++++++++++++
>  MAINTAINERS                |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 .github/workflows/main.yml
> 
> diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> new file mode 100644
> index 0000000000..71f5fbd556
> --- /dev/null
> +++ b/.github/workflows/main.yml
> @@ -0,0 +1,24 @@
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
> +        run: echo "Empty action"

I really rather we just integrated the Cirrus CI windows job into our GitLab
pipeline using cirrus-run, as we did for the other Cirrus jobs.

We've also already got some native msys jobs under GitLab that test some
combinations, but not all since they're somewhat slow. So we still need
to take advantage of Cirrus for some msys testing, but we can likely
reduce the overlap.

I definitely don't want to see us increasing our use of GitHub, as having
multiple places to look at for CI results is a really bad thing. We want
todo what is possible to make GitLab the single dashboard for all CI info.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


