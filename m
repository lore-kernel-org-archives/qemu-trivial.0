Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0A8CCA472
	for <qemu-trivial@archiver.kernel.org>; Tue,  7 Oct 2025 11:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v66An-0001HU-Vx; Tue, 07 Oct 2025 07:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v66Al-0001H7-14
 for qemu-trivial@nongnu.org; Tue, 07 Oct 2025 07:48:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v66Ag-0000gt-ID
 for qemu-trivial@nongnu.org; Tue, 07 Oct 2025 07:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759837674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yCypJaqGuW+vE9uk09UOYjftYIIi4Jtz8b0RvL9awn4=;
 b=gz5joJl+X7Zu26FrpUkcozcsy7ZiZGw+yO+R2yccmsqcRojpml9tOg1oiSDSZWvWCPt5ii
 /3EvUHQhXwOnXlyhsRdqe9/HPx+MihGouC764cqgujy4gJIjWJK05+Y+6uwZN7UB0YB8/g
 2sRjkRAFrWCT6VaERvc8BLo090DBOvY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-nWN4YX8dPpSg430fBGP8Vw-1; Tue, 07 Oct 2025 07:47:53 -0400
X-MC-Unique: nWN4YX8dPpSg430fBGP8Vw-1
X-Mimecast-MFC-AGG-ID: nWN4YX8dPpSg430fBGP8Vw_1759837672
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ee13baf21dso5147161f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 07 Oct 2025 04:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759837672; x=1760442472;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCypJaqGuW+vE9uk09UOYjftYIIi4Jtz8b0RvL9awn4=;
 b=TNfh2TM3m9b3Y/pBwSAi+j4q39xYe8BwrpYA3zxqCoTmjy1DiyUR4FpVngiecABJY8
 4MRGSwV1sIXFC+F77WcQSQWhrVwZ3sOYJbJOIBGsBJPeaD/SLZ9x66OChFIPjBJduiIv
 bRCfi1wBWldKrVhNsR3nuK2upbWCX7WpgOCnSWGaf1wboM7oanBixNecAlnwoDSd3s0u
 Pvk6rbi4txbmkJORUPvlAMq5EWFHZRUqMvu2kbpPvmbUWh6crXyy179+kxAyCY+fin7w
 ELzDYpTh06Ng2aZljS71zuOkhm5jXb/8gDk1f25DGBHoirJTawpCTmF/kZLoVaUOz3K0
 KwNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAT/DlfBbzvnwe7YiWYFhpOzUQD37l5OIGCOJE+yxcmdGyebDgrtbumF8fl0hHaGkBOOmLNGD8rZA6lZw=@nongnu.org
X-Gm-Message-State: AOJu0YyE1eymr9EsgJiHQ12WpKhqy9oodlRe915MCH0emi5J6pCeLug0
 tePCjlCIy/cjT7FCMFdpYz2R44Av1qa8COjPL+zH0wySkFCSBpHvaZrmnZv+X/KnkcWZ5uDuBDa
 zlugK3cST3eDzCpLNjy7EKaVBjf1kIPa6XpAqQkqjJjTA14i06mxu/G83S48=
X-Gm-Gg: ASbGncteh/Pv3EhWBIpqtH9xxiTjy08+rJQ+ieZh8yMDrX8fqMfyQqOXGr2t92VvvZq
 gkgiur4qdLDdy25fv7/23zIYa7VHa6F6CDxPC3sUG9uXa3dvW2gT3PXApvNpPr6l6sKvJ6xZ3Lg
 0+ij7DVpqTgAReDZdGKaYWvJEsbhnnGwHIp3Ztyn0+NuceglfXqt1p3MfvRdw/6eIxB/1HB0teS
 1c5cRyre6Mq+55LLmVxXkLn+eC473gf4BOOI0ETmy93CBg92VQkwwYpqpSrereXAhypLe1ijrww
 fXk1/jIyHlXgVP+rRhS6Ph6eNn+H9BXCBQvneWKJVocsROCIjsXjn0TjqeJlwM9mx6rFZwo=
X-Received: by 2002:a05:6000:2c0e:b0:407:4928:ac82 with SMTP id
 ffacd0b85a97d-425671bec4fmr10538809f8f.53.1759837671879; 
 Tue, 07 Oct 2025 04:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHca8fnCVruEKkEFixf55TrXzwLsLOQi5Kgwu0qTt8YP3hulLjUEJUVPvXr0eJcoOc0GQpx1Q==
X-Received: by 2002:a05:6000:2c0e:b0:407:4928:ac82 with SMTP id
 ffacd0b85a97d-425671bec4fmr10538795f8f.53.1759837671523; 
 Tue, 07 Oct 2025 04:47:51 -0700 (PDT)
Received: from [10.33.192.176] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72374b8dsm229524015e9.19.2025.10.07.04.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 04:47:51 -0700 (PDT)
Message-ID: <a67e9c85-02ba-415c-b178-4e4d6366c4fe@redhat.com>
Date: Tue, 7 Oct 2025 13:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/keys: fix incorrect reset scaling key binding
To: Nir Lichtman <nir@lichtman.org>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250815090025.GA1464436@lichtman.org>
 <e7dcf4c0-e3c5-4a0f-8d23-a7786dac21fd@redhat.com>
 <o4nzr4rw7hfo4nksowiy5nnfjkwfszx4dwcn6mo5oxcu5hilwq@tkfasphulhsc>
 <20250910102351.GA1782682@lichtman.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250910102351.GA1782682@lichtman.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DGHUWk-HmDoi_GhzWTh-b_rpskPHHWje8Ug6lwJY09M_1759837672
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 10/09/2025 12.23, Nir Lichtman wrote:
> On Wed, Sep 10, 2025 at 10:38:43AM +0200, Gerd Hoffmann wrote:
>> On Tue, Sep 09, 2025 at 11:15:54AM +0200, Thomas Huth wrote:
>>> On 15/08/2025 11.00, Nir Lichtman wrote:
>>>> Fix incorrect key binding for resetting the graphical frontends scaling
>>>>
>>>> Signed-off-by: Nir Lichtman <nir@lichtman.org>
>>>> ---
>>>>    docs/system/keys.rst.inc | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/docs/system/keys.rst.inc b/docs/system/keys.rst.inc
>>>> index c28ae1a..3b5307b 100644
>>>> --- a/docs/system/keys.rst.inc
>>>> +++ b/docs/system/keys.rst.inc
>>>> @@ -21,7 +21,7 @@ while ``-display sdl,grab-mod=rctrl`` changes it to the right :kbd:`Ctrl` key.
>>>>      * - :kbd:`Ctrl+Alt+-`
>>>>        - Shrink the screen
>>>> -  * - :kbd:`Ctrl+Alt+u`
>>>> +  * - :kbd:`Ctrl+Alt+0`
>>>>        - Restore the screen's un-scaled dimensions
>>>
>>>   Hi,
>>>
>>> this unfortunately seems to depend on the graphical front-end: For "-display
>>> gtk", it's ctrl-alt-0 indeed, but for "-display sdl", it's ctrl-alt-u
>>> instead.
>>>
>>> Should we unify them? If so, which is the better key combination?
>>
>> Established convention in various apps is '+' for zoom in, '-' for zoom
>> out, and '0' for reset to 100% (each combined with the hotkey
>> modifier(s)).  So when changing hotkeys we should follow that I think,
>> i.e. switch SDL to Ctrl+Alt+0.
> 
> I'll send a patch fixing SDL to use CTRL+ALT+0

Now that the patch for the SDL backend got merged:

Reviewed-by: Thomas Huth <thuth@redhat.com>


