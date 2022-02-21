Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nM3r7-0000kR-DX
	for mharc-qemu-trivial@gnu.org; Mon, 21 Feb 2022 03:15:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM3r5-0000jd-F8
 for qemu-trivial@nongnu.org; Mon, 21 Feb 2022 03:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM3r1-0005i6-A6
 for qemu-trivial@nongnu.org; Mon, 21 Feb 2022 03:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645431329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6t+uoL6JPH8TzL15a4c6e+cPi/heScmHTMJwgqeK0BI=;
 b=P51KOImstUj9JHbaMUyqodnXNdV3afOEZjvVOdgN1j+JCQvGI1ptx+v/KyxyXUB/xnw7m5
 /wTBnBV6KcmJp/5X0XOr61r4viOOCjxnEIEpX1dggOIB8Oy4e9c+f4AnfpvsNKXpvCEIek
 BrFrfnZ58I7s/iHIHbI/BXicIOeZo3s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-4MU8urshMviujjWJTP4M9A-1; Mon, 21 Feb 2022 03:15:19 -0500
X-MC-Unique: 4MU8urshMviujjWJTP4M9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso4128045wmz.0
 for <qemu-trivial@nongnu.org>; Mon, 21 Feb 2022 00:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6t+uoL6JPH8TzL15a4c6e+cPi/heScmHTMJwgqeK0BI=;
 b=mGNW0KA3zQlFL0Cvt0FNlJiw0YN7VrG4NnCoJkpmsR0HBCGdBiLmHJsiSuLKzqlKZf
 JgxNW8PpHqwPATrGoyn8Byf2w9DbDG7ektTk3F9A4RJDDwLmEE3dR7bZ2jQ80S5WM3Hz
 3wgfu40sFLM0OvWCrp+tcshOjAOqEg2VCLz7GuYcrRq+Q0qZiv1SRwrAtdu2bIEN763Y
 N7RjlLhi7fWCfRtWwdONrtHE/gKd1uknFb3Ii8eldJmgnzRMkS2RMXOSlxl6GJK+grHX
 QCJE291Plp2KuPZLP91l2AIOLvjpYD+Stp+MArQZBWK7wiwMWSq8dTosCDKy7533222y
 tOqg==
X-Gm-Message-State: AOAM533rFTHuz98Rwwjqf4eVwMw3gurefWzEXQOevdXZVUi09IznGlLN
 SIdIom9Tv9nywdVXuu4IntdeVYqUNffS5kNkJ9luu7STQLq/kvSg8BAZovqp4PC3R/JNO9iJOC9
 sxVTOOsOkZcoWWrktqw==
X-Received: by 2002:a7b:ca45:0:b0:37b:e8cf:8ebb with SMTP id
 m5-20020a7bca45000000b0037be8cf8ebbmr20204527wml.72.1645431318413; 
 Mon, 21 Feb 2022 00:15:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHcZbQERNxqIEZH4VvQNc6msz+NjeImN2Y2gkxjtXNu7kACH0zFSIbOKrwB+Jux19wLrnkYA==
X-Received: by 2002:a7b:ca45:0:b0:37b:e8cf:8ebb with SMTP id
 m5-20020a7bca45000000b0037be8cf8ebbmr20204507wml.72.1645431318057; 
 Mon, 21 Feb 2022 00:15:18 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q76sm7311522wme.1.2022.02.21.00.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 00:15:17 -0800 (PST)
Message-ID: <2a62c617-0d4c-3560-1ff1-5b6bf79b0321@redhat.com>
Date: Mon, 21 Feb 2022 09:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: Alexander von Gluck IV <kallisti5@unixzen.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <2d597b24-2b00-3e4c-27ed-3265a38a48a6@redhat.com>
 <20220216154208.2985103-1-kallisti5@unixzen.com>
 <dd3cfc5c9d69795b2e5be9b536066f8f@unixzen.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dd3cfc5c9d69795b2e5be9b536066f8f@unixzen.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 08:15:35 -0000

On 16/02/2022 19.12, Alexander von Gluck IV wrote:
> February 16, 2022 10:26 AM, "Thomas Huth" <thuth@redhat.com> wrote:
>> On 16/02/2022 16.42, Alexander von Gluck IV wrote:
>>
>>> ---
>>> tests/vm/haiku.x86_64 | 8 ++++----
>>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
>>> index 2eb736dae1..936f7d2ae2 100755
>>> --- a/tests/vm/haiku.x86_64
>>> +++ b/tests/vm/haiku.x86_64
>>> @@ -2,7 +2,7 @@
>>> #
>>> # Haiku VM image
>>> #
>>> -# Copyright 2020 Haiku, Inc.
>>> +# Copyright 2020-2022 Haiku, Inc.
>>> #
>>> # Authors:
>>> # Alexander von Gluck IV <kallisti5@unixzen.com>
>>> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>>> name = "haiku"
>>> arch = "x86_64"
>>>> - link =
>>> "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
>>> - csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
>>> + link =
>>> "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
>>> + csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
>>>> poweroff = "shutdown"
>>>> @@ -99,7 +99,7 @@ class HaikuVM(basevm.BaseVM):
>>>> self.print_step("Extracting disk image")
>>>> - subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
>>> + subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"],
>>> stdout=open(img, 'wb'))
>>>> self.print_step("Preparing disk image")
>>
>> Thank you very much for the quick fix, that indeed helps to compile-test Haiku again! (the unit
>> tests are failing, though, but IIRC that was already the case before)
>>
>> Tested-by: Thomas Huth <thuth@redhat.com>
> 
> Thanks!
> 
> Sorry for forgetting about it.   I hand release Vagrant images for Haiku after major releases
> and generally forget to update them until ~6 months after a major release as there aren't many users.
> 
> I don't have commit access to qemu so will need someone else to push when the time comes.

  Hi,

I think this could either go through the qemu-trivial tree, or I can pick it 
up and take it through my "testing" tree.

But I just noticed that your patch lacks the "Signed-off-by" line ... so for 
the records (it's required for the rules, see
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line 
)
could you either please reply with a "Signed-off-by" line to your original 
patch, or repost the whole patch as a v2 with the S-o-b included? Thanks!

  Thomas


