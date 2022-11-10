Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot4Jc-0005o2-0D
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 04:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4Ja-0005nK-GC
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 04:57:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4JY-0006yP-Tq
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 04:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668074260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Scbl1bp5XfiaDnXgT0IsOTs8ETs2VVaAkn8rAxavUlo=;
 b=WYK4hht1nWXed6tRBV9GeLKjl+zatoPDQlPHONFxaLtaVxL2mTRDvCvA1hIpZ2qZuNzwBv
 8ZCpaN0OMotRaCIXyay6wRB4eYnZUOJxX9SI1a20CJ0hbs9aM6RVpSykfQVaoVheJi6QnG
 B9J1LRYhU4W7KmvJ/Sn6KoMYiBBrwIE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-yWM3uVjYMzO2W4nhqU7SJg-1; Thu, 10 Nov 2022 04:57:36 -0500
X-MC-Unique: yWM3uVjYMzO2W4nhqU7SJg-1
Received: by mail-pl1-f199.google.com with SMTP id
 u8-20020a17090341c800b0018731b83fe4so1068518ple.16
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 01:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Scbl1bp5XfiaDnXgT0IsOTs8ETs2VVaAkn8rAxavUlo=;
 b=ixYJUCEtAs6sIl41lRAswqWuQEYMkT6wn2jOCPuFnzv5z3NgsbrtJkXH71kBHxmV4S
 Yn/fgclssTUlMccSpdnolWTGg2c4a6irHgTkMDrFAAXKibSU9i5M5B39CtLCfAHhWh3u
 eFC0mP4aTQhgGXfV21Dn5N2eaFbDhZwnxBKYABpSQO9bCtCLi7DXec5NbMSzcKtRUVH1
 Nd80YC5tQMO+HiDUO/g1dssWdMVwKN6QIDo666JPP/IsPwwqKn1vkMlzqA3nxAGibwdc
 TQNNFDtxTXR7j5WZGHOixCVk0cSrfHMFEcpf54DN0aceHXvOrDlzQfaU/uTLGBQvMEtx
 ocaw==
X-Gm-Message-State: ACrzQf3EWfuHn4wmYK+SP82KLf5rpo2he1rT5wLE0HBOd6vIza/MVWIz
 ouyTdbl6j7Lfi6t85P78AjVHjdTXCFtHpwOAKZRAmj8T4xKNfyvaS2GhzJ67KyfT/GzQrKp0Ozi
 5QBw8fLal5G9NLey9tw==
X-Received: by 2002:aa7:81d3:0:b0:563:5c10:6cd6 with SMTP id
 c19-20020aa781d3000000b005635c106cd6mr2279321pfn.53.1668074255758; 
 Thu, 10 Nov 2022 01:57:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4i2qdWL9Ba13EU0jSFkIdCBzfkMVSE9vohVlNqflq7FsQFjPdGv2lwUjB6ecDk0kKoJIYkrQ==
X-Received: by 2002:aa7:81d3:0:b0:563:5c10:6cd6 with SMTP id
 c19-20020aa781d3000000b005635c106cd6mr2279303pfn.53.1668074255447; 
 Thu, 10 Nov 2022 01:57:35 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a1709026f0f00b00181f8523f60sm10733324plk.225.2022.11.10.01.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:57:34 -0800 (PST)
Message-ID: <0b29d9e3-9ce2-633c-1d73-cb5b0b9105ee@redhat.com>
Date: Thu, 10 Nov 2022 10:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
 <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
 <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 10 Nov 2022 09:57:42 -0000

On 10/11/2022 10.49, Philippe Mathieu-Daudé wrote:
> On 10/11/22 09:35, Thomas Huth wrote:
>> On 10/11/2022 06.49, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 9/11/22 18:37, Thomas Huth wrote:
>>>>> If configuring with "--disable-system --disable-user --enable-guest-agent"
>>>>> the linking currently fails with:
>>>>>
>>>>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>>>>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined 
>>>>> reference to `qmp_command_name'
> 
>>>>> Let's make sure that we also compile and link the required files if
>>>>> the system emulators have not been enabled.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> I wonder for how long this has been broken.
>>>
>>> Should we add such a configuration to CI?
>>
>> Some month ago, I'd say: Sure! ... but considering that gitlab now limits 
>> the available CI minutes and that apparently nobody really cares about 
>> this configuration (otherwise someone would have complained about this 
>> earlier), I think it's not that important to have a separate CI test for 
>> this configuration.
> 
> We could eventually add a job restricted to qemu-project CI (not in
> forks).

The problem is: Who's going to create such jobs? Someone needs to write the 
yaml stuff and test it first. And at least I pretty much lost motivation to 
work on new yaml stuff, since this burns my private CI minutes (which I 
rather need for my maintainer duties instead).

  Thomas


