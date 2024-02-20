Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcTRR-0006YV-GU
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 11:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcTRP-0006YI-UF
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 11:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcTRO-0005nG-0E
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 11:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708448276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dHgN6htehbmvvuZDouHWcpAbMHuaC2OA4OJX2O18mLw=;
 b=ZdnGmIczKq/7cgnnu23Y1R/7BiN5eYQlXnMHEq3yHvxzqp+7PzKeV9xUeL3OkLi2uXiinQ
 JABw7eJPiV1HPLJ6S9cLmp3I3VQwjMy6jvqmnn1lGq2H+hIlAuAJimAR0SoIXVY7OokkYv
 AjpZOjMLpdrSgkW4+LdeNWMV4kBDvCc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-RgrnsGfFNuiRK66QTPwdGQ-1; Tue, 20 Feb 2024 11:57:55 -0500
X-MC-Unique: RgrnsGfFNuiRK66QTPwdGQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7873276cc38so692342085a.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 08:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708448275; x=1709053075;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dHgN6htehbmvvuZDouHWcpAbMHuaC2OA4OJX2O18mLw=;
 b=YBWQ/sszdjbsdZoS0n6gad2/kxECcqCJw7Vmrdt9ugzHldw+0cRxeYfRQFQbpz6Jm3
 4cl1xLbZT2eVtZOaO7mDPVx0Fy8ctCCvFnptX1KlnnqP4z+WSG0aB1eEDG16o7f5oMDl
 LeDHc4fpGbbQs6T5Ns/T0oQ9ASs7biYH7r2MSApoR0GOys4mVEbo5vWdTQ9rQK6VzxCl
 QDzfBVmjyeAjq1wBQdweW92lL/yebtEjcPsQCu7cG7HUyJi8zqS1pcPfzTlJbsqrwyJG
 45MQsQFavgICyKFIBKpKVBAoj7ok2O1WLNEbWBjwc167cFHVw4HKqW5RnTwRccYp9XQG
 2VHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNqJIVQhlqf+fHnofAkxWxSYJTAaXiS0CVb6gvG2UuhDPaRxNRGkEQw7aEtiidFn+t6ubavY1vY2RS1d8wiupje4Zr2jBj2A==
X-Gm-Message-State: AOJu0YzjGP724FG6L6y3UicLiM4ukAyGbN2fY1TLuwugPGYXi3WHlpbQ
 SR6/tFyAo+ms51SsD8pwGsRa727FmXYZIMyjQgT1QvJsrt+wpePyGMISyw5IsaZ4Pcd4oBDur0W
 EM4Mn/0Jg3yoz2/Yk4d5ESc3795h0uv3rIfoHaxVLm/9KR/mccLXrKGsR/F6vDB0=
X-Received: by 2002:a05:620a:3846:b0:785:9506:213b with SMTP id
 po6-20020a05620a384600b007859506213bmr15273433qkn.73.1708448275277; 
 Tue, 20 Feb 2024 08:57:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8CPnk2cW+8w3lwkw2imlhyySrtW5tzWrpmVeilzyOkvxK/w63dKJG6Gr5oAgoRaURFIeeAA==
X-Received: by 2002:a05:620a:3846:b0:785:9506:213b with SMTP id
 po6-20020a05620a384600b007859506213bmr15273420qkn.73.1708448275010; 
 Tue, 20 Feb 2024 08:57:55 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de.
 [109.43.178.100]) by smtp.gmail.com with ESMTPSA id
 x18-20020a05620a099200b0078728331477sm3535890qkx.13.2024.02.20.08.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 08:57:54 -0800 (PST)
Message-ID: <0ab9b9ce-9327-4112-bb7e-ad191353ccea@redhat.com>
Date: Tue, 20 Feb 2024 17:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest: Don't run the dbus-display-test without
 CONFIG_VGA_PCI
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20240219123900.430943-1-thuth@redhat.com>
 <CAMxuvazmk_cnxUOAsAi1D7=VsT7OkkyNPL6adqqCkwt2LWVscg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAMxuvazmk_cnxUOAsAi1D7=VsT7OkkyNPL6adqqCkwt2LWVscg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 16:58:00 -0000

On 19/02/2024 15.00, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Feb 19, 2024 at 4:39 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> When compiling with "configure --without-default-devices", the
>> dbus-display-test fails since it implicitly assumes that the
>> machine comes with the standard VGA card. Thus add a check to
>> meson.build to disable the test if the VGA card is not available.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Not necessarily VGA, but a graphic or VC console.

Well, the test currently does not use any -device or -vga options, so it 
assumes that the default graphic card is around - which happens to be the 
VGA_PCI card for x86.

> I am not sure how to
> guess from the binary or compilation settings. Maybe it would be
> simpler to check at run-time if /org/qemu/Display1/Console_0 exists. I
> can work on a patch.

That sounds like a more robust solution indeed, so a patch would be very 
welcome!

  Thanks,
   Thomas


>> ---
>>   tests/qtest/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 2b89e8634b..c8e6d7df40 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -108,7 +108,7 @@ qtests_i386 = \
>>      'numa-test'
>>     ]
>>
>> -if dbus_display
>> +if dbus_display and config_all_devices.has_key('CONFIG_VGA_PCI')
>>     qtests_i386 += ['dbus-display-test']
>>   endif
>>
>> --
>> 2.43.2
>>
> 


