Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jo1Po-0002GN-6S
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2020 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jo1Pn-0002Dm-96
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 05:09:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26601
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jo1Pl-0000oE-D4
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 05:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592989792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V4G79XXaPbMP6iIqWMaILK9YCnZFxIVlrSd7WBud8l4=;
 b=jTBVYjYwp8pTLSg3kbKFYfaQrh7ONdEyhjaMiZB4M/KVRdC5efHO2jb0fBbpwyi5e2+Dn/
 +40WR7CmvlKhRDX1UAgZRA5mzrfajB7CShqJpjWEl2aW3L24ZylCwyhW+/SU759jpypsZ1
 hdsVzaFdR7D4Z6P1GmFm3/FWWXW9RBI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-hiJs6fH_MdC_bRdKA_9UnQ-1; Wed, 24 Jun 2020 05:09:50 -0400
X-MC-Unique: hiJs6fH_MdC_bRdKA_9UnQ-1
Received: by mail-wm1-f71.google.com with SMTP id v24so2138791wmh.3
 for <qemu-trivial@nongnu.org>; Wed, 24 Jun 2020 02:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V4G79XXaPbMP6iIqWMaILK9YCnZFxIVlrSd7WBud8l4=;
 b=Yj2sYSTvxTdrT7as5y7tak/zdNhBePHrS2gdrhrPt9lxEGt6U3KzIxwMzVPj8mIyMj
 RrgJwO25tnYc6HRJtz+rY2rAGSUqk8ETSp04CkT/UGRgwwQ2VblgjRPiUWEBXALQ5rgE
 Q4kWbS9/BMC7TWW+wwRJNi/Flu/yBXaEOJvb9jqE9kal5W4Uq3AYXhIezGAscPopFZRT
 VJvqUH8yY1huXoAA2zmtoPgCvjybuPWpRCDB+gOgvvsrfYJwLKKOTbjZRa47hpog5AIi
 VXhR6aT9FqueFWuh60WVN+4EKxRH0PIZhK2L666aSPr4kJ68qR2Z6v3wf8JZ7aIdLGKX
 YaPA==
X-Gm-Message-State: AOAM532ntJ+F7jEJHbD/SFHeIo9t6yhUkgR1HUSQxjx/41efs5qqWRou
 dP4CcBn/kCy5sTYLh23vPv7QM3eRgRXU+4FIFm1e6GReW6BN57a9MVz9QOQkz3NZsMy/gYiu4o2
 6hdkf5E+Hm+9ZyvBBRw==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr26852703wro.201.1592989789483; 
 Wed, 24 Jun 2020 02:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0mxeLzhyF0fsbjxxhGnC8Ou9lTw8GTQqjlwbLqDLaT9FPmsRkmSpCGb075A4eWmDUJUvWpw==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr26852678wro.201.1592989789219; 
 Wed, 24 Jun 2020 02:09:49 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v7sm26486136wrp.45.2020.06.24.02.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 02:09:48 -0700 (PDT)
Subject: Re: [PATCH] trivial: Remove extra character in configure help
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20200624083337.912846-1-dinechin@redhat.com>
 <20200624085956.GE774096@redhat.com>
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
Message-ID: <fc86d142-a63a-d976-c924-49ff96cb72a5@redhat.com>
Date: Wed, 24 Jun 2020 11:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200624085956.GE774096@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 24 Jun 2020 09:09:55 -0000

On 6/24/20 10:59 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 24, 2020 at 10:33:37AM +0200, Christophe de Dinechin wrote:
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index ba88fd1824..c7a6a5adfe 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1787,7 +1787,7 @@ Advanced options (experts only):
>>    --block-drv-ro-whitelist=L
>>                             set block driver read-only whitelist
>>                             (affects only QEMU, not qemu-img)
>> -  --enable-trace-backends=B Set trace backend
>> +  --enable-trace-backends= Set trace backend
> 
> This is just following the style of the option above. "B" is a
> placeholder for the desired backend(s).

I agree this is confusing, since then the filename is NAME, not N.

Maybe clearer to replace B -> BACKEND, L -> LIST, ...?

> 
>>                             Available backends: $trace_backend_list
>>    --with-trace-file=NAME   Full PATH,NAME of file to store traces
>>                             Default:trace-<pid>
> 
> 
> Regards,
> Daniel
> 


