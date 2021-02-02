Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6vgK-0005bu-Eg
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 08:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6vgC-0005ZW-1p
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 08:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6vg6-0008UN-01
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 08:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612272309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di2HVjjYqK+QCuhauDffqN2CeBz7Zcfx4hopJKJ2RtI=;
 b=AHYBuEEj3nqwSv9+Y8LYgK7MRy2J74k7PXvUpXqCDK/OxzQ6cN7/kH43ICMs2q1k5LN1gf
 wgz13LeMNOAn8hoBBuMAPiDnsG3Lt2odjsM7BWkHrL7vxV0mMXXKhCzrE2OXYq0iGNz3Y5
 wS/XHtEPIE8kHCL+LVwV26uHdyZmiMI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-SGWtEKx0OE6SmKm_CJjwyg-1; Tue, 02 Feb 2021 08:25:07 -0500
X-MC-Unique: SGWtEKx0OE6SmKm_CJjwyg-1
Received: by mail-wr1-f70.google.com with SMTP id n14so12581369wru.6
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 05:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=di2HVjjYqK+QCuhauDffqN2CeBz7Zcfx4hopJKJ2RtI=;
 b=Cq78fcGGx6pMfikd4WxdB9CTfXMM4boad99OOMufLqPaDtJ/IqpEB+5y+dv3uJAvhM
 5SyKKcFZZqV0/YhQ5FxEBnD5Y4POdI8qYzbkGNd+RkGag673CD9HgBZuVFsA+vGEtDsU
 t7ti+Td9MXs4mxNiFsBPG5XJQhw/gn+IM6KsOGItcldrW+k0/v4b2/tTYBr4hZyeeOCQ
 W1FsP9SSqcIn6bqGGd8iLSt54l4xFrrRMRnpMJPqyrzAah0LMXFEukkSGz5969+vV/9+
 vvoyjvq5lSV77KudxyQYxqnDSNFSYWuYGnV/98hIBLe95AJcABDfp17JrcMyjtPcHY/Z
 gJ0Q==
X-Gm-Message-State: AOAM530sjutgDHLV1TL9PXgX7wcfe9obzAAHIJIFndFWoj3BjyoiBTVV
 l3pwyTIhX4P7zviBVpF8GY+2syZhHlkIWAgoF5jLZ6oQbtU2/Ia5Q7aqsIlL7l6F8csFPoqdTMB
 IYMLJwQP8PYASDHh4cBHxLSpVKccJuNXT8Z4P2Fn2ImvO92YMURgZvY8R8qFb4hm7lLA=
X-Received: by 2002:a5d:4391:: with SMTP id i17mr23674487wrq.57.1612272306467; 
 Tue, 02 Feb 2021 05:25:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLIxEIqpguEa5E5rGLAAtKmMWTv1BadiCmLk2kjGzc0DCOJV964jB52Mo2k5h7UPahLNeJiA==
X-Received: by 2002:a5d:4391:: with SMTP id i17mr23674449wrq.57.1612272306002; 
 Tue, 02 Feb 2021 05:25:06 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m205sm2648529wmf.40.2021.02.02.05.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 05:25:05 -0800 (PST)
Subject: Re: [PATCH] configure: Escape non-numbers in version_ge()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org
References: <20210202104911.879393-1-philmd@redhat.com>
 <87mtwmtz9w.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <551e39ae-461d-6a3f-9add-26f508e851d0@redhat.com>
Date: Tue, 2 Feb 2021 14:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87mtwmtz9w.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Tue, 02 Feb 2021 13:25:17 -0000

On 2/2/21 1:43 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On Red Hat based distributions, the configure script emits various
>> warnings:
>>
>>   # ./configure
>>   Using './build' as the directory for build output
>>   ./configure: line 212: test: 2-15: integer expression expected
>>   ./configure: line 213: test: 2-15: integer expression expected
>>   ./configure: line 212: test: el8: integer expression expected
>>   ./configure: line 213: test: el8: integer expression expected
>>
>> This is produced by the gdb version check introduced in commit
>> b1863ccc957 ("configure: gate our use of GDB to 8.3.1 or above"):
>>
>>     gdb_version=$($gdb_bin --version | head -n 1)
>>     if version_ge ${gdb_version##* } 8.3.1; then
>>         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
>>     fi
>>
>> Because on RHEL/Fedora the minor version is not a plain number:
>>
>>   $ gdb --version | head -n 1
>>   GNU gdb (GDB) Fedora 9.1-7.fc32
>>
>>   $ gdb --version | head -n 1
>>   GNU gdb (GDB) Red Hat Enterprise Linux 8.2-15.el8
>>
>> Fix by only using the leading numbers, stripping the rest.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index e85d6baf8f8..21f6530a812 100755
>> --- a/configure
>> +++ b/configure
>> @@ -205,7 +205,7 @@ version_ge () {
>>          local_first=${2-0}
>>          # 'shift 2' if $2 is set, or 'shift' if $2 is not set
>>          shift ${2:+2}
>> -        local_ver1=$*
>> +        local_ver1=$(echo $* | sed -E 's/(^[0-9]+).*/\1/')
>>          set x $local_ver2
>>          # the second argument finished, the first must be greater or equal
>>          test $# = 1 && return 0
> 
> I already have a fix that was posted in:
> 
>   Subject: [PATCH  v2 7/8] configure: make version_ge more tolerant of shady version input
>   Date: Fri, 22 Jan 2021 18:18:53 +0000
>   Message-Id: <20210122181854.23105-8-alex.bennee@linaro.org>
> 
> About to feature in the pre-PR series I'm about to post.

Oh I missed it.

Thanks,

Phil.


