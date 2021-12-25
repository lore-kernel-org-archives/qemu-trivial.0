Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n145s-0006n2-NS
	for mharc-qemu-trivial@gnu.org; Sat, 25 Dec 2021 05:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n145q-0006lt-HX
 for qemu-trivial@nongnu.org; Sat, 25 Dec 2021 05:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n145n-00081J-4P
 for qemu-trivial@nongnu.org; Sat, 25 Dec 2021 05:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640427357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8qmg0haFikHRmO+dDR3kATIpwcs8NntqZAWLEelOrg=;
 b=NhFKFMcFrC+75oJQnNJMuWh0OJCk67NPX3U5buLY7N1KaphkDBQX4G3uEH72TiBRaEMpjz
 Ioyv3Ahm7voz7188H97ZAaxSc+NnvgT+DebVq+h36HNQZInYndJipesuo4NTuC4vCeVuRx
 Yr7UiwauUVaPtvcl5v+T5b+sJln1sVk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-if7X7X29O9GAsvyrp-b1ww-1; Sat, 25 Dec 2021 05:15:55 -0500
X-MC-Unique: if7X7X29O9GAsvyrp-b1ww-1
Received: by mail-ed1-f71.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so8238043edc.0
 for <qemu-trivial@nongnu.org>; Sat, 25 Dec 2021 02:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E8qmg0haFikHRmO+dDR3kATIpwcs8NntqZAWLEelOrg=;
 b=faemEwxYtjqjDvqlxpkwSBouJu5WMiIOti9ix1z+o8s3iyoSrXvG1FJVE9rA+VFO9w
 ps2d7JOTIKlzNOT9parPAXDNwcl2b4T9pK5zvvKZXElreJIlntCBlK7tu4UGbk6Kmzjf
 4lAx/bg0gkkhK5kOLhzVSc87tGmD/L+W2Kz/Me1lsL2i3hy3K1QQ9LukgYtv6vO/yq/N
 pbLKx3RyqgfMvhUKVmVKAIn/KnsmB4PqqwEegZXu6RmzDTqhOsDA1UGGepc+2oX3DEUr
 L5F1gpG+iqyJGCY9C1fhEpikM2++hZ7FKJIzCqleIpZGPVCHA1cwxAYe6qmXCKayzjYS
 kz6g==
X-Gm-Message-State: AOAM533OvzJF7QXm7R2BFH3PWtJGOqEffpBxsK3WYgouI/5hj2JKhbeA
 xAo6HvwUIBIjGOW/huR/myWVxcxi6cFlpSF599ZdPbAkG25F097yw7HQFdzLsk5IskTITacBojR
 UnF6GL7qgTAcUQ0WUrQ==
X-Received: by 2002:a17:906:990c:: with SMTP id
 zl12mr7504194ejb.370.1640427353236; 
 Sat, 25 Dec 2021 02:15:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwixj5UYtsexG69k2ALj8fs0WUDSUXhF9+TGMgQ2t6+dpnEtTeHM7m9NKDq7JVApEyFkIDYxA==
X-Received: by 2002:a17:906:990c:: with SMTP id
 zl12mr7504171ejb.370.1640427352911; 
 Sat, 25 Dec 2021 02:15:52 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id hp18sm3370297ejc.40.2021.12.25.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 02:15:52 -0800 (PST)
Message-ID: <f08fb158-99a5-baf2-0d82-ca44727ecd98@redhat.com>
Date: Sat, 25 Dec 2021 11:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/unit/test-util-sockets: Use g_file_open_tmp() to
 create temp file
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20211224234504.3413370-1-philmd@redhat.com>
 <2bc0b1f2-54ba-af6a-298b-0c86ac4d921f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2bc0b1f2-54ba-af6a-298b-0c86ac4d921f@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.202,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.196, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 25 Dec 2021 10:16:03 -0000

On 12/25/21 02:23, Richard Henderson wrote:
> On 12/24/21 3:45 PM, Philippe Mathieu-Daudé wrote:
>> Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
>> Use g_file_open_tmp() to create temporary file"), avoid calling
>> g_test_rand_int() before g_test_init(): use g_file_open_tmp().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-util-sockets.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-util-sockets.c
>> b/tests/unit/test-util-sockets.c
>> index 72b92465298..896247e3ed3 100644
>> --- a/tests/unit/test-util-sockets.c
>> +++ b/tests/unit/test-util-sockets.c
>> @@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
>>       };
>>       int i;
>>   +    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
>> +    g_assert_true(i >= 0);
> 
> Just g_assert.

Per https://docs.gtk.org/glib/testing.html#testing-framework:

  Note that g_assert() should not be used in unit tests, since
  it is a no-op when compiling with G_DISABLE_ASSERT. Use g_assert()
  in production code, and g_assert_true() in unit tests.

We don't really use G_DISABLE_ASSERT, but g_assert_true()
seems appropriate here...

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks.


