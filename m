Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q662n-0006j4-47
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2023 04:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q662j-0006b1-42
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q662h-0005AV-7s
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685955502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qAuoAjxG4o6HfAcRESp999U6wB5igrIh18IQZNzTZM=;
 b=U+0+hURrsz4BJ2RiCgRDUKUnWTuZcODhBJ7wDHfySf0IcPfq+dEzLsltDSDy8ou5I51lCk
 5OkPxixBKTVLm++0y5kuEoXQN46UvtsVBiLeUlttK3ef2A7hW4OaWhafBF/JfYLyMjEsDv
 GIL4r4u0dTq7vkvmYIP5xD+7YaPKYfw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-6i2GBjrPMEKUmMeDzFXiyg-1; Mon, 05 Jun 2023 04:58:21 -0400
X-MC-Unique: 6i2GBjrPMEKUmMeDzFXiyg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-75d556224e7so105405985a.1
 for <qemu-trivial@nongnu.org>; Mon, 05 Jun 2023 01:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685955501; x=1688547501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3qAuoAjxG4o6HfAcRESp999U6wB5igrIh18IQZNzTZM=;
 b=CZm90GFOpg67swuhFAGM/59bpMKf6qIRLzbnEHnoqKecpkkobatYgH5jnnl2NmUPW0
 6qXAzIicpEKHSCYTjvldzRatn3ySHK30Rpb0QIt5CPaLyxBCMK765fsP4KnO7yJRN6P4
 KQYj2vDvwqJ5FyauOCgNe3oYKrUmoqRCxPbbHPkx1tCvuEWXPvhAETU58qWuA+RPFaOD
 G+hAcEFXE542yymnHDukweeKwKEvmSW6JycODf2dQqozEsFOl64OB6xrupG2SEmw8HyW
 ewvOtIMh6y8eCgHoNdeQ4nNlp1oM66sFTJ72Yyna8VStvgzO1qmkIBNOgNMyfO/K0pDH
 Mp0w==
X-Gm-Message-State: AC+VfDzvL2QZ+NGiql3uPQMaEnHdChx+TPmtT4BtUAR5672NHr6grvMw
 2Ix6feOnbHhnwPltg61MnyOltszlaFaHJCLjaMS7Qua4UHcIwZPDZO2ZrNBdEXqXna6GWDH2zTD
 z564QvzRYoWKkdzbMyw==
X-Received: by 2002:a05:6214:1243:b0:623:8925:b225 with SMTP id
 r3-20020a056214124300b006238925b225mr7085530qvv.39.1685955500895; 
 Mon, 05 Jun 2023 01:58:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Z908yQH2A3qX/5493SpEoANHuwVdeGcONJoEOUtlRpmAYWJEIYtaitZhpcLJ7NeKTLPCZfQ==
X-Received: by 2002:a05:6214:1243:b0:623:8925:b225 with SMTP id
 r3-20020a056214124300b006238925b225mr7085516qvv.39.1685955500649; 
 Mon, 05 Jun 2023 01:58:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-143.web.vodafone.de.
 [109.42.115.143]) by smtp.gmail.com with ESMTPSA id
 y15-20020a0ce04f000000b006238d903f9bsm4490437qvk.42.2023.06.05.01.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 01:58:20 -0700 (PDT)
Message-ID: <96223e15-c17e-21f5-3ed4-464e3055d332@redhat.com>
Date: Mon, 5 Jun 2023 10:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] meson.build: Use -Wno-undef only for SDL2 versions
 that need it
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-trivial@nongnu.org
References: <20230602163452.521305-1-thuth@redhat.com>
 <ZH2ic6zsehZzRC/u@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZH2ic6zsehZzRC/u@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 05 Jun 2023 08:58:28 -0000

On 05/06/2023 10.53, Daniel P. Berrangé wrote:
> On Fri, Jun 02, 2023 at 06:34:52PM +0200, Thomas Huth wrote:
>> There is no need to disable this useful compiler warning for
>> all versions of the SDL. Unfortunately, various versions are
>> buggy (beside SDL 2.0.8, the version 2.26.0 and 2.26.1 are
>> broken, too, see https://github.com/libsdl-org/SDL/issues/6619 ),
>> but we can use a simple compiler check to see whether we need
>> the -Wno-undef or not.
>>
>> This also enables the printing of the version number with
>> good versions of the SDL in the summary of the meson output
>> again.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Compile test code instead of hard-coding the version number
>>
>>   meson.build | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index a61d3e9b06..a4c69616c3 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1273,10 +1273,16 @@ if not get_option('sdl').auto() or have_system
>>     sdl_image = not_found
>>   endif
>>   if sdl.found()
>> -  # work around 2.0.8 bug
>> -  sdl = declare_dependency(compile_args: '-Wno-undef',
>> -                           dependencies: sdl,
>> -                           version: sdl.version())
>> +  # Some versions of SDL have problems with -Wundef
>> +  if not cc.compiles('''
>> +                     #include <SDL.h>
>> +                     #include <SDL_syswm.h>
>> +                     int main(int argc, char *argv[]) { return 0; }
>> +                     ''', dependencies: sdl, args: '-Wundef')
> 
> Don't you need to pass '-Werror' there too, otherwise -Wundef will
> merely generate an warning and still succeed.

Of course! Thank you very much ... not sure how I could have missed that 
detail :-/

  Thomas


