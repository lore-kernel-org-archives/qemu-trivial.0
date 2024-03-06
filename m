Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rhu3I-0003kb-1E
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2024 11:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhu3G-0003kS-Uj
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 11:23:30 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhu3B-0004LX-VP
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 11:23:30 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56657bcd555so8931828a12.3
 for <qemu-trivial@nongnu.org>; Wed, 06 Mar 2024 08:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709742204; x=1710347004; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQWZWHJ+4CGxm/sW6ViaEFLYelWh1L5bxQ5FP7dieNk=;
 b=qMrwZnVKV8BtBIyRY5KxKGHPxT7dn+f0ZmnOPtNVhxuQ0uY0G+Lra+vsgEC6LvWvXp
 rvWet8uA3JlgsFu17Zz3TmC/tEDR5mWm7uiai7GeBNSIjDpeXpmsPizNvv40yhKPj38/
 EP0a87qWBsmbkhRK4a3ds7mK0NoTwWqyahF38nlzQ4XZt5mZzHzHQmvKesl4Fbjadoad
 maXaGBbL6VdDvgg1tZPSasIoVf1na9HLgYBgT6/NrUNp8YpsxerKkVzWwemL6PGGEKXy
 wyQ1g58UdT81o6heyGXdLqfb6qAio88aI8SsGWuRa0roDGEdIMLkZNKN35jHlIOOH2dn
 Dv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709742204; x=1710347004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQWZWHJ+4CGxm/sW6ViaEFLYelWh1L5bxQ5FP7dieNk=;
 b=IVG618lqlKzPG6qUFcf0f8wwO7mHyNwaL2hGEhf6HsaNwL5061RkAnhSABNUCYXLRK
 gzpqHpoF7/cUFqaGu655xPoxYmnObocZe2LCNTa9UyH7l+53RpAyJRk2/HUZgq7MckEG
 pqJC51Xw1DlPucFDn1xxWn4/+zKn0dnYMvAQXbP4fOBTbkd3oI8uyi34LXnD/IBKasI8
 EOoyBQvbVfujeChPr1uEhlUbn1ElISaUGQyAH9mEmMcpG7mhg9wGqdPnpvDUeYP3r0aD
 eNKm6XTZ49C9vW/1Mtvi4utMV2mWxYdJuiZnzwGMopy2qgykB1OxwfKn38RusjHOnzTl
 cr/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG6c0PDyIi2MkQ9Nhn18E/Iy4X/UTCrAnYF6Bodm4RCONIwB1vNa/ajMHD6F7JYj5+yJ1EoETn3+Pm9cJg1HvvG7xrHXVmdQ==
X-Gm-Message-State: AOJu0Yxc3r/8hNMg9RvzFX9trI3SrrVnRHwDr/goRs+RwbgWcFZkrQ0a
 GDFe86Vsk50R3oLF8Ajhud2qqwDCtTmDGuAeSa6+tZSMjHoaQ7rgAc490YCZFM4=
X-Google-Smtp-Source: AGHT+IEjkQ+W5lHRD6bMAdtY2QgyKHhWeQOCNxO3Xlc1EwOWZg1/EWdl+b0J2NE2wl/qPzP6LN9UhA==
X-Received: by 2002:a17:906:4088:b0:a44:d084:926b with SMTP id
 u8-20020a170906408800b00a44d084926bmr7339023ejj.77.1709742203961; 
 Wed, 06 Mar 2024 08:23:23 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170906094c00b00a3e5adf11c7sm7253127ejd.157.2024.03.06.08.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 08:23:23 -0800 (PST)
Message-ID: <4cccc4c2-fe3b-4af7-aedb-69d96dadf56f@linaro.org>
Date: Wed, 6 Mar 2024 17:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] blockdev: Fix block_resize error reporting for op
 blockers
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240306131055.2460378-1-armbru@redhat.com>
 <20240306131055.2460378-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240306131055.2460378-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 06 Mar 2024 16:23:31 -0000

On 6/3/24 14:10, Markus Armbruster wrote:
> When block_resize() runs into an op blocker, it creates an error like
> this:
> 
>          error_setg(errp, "Device '%s' is in use", device);
> 
> Trouble is @device can be null.  My system formats null as "(null)",
> but other systems might crash.  Reproducer:
> 
> 1. Create two block devices
> 
>      -> {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk0", "filename": "64k.img"}}
>      <- {"return": {}}
>      -> {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk1", "filename": "m.img"}}
>      <- {"return": {}}
> 
> 2. Put a blocker on one them
> 
>      -> {"execute": "blockdev-mirror", "arguments": {"job-id": "job0", "device": "blk0", "target": "blk1", "sync": "full"}}
>      {"return": {}}
>      -> {"execute": "job-pause", "arguments": {"id": "job0"}}
>      {"return": {}}
>      -> {"execute": "job-complete", "arguments": {"id": "job0"}}
>      {"return": {}}
> 
>     Note: job events elided for brevity.
> 
> 3. Attempt to resize
> 
>      -> {"execute": "block_resize", "arguments": {"node-name": "blk1", "size":32768}}
>      <- {"error": {"class": "GenericError", "desc": "Device '(null)' is in use"}}
> 
> Broken when commit 3b1dbd11a60 made @device optional.  Fixed in commit
> ed3d2ec98a3 (block: Add errp to b{lk,drv}_truncate()), except for this
> one instance.
> 
> Fix it by using the error message provided by the op blocker instead,
> so it fails like this:
> 
>      <- {"error": {"class": "GenericError", "desc": "Node 'blk1' is busy: block device is in use by block job: mirror"}}
> 
> Fixes: 3b1dbd11a60d (qmp: Allow block_resize to manipulate bs graph nodes.)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   blockdev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


