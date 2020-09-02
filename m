Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDPTT-000309-EO
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 05:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDPTS-0002xi-6g
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 05:54:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35748
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDPTQ-0007c7-LO
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 05:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599040475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAN/+UgVuutpK9WRPwmoCgiOBIRb3PSn9SRbUPevmNQ=;
 b=ie/Tu7HNQuKXvqoStrgeeXGMwQyC059Sc/6gcHUpFQe3EoSerA64NnvhXpzpA8qrOlAeKi
 wr59qtffhDlkJrB/ZcGOoCYfwyC9ZXO74mdODFf1qswZBkzrwzHAHRwL1eGuoHH3nqiknI
 sh/w67qvYAF5LxwiVCcr4yHuMtKuxaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-ATs-m8ZMMLWkY5VhGvb_eQ-1; Wed, 02 Sep 2020 05:54:32 -0400
X-MC-Unique: ATs-m8ZMMLWkY5VhGvb_eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CD118A224D;
 Wed,  2 Sep 2020 09:54:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C488A7E333;
 Wed,  2 Sep 2020 09:54:24 +0000 (UTC)
Subject: Re: [PATCH 1/5] tests/qtest/ipmi-kcs: Fix assert side-effect
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20200902080801.160652-1-philmd@redhat.com>
 <20200902080801.160652-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9007792c-9482-d5c7-09f3-3ce282862a68@redhat.com>
Date: Wed, 2 Sep 2020 11:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200902080801.160652-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Sep 2020 09:54:38 -0000

On 02/09/2020 10.07, Philippe Mathieu-Daudé wrote:
> Fix assert side-effect reported by Coverity:
> 
>   /qemu/tests/qtest/ipmi-kcs-test.c: 84 in kcs_wait_obf()
>   83         while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
>   >>>     CID 1432368:  Incorrect expression  (ASSERT_SIDE_EFFECT)
>   >>>     Argument "--count" of g_assert() has a side effect.  The containing function might work differently in a non-debug build.
>   84             g_assert(--count != 0);
> 
> Reported-by: Coverity (CID 1432368)
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/ipmi-kcs-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
> index 693a6aacb52..fc0a918c8d1 100644
> --- a/tests/qtest/ipmi-kcs-test.c
> +++ b/tests/qtest/ipmi-kcs-test.c
> @@ -81,7 +81,8 @@ static void kcs_wait_obf(void)
>  {
>      unsigned int count = 1000;
>      while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
> -        g_assert(--count != 0);
> +        --count;
> +        g_assert(count != 0);
>      }
>  }
>  
> 

You could also use g_assert_true() instead. Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


