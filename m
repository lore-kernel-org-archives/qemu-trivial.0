Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot32S-0004MV-OJ
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 03:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot32I-0004Lh-Tq
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot32F-0006BK-Fp
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tscDa6AmG9WbHj2MOjQ0frbeGfMOMs/REQUmYYKUHKw=;
 b=bAJG+K2Ag9SzP5Ow/usmZlCHqNtAjLPPcObyfyYVS2DnHR4nuShUAGeHd3+sYNp6Eg3Z6B
 nqki1wGbhSdS72CMasDPKnOFfqjqIriGGs9G84+v1MhI+PW0NljT9f7o50TpiwBMVdxOt9
 CWdHpQXwimN2d5s2sTivqJnetxE4Nog=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-fbCSxM_yOPKahs9kug3Y3g-1; Thu, 10 Nov 2022 03:35:40 -0500
X-MC-Unique: fbCSxM_yOPKahs9kug3Y3g-1
Received: by mail-pl1-f200.google.com with SMTP id
 t3-20020a170902e84300b00186ab03043dso948068plg.20
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 00:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tscDa6AmG9WbHj2MOjQ0frbeGfMOMs/REQUmYYKUHKw=;
 b=T9NY2cIqauHleZeTwwq82+PhTrqpd6O8CoFRLP+md3yzlIrNhs31APNBp0EoLuRh8d
 s8P5v2agTjm9yqFD5StXIMpEjSNk1bDx0jZV8YBKzczJ9O3P2KZUu/hN5j81nFwd5+eM
 vlme45i+pVbn6ZcLuh8IaRB+1MYoNyUtmlTnPHzSY4iYItHYdlWtAtE47XrK5BZhHbRl
 FoAvYEbZNfTMO8YkVB3aTyIfSwMrQpFmgW6M0PRHpgZVubf3NX9vl6u6B+CL2qPukGUO
 ylOdyihu8b/vFpJTfIKi9Kxdyc1eFQI5KGT1IPONcA6LIehSOnQMRwOJlO6WYKM+208h
 dtaQ==
X-Gm-Message-State: ACrzQf2A2MUnxZzVuNx8Kk8A/30uzyZzOtcGlangvELplf6kCUF+mjIx
 +cD/+9Rb9aPaYVJKgJCXBVmKoo7ijYUzAfgxYz7p/AlKq8OvEhpqP38tRorY8gXDpCf8gJElN+K
 9rCzThLOdoSf5Zk9vDA==
X-Received: by 2002:a63:8bc2:0:b0:46f:5bbb:7370 with SMTP id
 j185-20020a638bc2000000b0046f5bbb7370mr55300572pge.70.1668069339018; 
 Thu, 10 Nov 2022 00:35:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5UNF8I+ZxmGdEIkxEfkzjX23o9fgKXenC6zGBMkfyQqaSQ3xYwnl/6fFopP1Qzta4dHF4OAw==
X-Received: by 2002:a63:8bc2:0:b0:46f:5bbb:7370 with SMTP id
 j185-20020a638bc2000000b0046f5bbb7370mr55300561pge.70.1668069338714; 
 Thu, 10 Nov 2022 00:35:38 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l65-20020a622544000000b0056be4dbd4besm9634865pfl.111.2022.11.10.00.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:35:38 -0800 (PST)
Message-ID: <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
Date: Thu, 10 Nov 2022 09:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wn83jr54.fsf@pond.sub.org>
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
X-List-Received-Date: Thu, 10 Nov 2022 08:35:52 -0000

On 10/11/2022 06.49, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 9/11/22 18:37, Thomas Huth wrote:
>>> If configuring with "--disable-system --disable-user --enable-guest-agent"
>>> the linking currently fails with:
>>>
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
>>> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
>>> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
>>> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
>>> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
>>> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
>>> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
>>> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
>>> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'
>>>
>>> Let's make sure that we also compile and link the required files if
>>> the system emulators have not been enabled.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I wonder for how long this has been broken.
> 
> Should we add such a configuration to CI?

Some month ago, I'd say: Sure! ... but considering that gitlab now limits 
the available CI minutes and that apparently nobody really cares about this 
configuration (otherwise someone would have complained about this earlier), 
I think it's not that important to have a separate CI test for this 
configuration.

  Thomas


