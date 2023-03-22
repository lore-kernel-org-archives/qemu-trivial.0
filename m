Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pexY5-0002Ji-FH
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2023 08:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexY4-0002JL-DI
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 08:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexY2-0005lG-UD
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 08:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679487989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoYZDcts4NPPigQVTA+A5GeGdwQbf9UjsqltNaFuRak=;
 b=ba7yZM3ibamyHVVlMo0I5U15napDHUBfUbqBEZSKSbWIQnVbJ1Z4OW/D22f3dTk9AZbmQg
 UTrEX0nbY7O4YAx4PmtE+NLoqbRRwjuNspSqJ6sQyDFdMkSnF8TKOMnCzVgwc1YjTVDU1f
 O4a9Nj9hxgSGnp9W+3s5ae+xFSJnMHc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-wIr830RPM6GHIxndGpzzJA-1; Wed, 22 Mar 2023 08:26:28 -0400
X-MC-Unique: wIr830RPM6GHIxndGpzzJA-1
Received: by mail-qt1-f199.google.com with SMTP id
 t15-20020a05622a180f00b003e37dd114e3so4010899qtc.10
 for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2023 05:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679487988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qoYZDcts4NPPigQVTA+A5GeGdwQbf9UjsqltNaFuRak=;
 b=NhPQZ2+hrcKiwfMkXSLZeHtNZCN1IQ3leQ/Z0kt7JJKX0GEAhooedtyvbwpXMLkGOB
 84r3z1uq/FUJi3pBW76jC7cfRIklR2beSwa/fcP8jVBk0qloj24KMKNhGkhJ2zZgCy+f
 uB/O/jDagXIxJOLvYT613QfOrn1uWngEoOHq99gn4lx5CndP9cQq8mcR1KrlK3IMQ0qP
 84UxWxthuOgwzLxT9nTzwCCyS5AwN8xKeO+Ibkzd7YYGel5wppxQ9nUXE76KRUEGUS5s
 LHDsYHKffq8C5Z+X1mx0OoWhD3MNttDeTBCA4yvmP2fpuG8au8hUhh3Ncv5wXitl46Fo
 nZCA==
X-Gm-Message-State: AO0yUKWQkrgF1TncjT9KtdR3WhR/9t3nSHH9FS+oymhBTHUbKpRJSxMm
 5YRNSB99BUIsMcwmUkVJ4OFzmsDNB4qp/gPbvCtpVxactXr9/QlTxziwAY6HQzNjY/AQqb934Jz
 iryZPPB18flZHrgoZPg==
X-Received: by 2002:a05:622a:50a:b0:3d3:95fd:9085 with SMTP id
 l10-20020a05622a050a00b003d395fd9085mr4880249qtx.42.1679487988093; 
 Wed, 22 Mar 2023 05:26:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Y7TuLmVkuo1jiM38gsF+Lc2oaiWv8GAaQkGNUZ4Yi3HEt99mdaGN/vtDEHRvvdAuY8tpv/Q==
X-Received: by 2002:a05:622a:50a:b0:3d3:95fd:9085 with SMTP id
 l10-20020a05622a050a00b003d395fd9085mr4880224qtx.42.1679487987884; 
 Wed, 22 Mar 2023 05:26:27 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 j2-20020a378702000000b00746059d9c3fsm11291396qkd.35.2023.03.22.05.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:26:27 -0700 (PDT)
Message-ID: <102b1198-9995-25da-2d49-1dcd11df558f@redhat.com>
Date: Wed, 22 Mar 2023 13:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322110521.59949-1-philmd@linaro.org>
 <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
 <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
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
X-List-Received-Date: Wed, 22 Mar 2023 12:26:36 -0000

On 22/03/2023 13.13, Philippe Mathieu-Daudé wrote:
> On 22/3/23 12:30, Thomas Huth wrote:
>> On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
>>> Include the mingw-w64-x86_64-spice package so SPICE is covered:
>>>
>>>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc 
>>> (Rev10, Built by MSYS2 project) 12.2.0")
>>>    ...
>>>    Run-time dependency spice-protocol found: YES 0.14.4
>>>    Run-time dependency spice-server found: YES 0.15.1
>>>
>>> In particular this would have helped catching the build issue
>>> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
>>
>> Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
>> patch here likely would not have prevented the merging of this bug... for 
>> that, you rather have to add it to .gitlab-ci.d/windows.yml instead.
> 
> It seems we have 2 jobs doing the same testing (even same version,
> msys2-base-x86_64-20220603.sfx.exe). Does it make sense to maintain
> both? At least with GitLab we notice a failure.

We can test more things (targets) in the Cirrus-CI job since the build 
machines are way more powerful there ... but yes, since people rarely look 
at this output, it's maybe better to disable them and focus on the gitlab-CI 
jobs instead.

  Thomas


