Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc8Bl-0001Zk-C3
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 09:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc8Bi-0001Vt-Ln
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc8Bf-00013c-2c
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604932225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FcDPhpL+azic2TdXKbnbXkdQL1Mz8mU0TF0Y/0TLBs=;
 b=FrylSihSgnJxpmNkyM/H6ktYov8Pmo+WRa5GQwojmrEaFMZvRrOTHHxgjP+2h/zjNZeS4r
 T+HgvZx0+0SD1Lp40t9OABdhj1Wsggj8BGs4uGG7/bPVJJNMoKcUQvjpAyAsHy+yDOyZbM
 OfQLc4Jyp6WST/E7hjqOTFg3KQTo3nQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-C5_EtTUjN-Wf9Cue0cc6YQ-1; Mon, 09 Nov 2020 09:30:23 -0500
X-MC-Unique: C5_EtTUjN-Wf9Cue0cc6YQ-1
Received: by mail-wm1-f69.google.com with SMTP id e15so2096394wme.4
 for <qemu-trivial@nongnu.org>; Mon, 09 Nov 2020 06:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3FcDPhpL+azic2TdXKbnbXkdQL1Mz8mU0TF0Y/0TLBs=;
 b=WF+rCNtam5rwdIyaqR0QO1zQ+zXQ9FDqxndV3toRWz171CJ7gnwZlxNPzVPlIwQ1z0
 QpbFbSzIOI9x/MAdDjDGTnQF4ajKr3B+5/Wpmhq8KBbbwZ89wN+rVzINrYqvW5PKo4DX
 2RK5jOt//tNFuGdjeTol8MFS2H8bebsfmNCXfPXq37X+IEsGMYVnBShcyYZA0Lmkazh0
 t79GreBd9I/ucVi4I5QCggTAO178i8AJMgM+LXZICtSQmIZWQxrWd9D+ofLOrHwt4pG+
 c7COugiIvbtAQmdX8GWCr0DWkFEznCDIuMGQcEt9bV5FIjFd+ebukYiWcL52bG0s5ry2
 PfPA==
X-Gm-Message-State: AOAM532KogTP6dhKHFVnXaDKn50lQUIFt66x02y41GEdDyzEe3SgcY6C
 s3LNTJEWHtWmg/1OjjF1DUZKckeF2jVpJJ8weqw1MAAiFrEaXBNwj2XJKY9S1lwqylBqDkz6MWA
 9GXWnyvAY/hK3OoaCgQ==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr19178631wrv.95.1604932221967; 
 Mon, 09 Nov 2020 06:30:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcR9Au5gaRsihnGtxshRgzjuPz/GXtFWRsrgDvtDkOoCngQvdZPOyr1RRDAYQBQkHuG+e+fw==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr19178617wrv.95.1604932221847; 
 Mon, 09 Nov 2020 06:30:21 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d16sm13706477wrw.17.2020.11.09.06.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:30:21 -0800 (PST)
Subject: Re: [PATCH-for-5.2 4/4] migration/ram: Fix hexadecimal format string
 specifier
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Gerd Hoffmann
 <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-5-philmd@redhat.com> <20201103124634.GG3566@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb7fecea-3b3d-b87b-7854-7d36e8133e1d@redhat.com>
Date: Mon, 9 Nov 2020 15:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103124634.GG3566@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Mon, 09 Nov 2020 14:30:31 -0000

Hi David, Juan.

On 11/3/20 1:46 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-DaudÃ© (philmd@redhat.com) wrote:
>> The '%u' conversion specifier is for decimal notation.
>> When prefixing a format with '0x', we want the hexadecimal
>> specifier ('%x').
>>
>> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>> Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

As there is no qemu-trivial@ pull request during freeze/rc,
can you queue this patch via your migration tree?

Thanks,

Phil.

> 
>> ---
>>  migration/ram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 2da2b622ab2..23dcfb3ac38 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -3729,7 +3729,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
>>      }
>>  
>>      if (end_mark != RAMBLOCK_RECV_BITMAP_ENDING) {
>> -        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIu64,
>> +        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIx64,
>>                       __func__, block->idstr, end_mark);
>>          ret = -EINVAL;
>>          goto out;
>> -- 
>> 2.26.2
>>


