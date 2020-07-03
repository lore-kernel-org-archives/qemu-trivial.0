Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrPOU-0000GW-9I
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 13:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrPOS-0000EP-Bu
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 13:22:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50672
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrPOQ-0003zq-PE
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 13:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593796949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z99jpI8h1TeJZSnRuiI8KpXSTQSOZGJfNPacK3k9QBE=;
 b=eJ3aVrfb4Yhu+WUtdpSlTivppC5xuQKqHWFzjjR4/dvhXCIgEcq9Tw1FCgdpChu8cYZmCW
 bWVM9IjinK7GkG699zsYr7ky/i0/F/MTplAEJv/uk8GJ7Rh/00Sx3OlzXV+vcI6LNWA6AZ
 4Ixmv7GJeRwBOShECtvGotatJw0BAzI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-F3uU-X6ePdCSzdBHirEDyw-1; Fri, 03 Jul 2020 13:22:28 -0400
X-MC-Unique: F3uU-X6ePdCSzdBHirEDyw-1
Received: by mail-wm1-f71.google.com with SMTP id e15so35709802wme.8
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 10:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z99jpI8h1TeJZSnRuiI8KpXSTQSOZGJfNPacK3k9QBE=;
 b=VrWDvNYlgmCA2iRGhJJ2CCsYyDTbUCmwQwOYVrHAgy9SfVOlX9z3KNE5rGxctGKtSH
 HnKFiVq596aaY5QwDWC0MHVUtSUMmnbfrtxJu9rGx1w9WIkTdeDdg/0TB9zmQUmT3Oxc
 PcdkRq6zhay7yaARXfSDrRXacR+IxYbtPIFhIDr8gFtQjJRXqsM303AN4f9dwH8oRwbM
 3LsUhzK2awkLbuds9oCInEC8AiTwFeSNhB2XCjegASE2YBZJTKuxvhNttdvhgWAZbyIh
 xExa5dPj7ccS9wD/90DJGUQZc3g09tR/Yps1fALBjoZSJTHYd60WuInHHeT376wIKAWc
 4CMw==
X-Gm-Message-State: AOAM5328ijGRmKOje57IYT1vJRexureZwPdQNihQU8iiQOgLtGXPP3I1
 QpwGeLzjejcz0KUfAydWelVvYRTHBzgsMwrznYjfQxIJWV8V47ulM5dYS0julQsKbBxUmBTopEQ
 dZZSkojbe4McJU3eh6w==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr36741693wrm.31.1593796946828; 
 Fri, 03 Jul 2020 10:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztnhdhWTBsEffENrF56voW8iZyR/Jh/QXytJxfAW2gbVNT1ubjaShau6FgX3Rqtr4bUsTEvw==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr36741674wrm.31.1593796946638; 
 Fri, 03 Jul 2020 10:22:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5cf9:fc14:deb7:51fc?
 ([2001:b07:6468:f312:5cf9:fc14:deb7:51fc])
 by smtp.gmail.com with ESMTPSA id y7sm14510793wrt.11.2020.07.03.10.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 10:22:26 -0700 (PDT)
Subject: Re: [PATCH] softmmu/vl: Remove the check for colons in -accel
 parameters
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20200618074001.13642-1-thuth@redhat.com>
 <1a135eb1-8ea6-80f2-85d7-40c8da92c1d1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <264c1ba9-4b05-1559-f5f7-63e3b4f98ea6@redhat.com>
Date: Fri, 3 Jul 2020 19:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1a135eb1-8ea6-80f2-85d7-40c8da92c1d1@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:38:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 03 Jul 2020 17:22:32 -0000

On 03/07/20 07:34, Thomas Huth wrote:
> On 18/06/2020 09.40, Thomas Huth wrote:
>> The new -accel option does not accept colons in the parameters anymore
>> (since it does not convert the parameters to -machine accel=...
>> parameters
>> anymore). Thus we can now remove the check for colons in -accel:
>>
>> $ qemu-system-x86_64 -accel kvm:tcg
>> qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   softmmu/vl.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index f669c06ede..273acfcf6b 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3485,11 +3485,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>                       g_slist_free(accel_list);
>>                       exit(0);
>>                   }
>> -                if (optarg && strchr(optarg, ':')) {
>> -                    error_report("Don't use ':' with -accel, "
>> -                                 "use -M accel=... for now instead");
>> -                    exit(1);
>> -                }
>>                   break;
>>               case QEMU_OPTION_usb:
>>                   olist = qemu_find_opts("machine");
>>
> 
> Ping?
> 
>  Thomas
> 

Queued, thanks.

Paolo


