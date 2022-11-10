Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot2yn-0002ia-Iv
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 03:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot2yi-0002i7-6p
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot2yg-00038M-HM
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFk+uOvePePducUXaZeu4GHxGs0dtk98peYuso2lFYE=;
 b=dnNsfTXYAzCRdcK+CADXVsCA1ETHwhFo3HD0fef1xAeCmGM5R1XMwmPZD5n9LdDlwvsOD0
 4S/M/67x1F9jyxh7vVJl4fNpvyN8IizKTJRuEmaJNL+jLIYDaQR0Y/8pM6wf8XrwNxRWpi
 mSV+1I1By4FDwMH/5nSRDgUn2SrBH9E=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-9jesc-YeMnWIfe9LVNvOmg-1; Thu, 10 Nov 2022 03:31:59 -0500
X-MC-Unique: 9jesc-YeMnWIfe9LVNvOmg-1
Received: by mail-pg1-f200.google.com with SMTP id
 a33-20020a630b61000000b00429d91cc649so666474pgl.8
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 00:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eFk+uOvePePducUXaZeu4GHxGs0dtk98peYuso2lFYE=;
 b=sF4RzI74CnfGczdYbuOIDVaHK9xuogGIfoGnvRdhdtEn9JER5O4cIneix2vxj8H01f
 3umZLEuyn0SyXn8M8t7PV+mQrDXD97qle1GtLyvvdyeTi2j/7PgyCoNF0zEy3NF4Pta6
 oATBN+P7DjeZWftGW+hCxOWs6HRnlToH5BNv/dRO/BJpgzUyIQk6AbhoF5VLElwvIsPe
 Sv9donnK5kN61EZz9HUqwwZBB7ffOA365DLxxKv6YwFUhmAcneH+cIM5S5BHUPQYqS4P
 neLhi12bG5R+DpOGMJbdkPd9D4Y8VHFjiif2L2uJW9PfJCECkuHsSsshgKG3FQSgW2p6
 VzeQ==
X-Gm-Message-State: ACrzQf2Tk/0pBxd+E2IndxMgKS667renlF+wYPB4yVpIUlUcylJGUNed
 GbvZBWywaCev4EAfdGoY4xPDLQNWnaR14bXfukUfyipIijB/nELzuVHVxrUXp0dCOyJ6GEJ/yfk
 FRfFnxU1Qo2gVL0InrA==
X-Received: by 2002:a63:194b:0:b0:457:7295:8de0 with SMTP id
 11-20020a63194b000000b0045772958de0mr55788224pgz.612.1668069118522; 
 Thu, 10 Nov 2022 00:31:58 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5pvZQanjZShdcO3Dzx3Tv/Pu2r9yiFN4pv24n4Ij4cY3ZtF90dv0t2dR8Sp4tQdKHmsY88AA==
X-Received: by 2002:a63:194b:0:b0:457:7295:8de0 with SMTP id
 11-20020a63194b000000b0045772958de0mr55788209pgz.612.1668069118229; 
 Thu, 10 Nov 2022 00:31:58 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b0017f5c7d3931sm10551154plf.282.2022.11.10.00.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:31:57 -0800 (PST)
Message-ID: <d7bd4f37-0f0f-b191-e813-ea6ed4cad309@redhat.com>
Date: Thu, 10 Nov 2022 09:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Nov 2022 08:32:04 -0000

On 09/11/2022 22.56, Philippe Mathieu-Daudé wrote:
> On 9/11/22 18:37, Thomas Huth wrote:
>> If configuring with "--disable-system --disable-user --enable-guest-agent"
>> the linking currently fails with:
>>
>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference 
>> to `qmp_command_name'
>> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference 
>> to `qmp_command_is_enabled'
>> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference 
>> to `qmp_has_success_response'
>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
>> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference 
>> to `qmp_for_each_command'
>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
>> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference 
>> to `qbase64_decode'
>> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined 
>> reference to `unix_listen'
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined 
>> reference to `socket_parse'
>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined 
>> reference to `socket_listen'
>> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
>> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined 
>> reference to `qbase64_decode'
>>
>> Let's make sure that we also compile and link the required files if
>> the system emulators have not been enabled.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   qapi/meson.build  | 2 +-
>>   stubs/meson.build | 2 +-
>>   util/meson.build  | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
>> diff --git a/util/meson.build b/util/meson.build
>> index 59c1f467bb..b260539bd5 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -68,7 +68,7 @@ if have_system
>>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>>   endif
>> -if have_block
>> +if have_block or have_ga
>>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>>     util_ss.add(files('base64.c'))
>>     util_ss.add(files('buffer.c'))
> 
> This can be eventually reduced for 'have_ga':
> 
> -- 8< --
> diff --git a/util/meson.build b/util/meson.build
> index 59c1f467bbe..690e8be903e 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -68,28 +68,30 @@
>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>   endif
> 
> -if have_block
> +if have_block or have_ga
>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))

Thanks for the idea! By breaking up the lines that contain multiple files, 
it seems that it can even be refined further.
I'll send a v2.

  Thomas


