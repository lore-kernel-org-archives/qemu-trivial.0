Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwivw-0004zn-VD
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2021 04:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kwivp-0004yj-Pk
 for qemu-trivial@nongnu.org; Tue, 05 Jan 2021 04:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kwivi-0001W1-49
 for qemu-trivial@nongnu.org; Tue, 05 Jan 2021 04:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609840023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNlWjD1Myo3kNfag1awpy32y7yVD77Njl+kNCjHI02w=;
 b=UJ/xHUuYMr0KkoCCsBRs5K6JNuj5hlROlcAkZv1HA6/+H+ka6YYR56yMO6vBox9lXY/ThR
 Z7eNIrCl3ukQEMVU18NNPSPKRZ2/NAVTItZLD0T40gSNT14IbDvrU36/j1XhSPbU/ckScd
 +6d1dw5ut6FwkwPCw4zTMe9+vS5hd+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-fRBEjUWwM26ntjruqEzKjg-1; Tue, 05 Jan 2021 04:47:01 -0500
X-MC-Unique: fRBEjUWwM26ntjruqEzKjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB532801817;
 Tue,  5 Jan 2021 09:46:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A583F669FC;
 Tue,  5 Jan 2021 09:46:56 +0000 (UTC)
Subject: Re: [PATCH] qtest/libqtest.c: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Laurent Vivier <lvivier@redhat.com>
References: <20210104141025.496193-1-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b0426ff0-f33b-dd64-66e5-4937bc3a1be1@redhat.com>
Date: Tue, 5 Jan 2021 10:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210104141025.496193-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 05 Jan 2021 09:47:14 -0000

On 04/01/2021 15.10, Gan Qixin wrote:
> When the length of mname is less than 5, memcpy ("xenfv", mname, 5) will cause
> heap buffer overflow. Therefore, use strcmp to avoid this problem.
> 
> The asan showed stack:
> 
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000f2f4 at
> pc 0x7f65d8cc2225 bp 0x7ffe93cc5a60 sp 0x7ffe93cc5208 READ of size 5 at
> 0x60200000f2f4 thread T0
>      #0 0x7f65d8cc2224 in memcmp (/lib64/libasan.so.5+0xdf224)
>      #1 0x5632c20be95b in qtest_cb_for_every_machine tests/qtest/libqtest.c:1282
>      #2 0x5632c20b7995 in main tests/qtest/test-hmp.c:160
>      #3 0x7f65d88fed42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
>      #4 0x5632c20b72cd in _start (build/tests/qtest/test-hmp+0x542cd)
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/libqtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index e49f3a1e45..e8179a3509 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1281,7 +1281,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
>           g_assert(qstr);
>           mname = qstring_get_str(qstr);
>           /* Ignore machines that cannot be used for qtests */
> -        if (!memcmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
> +        if (!strcmp("xenfv", mname) || g_str_equal("xenpv", mname)) {

Using strcmp() is likely wrong here, since we're talking about strings like 
"xenfv-4.2" here ... so I guess strncmp(..., 5) would be the right way to go?

  Thomas


