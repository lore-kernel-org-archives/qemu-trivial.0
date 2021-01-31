Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6FU9-0001R6-Jz
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2021 11:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6FU5-0001Q8-Qy
 for qemu-trivial@nongnu.org; Sun, 31 Jan 2021 11:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6FU3-00026d-5J
 for qemu-trivial@nongnu.org; Sun, 31 Jan 2021 11:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612110114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFc3omBkFlW3EY+eUPxyEklha7epw41nKrFljKoolHI=;
 b=eucFuAscZT2BSGksv+/uwHi6pNyISJrkMllWfC5YZH+XUqCNd4gRtlk9whUmD8HSStWxyb
 jWzVJ1+pOt3AJu/wo2CS6SD6UJjbWoKFxDo66VffYhfCqDfIBpm0leYVN477ttyq9zE0vd
 bhdjG3qATCnF3f42/6D7zkFT1IGv4zU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-oyvs75BrORmht11Mk7UfzA-1; Sun, 31 Jan 2021 11:21:49 -0500
X-MC-Unique: oyvs75BrORmht11Mk7UfzA-1
Received: by mail-wr1-f69.google.com with SMTP id w3so8868554wrm.22
 for <qemu-trivial@nongnu.org>; Sun, 31 Jan 2021 08:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uFc3omBkFlW3EY+eUPxyEklha7epw41nKrFljKoolHI=;
 b=FZxDWzMFhsoyV6dB3v4EqrpnV0drxa7tI5P+vIPfF3k8gRsajqRADCsRid0EZeXKov
 5hs7ZpKIx/g2uutocJRV6UPOhvDEc5pRsJppcplXOC+eO2svcHoXuibeYU9k4CQxLJ/n
 18TMlFtldkDNGKgMOWfco1WnIsO8Y+kIDywd3ZCH8pOfBwnyW3ltvqr1bd2n0Om5LudE
 N9Bu1T7JlHOEpDoxyR3W0jsBN5OHnnAWxxSbS1WGABD5F0CX3kRpPeFWKkRIP/b5OEuv
 uebuwRLHoW0+D6nXY5KufACKEswdejPZYsNzEGx46o01yiF4xKe3KbGDA6A9DiJ+uj8t
 3B1Q==
X-Gm-Message-State: AOAM531dtOvEw9swIGrcF+XT3NCzWLBxAA7IrdoR4OIq78EhdJyXWU63
 5sWL0yzyhtHdL0tmRqU9YqPyuKmrT99y70x3DIgj/TGaibhvE2CKjvDwnnCihtdzxIr8gktUP1+
 3cm6GyfvywMEo0oQfFA==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr13796429wrm.231.1612110108582; 
 Sun, 31 Jan 2021 08:21:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyX1nPisse+59GUyqLGGae+7UhLdYvhK1klaRs8M9iy9+NLiTgIZVMghivUoR/cf3SrCKCWYA==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr13796414wrm.231.1612110108407; 
 Sun, 31 Jan 2021 08:21:48 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l1sm23012419wrp.40.2021.01.31.08.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 08:21:47 -0800 (PST)
Subject: Re: [PATCH] pc-bios/descriptors: fix paths in json files
To: =?UTF-8?Q?Jannik_Gl=c3=bcckert?= <jannik.glueckert@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Sergei Trofimovich <slyfox@gentoo.org>
References: <20210131143434.2513363-1-slyfox@gentoo.org>
 <dbd1e6a4-ccaa-9d30-f537-7572b87e8412@redhat.com>
 <CAFqe=zL=T_MXTyY_0F6DapgAOPODpXqnNqFOO00iXi3g=xzQ1g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7e3aecd7-d045-1abb-792e-2e3d475b124e@redhat.com>
Date: Sun, 31 Jan 2021 17:21:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFqe=zL=T_MXTyY_0F6DapgAOPODpXqnNqFOO00iXi3g=xzQ1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 31 Jan 2021 16:21:58 -0000

On 1/31/21 4:22 PM, Jannik Glückert wrote:
>> Jannik, can you send a Signed-off-by line so we can accept
>> your patch? See:
>> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
> 
> Sure! I hope this is right, I'm not exactly experienced with mailing
> list development.
> 
> Signed-off-by: Jannik Glückert <jannik.glueckert@gmail.com>

Yes, perfect :)

>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>>> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
>>> ---
>>>  pc-bios/descriptors/meson.build | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
>>> index ac6ec66b00..29efa16d99 100644
>>> --- a/pc-bios/descriptors/meson.build
>>> +++ b/pc-bios/descriptors/meson.build
>>> @@ -9,7 +9,7 @@ if install_edk2_blobs
>>>    ]
>>>      configure_file(input: files(f),
>>>                     output: f,
>>> -                   configuration: {'DATADIR': qemu_datadir},
>>> +                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
>>>                     install: get_option('install_blobs'),
>>>                     install_dir: qemu_datadir / 'firmware')
>>>    endforeach
>>>
> 
> 
> Am So., 31. Jan. 2021 um 15:56 Uhr schrieb Philippe Mathieu-Daudé
> <philmd@redhat.com>:
>>
>> On 1/31/21 3:34 PM, Sergei Trofimovich wrote:
>>> Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
>>> contained the relative path:
>>>             "filename": "share/qemu/edk2-x86_64-secure-code.fd",
>>>             "filename": "share/qemu/edk2-i386-vars.fd",
>>>
>>> After then change the paths are absolute:
>>>             "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
>>>             "filename": "/usr/share/qemu/edk2-i386-vars.fd",
>>>
>>> The regression appeared in qemu-5.2.0 (seems to be related
>>> to meson port).

Cc: qemu-stable@nongnu.org

Cc'ing qemu-trivial@ now (I can respin with all tags sorted
if it is easier).

>>> CC: Paolo Bonzini <pbonzini@redhat.com>
>>> CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
>>> CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>>> Bug: https://bugs.gentoo.org/766743
>>> Bug: https://bugs.launchpad.net/qemu/+bug/1913012
>>> Patch-by: Jannik Glückert
>>
>> Thanks Jannik and Sergei to fix this issue, I noticed
>> the LP#1913012 and planned to look at it tomorrow :)
>>
>> Jannik, can you send a Signed-off-by line so we can accept
>> your patch? See:
>> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
>>
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>>> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
>>> ---
>>>  pc-bios/descriptors/meson.build | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
>>> index ac6ec66b00..29efa16d99 100644
>>> --- a/pc-bios/descriptors/meson.build
>>> +++ b/pc-bios/descriptors/meson.build
>>> @@ -9,7 +9,7 @@ if install_edk2_blobs
>>>    ]
>>>      configure_file(input: files(f),
>>>                     output: f,
>>> -                   configuration: {'DATADIR': qemu_datadir},
>>> +                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
>>>                     install: get_option('install_blobs'),
>>>                     install_dir: qemu_datadir / 'firmware')
>>>    endforeach
>>>
>>
> 


