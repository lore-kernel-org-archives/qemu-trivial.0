Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxQWK-0002Ft-Ip
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 04:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxQWJ-0002FD-2e
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 04:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxQWH-0004tw-Fi
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 04:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639560252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7GItwXEEqgm32uYXY/iBPZyxXywvBQUKjMJW0AEFig=;
 b=LYyOk9EfDQitHVx1vYGwQ+BkEtBMHICIgXDP0w01GOZBL1z500vlr3ClE28C3H7pcw1IyO
 jpNoCuTmu/cmqqfXI46ae9LttTwwbX7k2ls+4LdBTYEd86zkJMfr9/T0cXi66WGS/tRHEC
 RMAxj5VR3IKEHjwgJjo70opT7chqjKo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-nwJfrDTdP9Ovhk2Y16I9Mg-1; Wed, 15 Dec 2021 04:24:11 -0500
X-MC-Unique: nwJfrDTdP9Ovhk2Y16I9Mg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so5690905wro.19
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 01:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=h7GItwXEEqgm32uYXY/iBPZyxXywvBQUKjMJW0AEFig=;
 b=yUXPwN6Q789Sde+58xj+CMMtJeYKVO/OHZAK6GYvn5g5dF7XxtMEqubPz9aG4JWm9b
 adFj+e+WaCLSVpgIRxmNusG7sTtoPsZ0b19TYA1op7ou9M1h16/WQr32OPye1G/G2fm7
 jgK9ucrmfMKnqhxeyC+xrfvBi+ZsBsh0K7kKqsFpQ2ZODmkJefFT4To+l2N6Al7sY3nL
 rZ3LIR00JUa5zbXybrmt7l5N0kNI5cqUP2oKzS2V7/8Kk+S1xyha+FxGJ9pg8rmy08ZI
 O0p3Y4YHL6mlkimSpzCRI+4N8gCucewC3C54lM/nYW+ur5Fu2zHMmhYBvSqKiawPzP87
 aIzw==
X-Gm-Message-State: AOAM5329445wXg28T+Wa800PMFZCRYFTVbm1Twn6Q8l/WsgGGbql/UhS
 LpPhCrx6xhejxfSST9U4F7Lm7JSFbp5lCQhMz2s5oCV8xDNwhw5+CFMRDD1YkXEzAQ0dXv9c7jo
 I7tq77yP+Tc4Um4HPqQ==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr3702267wrz.147.1639560250521; 
 Wed, 15 Dec 2021 01:24:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9SZU1dDYxxS1+LzDGT701yjTJbr1Vdsesx68isB/5q5BxGk1nK5ISuW/pvO7qO70iQXMoAw==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr3702248wrz.147.1639560250259; 
 Wed, 15 Dec 2021 01:24:10 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id a10sm5001769wmq.27.2021.12.15.01.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:24:09 -0800 (PST)
Message-ID: <a65f46ef-85a3-03aa-6dfc-71bf83147288@redhat.com>
Date: Wed, 15 Dec 2021 10:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, libvir-list@redhat.com
References: <20211215082417.180735-1-thuth@redhat.com>
 <878rwm5j1z.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qemu-options: Remove the deprecated -no-quit option
In-Reply-To: <878rwm5j1z.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 15 Dec 2021 09:24:19 -0000

On 15/12/2021 10.11, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> This option was just a wrapper around the -display ...,window-close=off
>> parameter, and the name "no-quit" is rather confusing compared to
>> "window-close" (since there are still other means to quit the emulator),
>> so let's remove this now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst       | 6 ------
>>   docs/about/removed-features.rst | 7 +++++++
>>   qemu-options.hx                 | 8 --------
>>   softmmu/vl.c                    | 8 +-------
>>   4 files changed, 8 insertions(+), 21 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 7f12f53713..6f85afdee4 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -134,12 +134,6 @@ specified.
>>   Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
>>   an underscore between "window" and "close").
>>   
>> -``-no-quit`` (since 6.1)
>> -''''''''''''''''''''''''
>> -
>> -The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
>> -should be used instead.
>> -
>>   ``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
>>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>   
>> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
>> index f92b8bd738..380a1b30ea 100644
>> --- a/docs/about/removed-features.rst
>> +++ b/docs/about/removed-features.rst
>> @@ -330,6 +330,13 @@ RISC-V firmware not booted by default (removed in 5.1)
>>   QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``
>>   for the RISC-V ``virt`` machine and ``sifive_u`` machine.
>>   
>> +``-no-quit`` (removed in 7.0)
>> +'''''''''''''''''''''''''''''
>> +
>> +The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
>> +should be used instead.
>> +
>> +
>>   QEMU Machine Protocol (QMP) commands
>>   ------------------------------------
>>   
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index ae2c6dbbfc..e2b73f6e5d 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2002,14 +2002,6 @@ SRST
>>       ``-display sdl,grab-mod=rctrl`` instead.
>>   ERST
>>   
>> -DEF("no-quit", 0, QEMU_OPTION_no_quit,
>> -    "-no-quit        disable SDL/GTK window close capability (deprecated)\n", QEMU_ARCH_ALL)
>> -SRST
>> -``-no-quit``
>> -    Disable window close capability (SDL and GTK only). This option is
>> -    deprecated, please use ``-display ...,window-close=off`` instead.
>> -ERST
>> -
>>   DEF("sdl", 0, QEMU_OPTION_sdl,
>>       "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
>>   SRST
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1367..163ab355f5 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1938,7 +1938,7 @@ static void qemu_create_early_backends(void)
>>                        "for SDL, ignoring option");
>>       }
>>       if (dpy.has_window_close && !use_gtk && !use_sdl) {
>> -        error_report("-no-quit is only valid for GTK and SDL, "
>> +        error_report("window-close is only valid for GTK and SDL, "
>>                        "ignoring option");
>>       }
>>   
> 
> Bonus: the error message in now in terms of the non-deprecated
> interface.  Suggest to mention this in the commit message.
> 
> Sadly, it lacks context:
> 
>      qemu-system-x86_64: window-close is only valid for GTK and SDL, ignoring option
> 
> If we check in parse_display() instead, we should be able to get
> something like
> 
>      qemu-system-x86_64: -display none,window-close=off: window-close is only valid for GTK and SDL, ignoring option
> 
> Funny: we get a different error with VNC:
> 
>      qemu-system-x86_64: -display vnc=:0,window-close=off: Invalid parameter 'window-close'
> 
> That's because parse_display() uses separate parsers for SDL, VNC and
> the rest, and only SDL and the rest accept window-close.
> 
> Finally, why isn't this an error?  Invalid configuration should be...
> 
> If we decide not to error out in this case, we should use warn_report()
> instead of error_report().
> 
> All this can be addressed on top.

I'm planning to get this mess cleaned up in QEMU 7.1 - once the ugly SDL 
parameters with the underscore can finally be removed after their 
deprecation period is over. Then we can switch the SDL display to proper 
QAPI parsing and remove all the legacy cruft there.

  Thomas


