Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLoue-0000Ri-9d
	for mharc-qemu-trivial@gnu.org; Mon, 15 Mar 2021 11:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLouc-0000Ph-OI
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 11:13:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLoua-0006VH-SO
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 11:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615821219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHdvpjVtWNt8IHGrKf+DJ8DTrFWFEuzwSYnTxtKfw78=;
 b=IN7wDwH8dU/CtTPV5De5kz0j6X6zJfqpVBDolEzmFR4hl6p6PClt6lb4LSSl++kHkORvzx
 xA34jWyFouM1kISovHQESscsVmD8DBLKbYFAQs8L3Qex9pNy+8UMd2GMXLc9piwBzSnxGa
 bx9aKnmu1UpQDWSHClmgGxuOdKeOe1w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-LaUQhm7QOQCzXlO5QZk9UQ-1; Mon, 15 Mar 2021 11:13:36 -0400
X-MC-Unique: LaUQhm7QOQCzXlO5QZk9UQ-1
Received: by mail-wm1-f70.google.com with SMTP id c7so8329297wml.8
 for <qemu-trivial@nongnu.org>; Mon, 15 Mar 2021 08:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hHdvpjVtWNt8IHGrKf+DJ8DTrFWFEuzwSYnTxtKfw78=;
 b=coeoZD2hAzrmO2egOmMGuXmjJZMdRnlaqvyEipmsfkWu/1fcJmLqQ1mLn+Ei2nsast
 +mQawoThJEFdjqZkRVMkGev3L/NK6heAhavPg5nHob5FkPWs65QC044dA5q+GLt2oLAY
 gC9fO4u9x6aHZC8/v/7eaF+NwGu1MId1jpVyyk8KFFpitt+2VN5iXt+DJe3n8ZjnBl3l
 UEtAQ6/1NYsd1TTY5AyCWcKVvFJ+3jF1Kzpmu0cvL6en4FMLV5lzmkcG58daq8cLzyLU
 DCJqRqd9x/VgSx5spMeieFsY2IykAe9yos/4c/YMTnLV6JbS7JjmTF1YhJEkW5aWQhp4
 Ui5w==
X-Gm-Message-State: AOAM531R3rzTcv3061yAxUrCmLMQGidziC48XTCDKXI0DRiKrfJC1dIs
 DjxgoLMKrcIN2vq+JLIbXeFWN3Why3uEgezEbzxAFq+JyId0NbVj4gPHeLIwo5wbav2zBx8NYb9
 0HBq4rz/J0IyCvXHFQF/A+xWi/AWAan49TULDe77e2AFBa8TJn734nQhj0hheEPf8JBk=
X-Received: by 2002:a5d:4312:: with SMTP id h18mr138779wrq.193.1615821214778; 
 Mon, 15 Mar 2021 08:13:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/s3gm4V3Jt4YcOqwugRHzjYE63AamtcfISA564E7kc6U5Y3jCz6FeP4HpJLkdQHQKn9042A==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr138739wrq.193.1615821214325; 
 Mon, 15 Mar 2021 08:13:34 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c26sm19767068wrb.87.2021.03.15.08.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 08:13:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-3-ma.mandourr@gmail.com>
 <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
 <CAD-LL6g9Aha-PZpBPiNK09JkDavL0dM8cwKzcysj2MUxwQQ6Mg@mail.gmail.com>
 <87im5sfq9m.fsf@dusky.pond.sub.org>
 <5d7e1480-ca56-b830-d51d-32d51eab18be@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8389fb6-6a77-f960-d3c8-e64e26ec1e58@redhat.com>
Date: Mon, 15 Mar 2021 16:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5d7e1480-ca56-b830-d51d-32d51eab18be@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Mon, 15 Mar 2021 15:13:43 -0000

On 3/15/21 3:53 PM, Thomas Huth wrote:
> On 15/03/2021 15.25, Markus Armbruster wrote:
>> Mahmoud, it's generally a good idea to cc: people who commented on a
>> previous iteration of the same patch.  In this case, Thomas.  I'm doing
>> that for you now.
>>
>> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>>
>>> On Mon, Mar 15, 2021 at 1:13 PM Philippe Mathieu-Daudé
>>> <philmd@redhat.com>
>>> wrote:
>>>
>>>> Hi Mahmoud,
>>>>
>>>> On 3/15/21 11:58 AM, Mahmoud Mandour wrote:
>>>>> Replaced a call to malloc() and its respective call to free()
>>>>> with g_malloc() and g_free().
>>>>>
>>>>> g_malloc() is preferred more than g_try_* functions, which
>>>>> return NULL on error, when the size of the requested
>>>>> allocation  is small. This is because allocating few
>>>>> bytes should not be a problem in a healthy system.
>>>>> Otherwise, the system is already in a critical state.
>>>>>
>>>>> Subsequently, removed NULL-checking after g_malloc().
>>>>>
>>>>> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>>>>> ---
>>>>>   util/compatfd.c | 8 ++------
>>>>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/util/compatfd.c b/util/compatfd.c
>>>>> index 174f394533..a8ec525c6c 100644
>>>>> --- a/util/compatfd.c
>>>>> +++ b/util/compatfd.c
>>>>> @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t
>>>>> *mask)
>>>>>       QemuThread thread;
>>>>>       int fds[2];
>>>>>
>>>>> -    info = malloc(sizeof(*info));
>>>>> -    if (info == NULL) {
>>>>> -        errno = ENOMEM;
>>>>> -        return -1;
>>>>> -    }
>>>>> +    info = g_malloc(sizeof(*info));
>>>>
>>>> Watch out...
>>>>
>>>> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html
>>>>
>>>>    If any call to allocate memory using functions g_new(), g_new0(),
>>>>    g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),
>>>>    and g_realloc_n() fails, the application is terminated.
>>>>
>>>> So with your change instead of handling ENOMEM the QEMU process is
>>>> simply killed.
>>>>
>>>> Don't you want to use g_try_new(struct sigfd_compat_info, 1) here
>>>> instead?
>>>>
>>>>>
>>>>>       if (pipe(fds) == -1) {
>>>>> -        free(info);
>>>>> +        g_free(info);
>>>>>           return -1;
>>>>>       }
>>>>>
>>>>>
>>>>
>>>>
>>> Hello Mr. Philippe,
>>>
>>> That's originally what I did and I sent a patch that uses a g_try_*
>>> variant, and was
>>> instructed by Mr. Thomas Huth that it was better to use g_malloc instead
> 
> No need to say "Mr." here ... we're not that formal on this mailing list
> here :-)
> 
>>> because this is a small allocation and the process is better killed
>>> if such
>>> an allocation fails because the system is already in a very critical
>>> state
>>> if it does not handle a small allocation well.
>>
>> You even explained this in the commit message.  Appreciated.
>>
>>> You can find Mr. Thomas reply to my previous patch here:
>>> Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
>>> (gnu.org)
>>> <https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05067.html>
>>>
>>> You can instruct me on what to do further.
>>
>> I figure this patch is fine.  Thomas?
> 
> Yes, looks good now, thanks for the update, Mahmoud!

I guess I misunderstood the patch description when :)


