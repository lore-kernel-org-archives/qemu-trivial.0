Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKewS-000181-Ay
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2023 07:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKewQ-00017g-9b
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 07:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKewO-0002Wk-6I
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 07:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674649906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ+xCPbHIXJ+lJ5MVABsbpA8jJWLpZk0wM9mEPQAZLM=;
 b=WoxnjIhF3YFxqSZxZW/YbCgKgS+ALCggk/UEM1o5t2ezlHfUv3HX4w7ls36Zwx0CZglYDX
 qEyS+bKsUVSbEkKj9enWall7urdEgn1vvrfy4VEgJjv49yyYlWbd+Yj/8AWZDcHWwX4KDd
 BtYhbUgq/SQ7t1JbPnPo17CL1PaOn0I=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-VPJNzLcgNDS7b3j2yqXUDw-1; Wed, 25 Jan 2023 07:31:44 -0500
X-MC-Unique: VPJNzLcgNDS7b3j2yqXUDw-1
Received: by mail-vk1-f197.google.com with SMTP id
 x22-20020a1f3116000000b003c67dc01d12so7290478vkx.17
 for <qemu-trivial@nongnu.org>; Wed, 25 Jan 2023 04:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ+xCPbHIXJ+lJ5MVABsbpA8jJWLpZk0wM9mEPQAZLM=;
 b=kSAuAOEDMVrJYkRTS5hSxz+iXwALNGIoKtWMBElv5DzF192q5YVZsq71iAX50Gtw7A
 QBfTGrEi5WSb6jLy/JMXCbl/aZTuRd/CbJ2iikzkHLga6Jx817E07f5YmA/0ij7guehF
 vcAUqUX7dkaJrOGIIZri0m3bHPY6uH96WNfCneDX53NJBw0J6md4TOFxtcmK9AONl5pK
 g2e1yC0yALUfe8em4pSlTHuNct4PgT9NCn3borxmdaUt9gKTFvfOkZaNBqGJysKJXeoR
 qI1whOgpPGdb3nU0ww46QakvbNRam1BW8PqK4A2EArpew2ThRIYvNParZRv8sirHkfyd
 O9QA==
X-Gm-Message-State: AFqh2koHExOV73UXctBDyLdUKp/EImMFQdk3YU+g0P3JILGPpSgOLmwu
 jF2tStMYSxWgqrQpqREFJplGkpZf2tCv1r1cPlGkbUO7dDCVbBxzVriWVjUuIuPbcmUbHmO+hzR
 5o2ZwCl1dbPRQ+rsjsQ==
X-Received: by 2002:a1f:1dc7:0:b0:3e1:b028:3c71 with SMTP id
 d190-20020a1f1dc7000000b003e1b0283c71mr18275909vkd.10.1674649904041; 
 Wed, 25 Jan 2023 04:31:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXunnK3eKo7KQr2F0B+sF+nOke9s31W3EjxQ/3z2K4tufY9mWqUc6qg/5goQukjGCI0dOGsjqQ==
X-Received: by 2002:a1f:1dc7:0:b0:3e1:b028:3c71 with SMTP id
 d190-20020a1f1dc7000000b003e1b0283c71mr18275849vkd.10.1674649903376; 
 Wed, 25 Jan 2023 04:31:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05620a229800b006eeb3165565sm3320023qkh.80.2023.01.25.04.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:31:42 -0800 (PST)
Message-ID: <f413e1d6-370c-8552-592e-e58187af9bd5@redhat.com>
Date: Wed, 25 Jan 2023 13:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/about/deprecated: Mark HAXM as deprecated
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, wenchao.wang@intel.com
References: <20230125102053.902098-1-thuth@redhat.com>
 <Y9Eb4ZMm0ll4xcM9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y9Eb4ZMm0ll4xcM9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 12:31:50 -0000

On 25/01/2023 13.09, Daniel P. Berrangé wrote:
> On Wed, Jan 25, 2023 at 11:20:53AM +0100, Thomas Huth wrote:
>> The HAXM project has been retired (see https://github.com/intel/haxm#status),
>> so we should mark the code in QEMU as deprecated (and finally remove it
>> unless somebody else picks the project up again - which is quite unlikely
>> since there are now whpx and hvf on these operating systems, too).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 3f4d678eb4..da2e6fe63d 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -93,6 +93,12 @@ form is preferred.
>>   The HPET setting has been turned into a machine property.
>>   Use ``-machine hpet=off`` instead.
>>   
>> +``-accel hax`` (since 8.0)
>> +''''''''''''''''''''''''''
>> +
>> +The HAXM project has been retired (see https://github.com/intel/haxm#status).
>> +Use "whpx" (on Windows) or "hvf" (on macOS) instead.
>> +
> 
> Should we print a warning message from meson when someone enables this ?

Or maybe rather to hax_accel_init() , so that people who run the binary see 
the message?

... I can add it there (though I have no means of testing it).

  Thomas


