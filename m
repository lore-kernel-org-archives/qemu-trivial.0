Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljNS6-0000zX-3I
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 10:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNS4-0000yD-E5
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 10:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNS1-0001NQ-Ea
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 10:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ffut/mwT0skBaBHfa0WOn3fo4Z7Y5/8YJd6XXkw9TpU=;
 b=PPgDj8Hh9bnsWPpMoKiUez6lDSQpR9Gz93yhw4W+sdI+3Q48E5NoT1P8mkxE84pgYLfe+M
 iN50b7batUHbIRieY7jZr0wW5hvE+tlcLE5R0Ms27HBzGz8vRBeZwQMkhCewn+NjqA0qmf
 lsJsMuQ+XUdZlr5rhdjIyLBnk7FlPLQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-6GxVWdx2NomTJkb6dOMY1A-1; Wed, 19 May 2021 10:45:31 -0400
X-MC-Unique: 6GxVWdx2NomTJkb6dOMY1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1604829wml.6
 for <qemu-trivial@nongnu.org>; Wed, 19 May 2021 07:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ffut/mwT0skBaBHfa0WOn3fo4Z7Y5/8YJd6XXkw9TpU=;
 b=Yd3ifCvZA83W2aet2h0zs95naPpgy70V+RgW22ssEiIlmzazCh6djlgpOO5KB9c2TS
 hNePi1FaiG4sLbanKxmrS5m5MtqdC/xAVIx93C73HSUebZvj6gQklSDzyLNk8q7D835A
 SZg7yz1FQVDT3WEKCGUlMqfjJXiWKBwBTI2Wp7w8VPm19sw2n3PMIFo6kD7yJd1opL20
 ISUCpbYGizRA8kcr9AM4yRXBBUIX41jrT7ZLqtYUtoIR6ZbbMjZYzUyGTPD5pBjVkfdh
 wqFmsA+JJFq/hZbtBWaShC5GDc0sASKSbRmQubSoNhfGBPgGC0vg5rinLNOupLvoYn/b
 wDhg==
X-Gm-Message-State: AOAM532Lqg5iaK3Cesr7+RvhihqsL2dwk5NnO+Mb5EebI32xRRpWIhMd
 6xB6XTeHSJGEl2Ki7k8AGB9yWtel/fNNBwT31Zi46/jABLqShGSq334M/H6W8dMQPCgistrI/yN
 tONmYIjEfhnxAyEf5egltmvIn4qT5MAJQA+NDPE2cCQVMTS6rhHgUbROcSPEpHv2ZHnTxEw==
X-Received: by 2002:adf:f788:: with SMTP id q8mr14935235wrp.205.1621435529511; 
 Wed, 19 May 2021 07:45:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0ffvm1B2j5x6rjRzifV51UAXsepm+E6BEUX54tLjpRXJi2j1xm6LbryYwXzDBZJCZJZ+T7Q==
X-Received: by 2002:adf:f788:: with SMTP id q8mr14935210wrp.205.1621435529316; 
 Wed, 19 May 2021 07:45:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r2sm27461657wrv.39.2021.05.19.07.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:45:27 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Avoid error messages about missing
 *-config-*.h files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210519113840.298174-1-thuth@redhat.com>
 <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b2b2db19-8ef7-50f5-d715-b24c17b99a5a@redhat.com>
Date: Wed, 19 May 2021 16:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
X-List-Received-Date: Wed, 19 May 2021 14:45:36 -0000

On 19/05/21 14:35, Philippe Mathieu-Daudé wrote:
> On 5/19/21 1:38 PM, Thomas Huth wrote:
>> When compiling with --disable-system there is a harmless yet still
>> annoying error message at the end of the "configure" step:
>>
>>   sed: can't read *-config-devices.h: No such file or directory
>>
>> When only building the tools or docs, without any emulator at all,
>> there is even an additional message about missing *-config-target.h
>> files.
>>
>> Fix it by checking whether any of these files are available before
>> using them.
>>
>> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
>> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Use ":>" instead of "touch" as suggested by Philippe
>>
>>   configure | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Queued, thanks.

Paolo


