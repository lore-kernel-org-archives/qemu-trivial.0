Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaYIF-000107-Km
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 00:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaYIE-0000zp-6X
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 00:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaYIB-00006o-Ae
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 00:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604555917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvll4JKYNzp8bkdnfXuyMRUnXk2lmx/NR7zj4E8Eiwc=;
 b=BN3Ta9hiih9WtBuPwJPUNaFcALM13qX0E8wP/Xgw0S91PfM//z5zCnPcgTXnAi9gOYcgkF
 EejRw0L7t9W2jfdFTn4csds1wjAlqNRzWMd0rwb9+XjNZgNdQvFb6zc6pKv3acAduyG233
 KqoNmcz5gof2DlG+PxamRAbwnwUE418=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-onKaUcIKP-aQYFpYBsfPYw-1; Thu, 05 Nov 2020 00:58:35 -0500
X-MC-Unique: onKaUcIKP-aQYFpYBsfPYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A151D1007464;
 Thu,  5 Nov 2020 05:58:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559CF10013C1;
 Thu,  5 Nov 2020 05:58:32 +0000 (UTC)
Subject: Re: [PATCH] qtest: Fix bad printf format specifiers
To: AlexChen <alex.chen@huawei.com>
Cc: lvivier@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <5FA28117.3020802@huawei.com>
 <67eca43e-99ea-f2ce-5d9e-a9cb5c7a3a83@redhat.com>
 <5FA38A32.2020008@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <18690aa2-3de9-70ad-477f-934724b284a0@redhat.com>
Date: Thu, 5 Nov 2020 06:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5FA38A32.2020008@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Nov 2020 05:58:42 -0000

On 05/11/2020 06.14, AlexChen wrote:
> On 2020/11/4 18:44, Thomas Huth wrote:
>> On 04/11/2020 11.23, AlexChen wrote:
>>> We should use printf format specifier "%u" instead of "%d" for
>>> argument of type "unsigned int".
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>>> ---
>>>  tests/qtest/arm-cpu-features.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>>> index d20094d5a7..bc681a95d5 100644
>>> --- a/tests/qtest/arm-cpu-features.c
>>> +++ b/tests/qtest/arm-cpu-features.c
>>> @@ -536,7 +536,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>          if (kvm_supports_sve) {
>>>              g_assert(vls != 0);
>>>              max_vq = 64 - __builtin_clzll(vls);
>>> -            sprintf(max_name, "sve%d", max_vq * 128);
>>> +            sprintf(max_name, "sve%u", max_vq * 128);
>>>
>>>              /* Enabling a supported length is of course fine. */
>>>              assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
>>> @@ -556,7 +556,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>                   * unless all larger, supported vector lengths are also
>>>                   * disabled.
>>>                   */
>>> -                sprintf(name, "sve%d", vq * 128);
>>> +                sprintf(name, "sve%u", vq * 128);
>>>                  error = g_strdup_printf("cannot disable %s", name);
>>>                  assert_error(qts, "host", error,
>>>                               "{ %s: true, %s: false }",
>>> @@ -569,7 +569,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>               * we need at least one vector length enabled.
>>>               */
>>>              vq = __builtin_ffsll(vls);
>>> -            sprintf(name, "sve%d", vq * 128);
>>> +            sprintf(name, "sve%u", vq * 128);
>>>              error = g_strdup_printf("cannot disable %s", name);
>>>              assert_error(qts, "host", error, "{ %s: false }", name);
>>>              g_free(error);
>>> @@ -581,7 +581,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>                  }
>>>              }
>>>              if (vq <= SVE_MAX_VQ) {
>>> -                sprintf(name, "sve%d", vq * 128);
>>> +                sprintf(name, "sve%u", vq * 128);
>>>                  error = g_strdup_printf("cannot enable %s", name);
>>>                  assert_error(qts, "host", error, "{ %s: true }", name);
>>>                  g_free(error);
>>>
>>
>> max_vq and vq are both "uint32_t" and not "unsigned int" ... so if you want
>> to fix this really really correctly, please use PRIu32 from inttypes.h instead.
>>
> 
> Hi Thomas,
> Thanks for your review.
> According to the definition of the macro PRIu32(# define PRIu32         "u"),
> using PRIu32 works the same as using %u to print, and using PRIu32 to print
> is relatively rare in QEMU(%u 720, PRIu32 only 120). Can we continue to use %u to
> print max_vq and vq in this patch.
> Of course, this is just my small small suggestion. If you think it is better to use
> PRIu32 for printing, I will send patch V2.

Well, %u happens to work since "int" is 32-bit with all current compilers
that we support. But if there is ever a compiler where the size of int is
different, you'll get a compiler warning here again. So if we now fix this
up, then let's do it really right and use PRIu32, please.

 Thomas


