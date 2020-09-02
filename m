Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDPS2-0001OP-Nl
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 05:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDPS0-0001MO-O4
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 05:53:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDPRy-0007NO-DK
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 05:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599040385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rm9+9XvMjo2bpL2GAM/21F/jpjy1E0z2Dcc+38nj9I8=;
 b=P/fz3ZlmPFHnNjXeoMTRl7AjnSBCjHb6LRXnE0u6lv0Vod5JMruU+Vn4IZSDKgJmYJKmqM
 NCy6KteVjPQIqLhG9///sPlYaZ6Jon44vx/GO3GST2Stqz2hdyLWgobaxt+thY7AxXmr4S
 uusHlewAOM2raBCW9OqcfnkS3TQT+cU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-B7b4to3nM1CfXkA6LLgR6w-1; Wed, 02 Sep 2020 05:53:03 -0400
X-MC-Unique: B7b4to3nM1CfXkA6LLgR6w-1
Received: by mail-wm1-f72.google.com with SMTP id 23so1421558wmk.8
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rm9+9XvMjo2bpL2GAM/21F/jpjy1E0z2Dcc+38nj9I8=;
 b=iMEhfAUs2A6B4vRMdEbWwU/YBYnRbOyvYTYlC0Ongxz95DlD1n8DonAqrKFWUFka5c
 kAJLowYafClaAYI8SNCwMU0pJUykoX8x6Q77WVLo3R9kVK+L7W4ebDCq6F5lf/Nxfyho
 3i+2FEylrN/viAvD+/x+W0HgXoEJE7961IlMV6JDFrY28fs7KDiDkyYNGjIx0muGNwsN
 qz62iKDOoS/eOzfeUb6NXYI9X7oC1hrXKGpKlj3vAzBabwois+Kdl8tlJT0ibYdGLYDL
 809lwTVbL1MsuxaVj0SYNa5Adq1Uw5ANHYTovTp14VoRMf4hWbzKC86bMbAVJ3KEUNo9
 044g==
X-Gm-Message-State: AOAM530Fp2Mq98JuBkzOTaQohRXJHYVboJRw/SW+C3vMjDOUJpXKT/sa
 IbX55+g9edS3vlJOLk2JJTSHwxcJPCwhLOjnoX/DQAXlJuTzXuEnSazOBQ42fSTxXcpBJrpagZN
 ruMwIOl9bs4GPaofkJg==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr5964782wmc.30.1599040382372; 
 Wed, 02 Sep 2020 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxulEPZyLk9hmZykbgiE9hg3ckhcFUUgLb0NHjAUxd3/4OdojbJgJhmnA2ANEiERCFAbkScwQ==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr5964752wmc.30.1599040382004; 
 Wed, 02 Sep 2020 02:53:02 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id f14sm6542217wrv.72.2020.09.02.02.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 02:53:01 -0700 (PDT)
Subject: Re: [PATCH 5/5] util/qsp: Do not declare local variable only used for
 assertion
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
References: <20200902080801.160652-1-philmd@redhat.com>
 <20200902080801.160652-6-philmd@redhat.com>
 <20200902111112.251568b8@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f69d4081-a297-a9ca-b5c9-39efff9fa3ca@redhat.com>
Date: Wed, 2 Sep 2020 11:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902111112.251568b8@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 02 Sep 2020 09:53:08 -0000

On 9/2/20 11:11 AM, Greg Kurz wrote:
> On Wed,  2 Sep 2020 10:08:01 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> This variable is used once in an assertion. Remove single
>> declaration and access directly in the assert().
>>
>> See in "qemu/osdep.h":
>>
>>  *                                  [...] disable assertion is not
>>  * supported upstream so the risk is all yours.  Meanwhile, please
>>  * submit patches to remove any side-effects inside an assertion, or
>>  * fixing error handling that should use Error instead of assert.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  util/qsp.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/util/qsp.c b/util/qsp.c
>> index 7d5147f1b20..1db044ecedd 100644
>> --- a/util/qsp.c
>> +++ b/util/qsp.c
>> @@ -560,9 +560,7 @@ static void qsp_iter_diff(void *p, uint32_t hash, void *htp)
>>  
>>      /* No point in reporting an empty entry */
>>      if (new->n_acqs == 0 && new->ns == 0) {
>> -        bool removed = qht_remove(ht, new, hash);
>> -
>> -        g_assert(removed);
>> +        g_assert(qht_remove(ht, new, hash));
> 
> Urgh... this is doing exactly the opposite of the "qemu/osdep.h"
> recommandations above. We still want to remove new from the
> hash table even if QEMU was built without assertions.

Oops you are right :/

> 
>>          g_free(new);
>>      }
>>  }
> 


