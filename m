Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qb1vk-0000pv-3k
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2023 12:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qb1vh-0000pM-7Y
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 12:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qb1ve-0002gZ-SZ
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 12:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693327857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h71fk5FA2SjTTzNQ1kfZTcLkzqkZwNoaDZKM20DJOiU=;
 b=WqURa7z/HbaURlTcdzPTMk169FuBdZbF1Wsgycr2eU3MlmC6hQmDB0zazmxSsx0AafaplX
 H0mSJhsRsKrybaDZp8WITkwBGQgYi1Y2PeEAAVoNu1J4CXNyEXINkxSwXxSoPjn1pbaFXh
 uR0YCd2ew8dkFRkEZUf1FTJXqsjs1uQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-EP5KL3Z-OXGiT1fJ2k8vDw-1; Tue, 29 Aug 2023 12:50:56 -0400
X-MC-Unique: EP5KL3Z-OXGiT1fJ2k8vDw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52a3e9c53e7so3732979a12.3
 for <qemu-trivial@nongnu.org>; Tue, 29 Aug 2023 09:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327855; x=1693932655;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h71fk5FA2SjTTzNQ1kfZTcLkzqkZwNoaDZKM20DJOiU=;
 b=cr864ENbx3LrpuJ98euRDsnb+zI0W9okgOqDkQlmwAh3vjXtg5VzxnofTcwnDlTn+g
 A6MYjQjSWzBwgyqUYolzFujU5gwa2lzzTxR+jo4lbL6IECqGdnI9KosjnOOem3UnzuOy
 nQbPFNmZBWLJlx5hOuSVudvlNbNZwEn1x2hrKuVtaKDrinSRBQnzYSMEJDtz6lC1HtZP
 +1DpW821nkJ66H25Cit8YL2TamspftnAh5YrpaTzmBAnRXg8eT4UI/eH0arXnsYfeOKc
 XlUW845KWsJQK2+lpBv+Gq50PG+AN/Rn5syGe00I1/dbwVU1akfuvF5JvaFZgYH6OagH
 Ei3Q==
X-Gm-Message-State: AOJu0Yzv2+9K5cRGScCU3CPyCylBf9RoiD4F1ROtV55uhuJWZw7oYJsc
 xao8CTimJG04nm3EXtAFlZ3O17xhjoI5xfkeY7tPyirQ+uOTj6Ij312uuq8mA4VM49y9nzeHu2Z
 eqHYbXUZ6SVzxBhCcYg==
X-Received: by 2002:aa7:d952:0:b0:523:b133:5c7e with SMTP id
 l18-20020aa7d952000000b00523b1335c7emr24789542eds.1.1693327855303; 
 Tue, 29 Aug 2023 09:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfPhnzSQLrHZR+pJUgThSWWGKcvK/b/Y1N8K9PbMjRWaBOlDx9XKULW7lRzxy82zEJ84XqgA==
X-Received: by 2002:aa7:d952:0:b0:523:b133:5c7e with SMTP id
 l18-20020aa7d952000000b00523b1335c7emr24789529eds.1.1693327855025; 
 Tue, 29 Aug 2023 09:50:55 -0700 (PDT)
Received: from [192.168.8.103] (tmo-100-120.customers.d1-online.com.
 [80.187.100.120]) by smtp.gmail.com with ESMTPSA id
 f15-20020a50ee8f000000b0051e2670d599sm5889994edr.4.2023.08.29.09.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 09:50:54 -0700 (PDT)
Message-ID: <7b5b2929-0353-c635-5f79-c12fb80a50ac@redhat.com>
Date: Tue, 29 Aug 2023 18:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] qemu-options.hx: Rephrase the descriptions of the -hd*
 and -cdrom options
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20230829132948.51053-1-thuth@redhat.com>
 <87jztdu7fo.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87jztdu7fo.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.242, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Aug 2023 16:51:01 -0000

On 29/08/2023 18.39, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The current description says that these options will create a device
>> on the IDE bus, which is only true on x86. So rephrase these sentences
>> a little bit to speak of "default bus" instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   qemu-options.hx | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 29b98c3d4c..a7ce5f0f7a 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1209,10 +1209,10 @@ SRST
>>   ERST
>>   
>>   DEF("hda", HAS_ARG, QEMU_OPTION_hda,
>> -    "-hda/-hdb file  use 'file' as IDE hard disk 0/1 image\n", QEMU_ARCH_ALL)
>> +    "-hda/-hdb file  use 'file' as hard disk 0/1 image\n", QEMU_ARCH_ALL)
>>   DEF("hdb", HAS_ARG, QEMU_OPTION_hdb, "", QEMU_ARCH_ALL)
>>   DEF("hdc", HAS_ARG, QEMU_OPTION_hdc,
>> -    "-hdc/-hdd file  use 'file' as IDE hard disk 2/3 image\n", QEMU_ARCH_ALL)
>> +    "-hdc/-hdd file  use 'file' as hard disk 2/3 image\n", QEMU_ARCH_ALL)
>>   DEF("hdd", HAS_ARG, QEMU_OPTION_hdd, "", QEMU_ARCH_ALL)
>>   SRST
>>   ``-hda file``
>> @@ -1222,18 +1222,22 @@ SRST
>>   ``-hdc file``
>>     \
>>   ``-hdd file``
>> -    Use file as hard disk 0, 1, 2 or 3 image (see the :ref:`disk images`
>> -    chapter in the System Emulation Users Guide).
>> +    Use file as hard disk 0, 1, 2 or 3 image on the default bus of the
>> +    emulated machine (this is for example the IDE bus on most x86 machines,
>> +    but it can also be SCSI, virtio or something else on other target
>> +    architectures). See al the :ref:`disk images` chapter in the
>>   System
> 
> See also?

Drat, yes, that was a typo.

>> +    Emulation Users Guide.
>>   ERST
>>   
>>   DEF("cdrom", HAS_ARG, QEMU_OPTION_cdrom,
>> -    "-cdrom file     use 'file' as IDE cdrom image (cdrom is ide1 master)\n",
>> +    "-cdrom file     use 'file' as CD-ROM image\n",
>>       QEMU_ARCH_ALL)
>>   SRST
>>   ``-cdrom file``
>> -    Use file as CD-ROM image (you cannot use ``-hdc`` and ``-cdrom`` at
>> -    the same time). You can use the host CD-ROM by using ``/dev/cdrom``
>> -    as filename.
>> +    Use file as CD-ROM image on the default bus of the emulated machine
>> +    (which is IDE1 master on x86, so you cannot use ``-hdc`` and ``-cdrom``
>> +    at the same time there). On systems that support it, you can use the
>> +    host CD-ROM by using ``/dev/cdrom`` as filename.
>>   ERST
>>   
>>   DEF("blockdev", HAS_ARG, QEMU_OPTION_blockdev,
> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!

  Thomas



