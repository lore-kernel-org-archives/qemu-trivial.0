Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s3Z7r-0001HO-Tf
	for mharc-qemu-trivial@gnu.org; Sun, 05 May 2024 06:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s3Z7p-0001Gw-HM
 for qemu-trivial@nongnu.org; Sun, 05 May 2024 06:29:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s3Z7n-0008CD-B6
 for qemu-trivial@nongnu.org; Sun, 05 May 2024 06:29:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2b3646494a8so746751a91.2
 for <qemu-trivial@nongnu.org>; Sun, 05 May 2024 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1714904982; x=1715509782;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fMb+NL2JV5o5bue7UPFwYy8bgklZrqQMWJt58wpkW8s=;
 b=Gte38bYYnKuG8VV/p6iCmIERv+784HYG/BfO8VVCXBDVpvAXfdp5jnATzqDk/pxI4V
 6/3uvSoe0ANKPY9KxcEaRw6dix/fvu13sbxUOAQkxY1FvAKhYZJShrzb9ekncC3TZ9+1
 OclZBK9Qavcvh/HVNTuM5gj1uPSFj6QUdMtL2tmLj1d1IAg4aYS2KhIDcCqSq82hxrsH
 MwZk2beTvn5GY84da7zQLbYweh6hGDpDS1mlKynUmQz5abY8QdbA/1JgF5Qvj8ks5Qr5
 /uPAjWw66h/rCMdgOcvKuDUs9jnQE+7hxCI20B5kdA4Om/lxZTaIMuGlDHKJHy5bCF/K
 l51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714904982; x=1715509782;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fMb+NL2JV5o5bue7UPFwYy8bgklZrqQMWJt58wpkW8s=;
 b=tlmLPzrUUt918jnx3DF9ONSIF5wL9Nvm962LQlZFSXwAKDVls4ICBo/LHVdWobRnh9
 XHuupQK1Jo1eNtzcde+CSqVFmfGPAs47jvCwfFZW+q6OetBwD4BIo7DBqRIMridiM3oj
 ajVl8eYgzS+TnnhcqGY6LJb54vF0CMtl4NjlavcKh4MGzXJX11cB2LbDCq3lg2jcLNif
 5V7AiV68sMgVwSepGAh54jLVIJvfl8/xkxusF48Z59vnKJcFopSbPtzCjhZ2ATCw5s8C
 E9v1aYLMWLVhEgPSovTvO+E/0lQ/VrtbkoBu9mrw4jSUXtsupi+cxvi2+XKgYy7AhjEL
 CtVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHQowIOx1o2rPg65GLfG1KOHWbXtpTwGi74nsb0gNZY4gBMlHUJ1zsehpHbd8DupqE1wEfL/X4Nra5lPqW+3eErrawpFQN9w==
X-Gm-Message-State: AOJu0Ywjt85VU31H62miQkn17Lc4Oa1JEn2Idn4OocG4yDXRWoRS2gWh
 XFkavWFMvNJgdEG5U2mOXOkWIWuMyaON+uhdUi3S7GZODUgYe11+YWS2pp1ux4o=
X-Google-Smtp-Source: AGHT+IHC21i7WUZekdavOCRZJ5JpOZgZS72w7tgns6ft0+pP6TyxfOvlnT//lofhjNgfQ2tytZKK1g==
X-Received: by 2002:a05:6a21:18e:b0:1af:8004:4be1 with SMTP id
 le14-20020a056a21018e00b001af80044be1mr8224225pzb.33.1714904981748; 
 Sun, 05 May 2024 03:29:41 -0700 (PDT)
Received: from [157.82.202.162] ([157.82.202.162])
 by smtp.gmail.com with ESMTPSA id
 gx7-20020a17090b124700b002ab664e5e17sm6125060pjb.1.2024.05.05.03.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 03:29:41 -0700 (PDT)
Message-ID: <edad61c6-2b7c-4982-9038-afcd765f6df6@daynix.com>
Date: Sun, 5 May 2024 19:29:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-keymap: Free xkb allocations
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20240501-xkb-v1-1-f046d8e11a2b@daynix.com>
 <b3b6ba1d-3f58-45f8-96fc-800e6ec95284@tls.msk.ru>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <b3b6ba1d-3f58-45f8-96fc-800e6ec95284@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 05 May 2024 10:29:45 -0000

On 2024/05/05 19:24, Michael Tokarev wrote:
> 01.05.2024 10:55, Akihiko Odaki wrote:
>> This fixes LeakSanitizer complaints with xkbcommon 1.6.0.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   qemu-keymap.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/qemu-keymap.c b/qemu-keymap.c
>> index 8c80f7a4ed65..7a9f38cf9863 100644
>> --- a/qemu-keymap.c
>> +++ b/qemu-keymap.c
>> @@ -237,6 +237,9 @@ int main(int argc, char *argv[])
>>       xkb_state_unref(state);
>>       state = NULL;
>> +    xkb_keymap_unref(map);
>> +    xkb_context_unref(ctx);
>> +
> 
> I'd avoid freeing any resources in main() entirely,
> since it's much cheaper to free whole process by the
> kernel at exit time than to mess with each chunk of
> allocated memory.  Dunno how useful it is to "fix"
> these.
> 
> /mjt

This is purely to satisfy LeakSanitizier; the LeakSanitizer complaints 
result in a build failure with many noisy logs. I don't add Fixes: tags 
for this kind of leaks.

Regards,
Akihiko Odaki

