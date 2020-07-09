Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtOxh-0006T6-MT
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2020 01:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtOxg-0006SF-O6
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 01:19:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtOxf-0000vq-6f
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 01:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594271946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=0Or3Nm4+DeGxsaS7hrkm0L+IFg9jQv3/j5IbjaUf7Rg=;
 b=AD9asUQyG0z2ktVUP/mYlgzxqpalXOnYIhDATdfWB5S/oapEj9nTFEjG+q2VSpRqndS44P
 DDOVZXqEgBInmP0Iyr+IT/LVjMjbMtpIkmDxw8N9UcJP2FVoqpIk+k3mZRqrlCyjYkYYYK
 BhEW3+CnoVA9GvtL1IDMhd/HBNMLRUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-_3RUtvExN26i2klfcE5uIQ-1; Thu, 09 Jul 2020 01:19:04 -0400
X-MC-Unique: _3RUtvExN26i2klfcE5uIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5C5107ACCA;
 Thu,  9 Jul 2020 05:19:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-106.ams2.redhat.com [10.36.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2A552C24F;
 Thu,  9 Jul 2020 05:18:55 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 2/2] fuzz: add missing header for rcu_enable_atfork
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: philmd@redhat.com, liq3ea@163.com, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200708200104.21978-1-alxndr@bu.edu>
 <20200708200104.21978-3-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <75c61011-3be4-a450-3188-4b875703df07@redhat.com>
Date: Thu, 9 Jul 2020 07:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200708200104.21978-3-alxndr@bu.edu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Thu, 09 Jul 2020 05:19:08 -0000

On 08/07/2020 22.01, Alexander Bulekov wrote:
> In 45222b9a90, I fixed a broken check for rcu_enable_atfork introduced
> in d6919e4cb6. I added a call to rcu_enable_atfork after the
> call to qemu_init in fuzz.c, but forgot to include the corresponding
> header, breaking --enable-fuzzing --enable-werror builds.
> 
> Fixes: 45222b9a90 ("fuzz: fix broken qtest check at rcu_disable_atfork")
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index a36d9038e0..0b66e43409 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -19,6 +19,7 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/rcu.h"
>  #include "tests/qtest/libqtest.h"
>  #include "tests/qtest/libqos/qgraph.h"
>  #include "fuzz.h"

D'oh, mea culpa, I also apparently did not properly compile test that
patch :-( I think we need a CI job that at least compile tests the
fuzzing code - I can look into that once Alex Bennée's current testing
pull request has been merged.

Alexander, is there also a way to run a fuzzer just for some few
minutes? E.g. a fuzzing test that finishes quickly, or an option to
limit the time that a test is running? If so, we could also add that
quick test to the CI pipeline, to make sure that the fuzzer code does
not only compile, but is also able to run (at least a little bit).

For this patch here:
Reviewed-by: Thomas Huth <thuth@redhat.com>


