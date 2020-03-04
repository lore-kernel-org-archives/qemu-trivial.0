Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9T0n-0003sD-6F
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 07:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j9T0k-0003oy-R0
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 07:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j9T0j-0008UZ-6s
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 07:20:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45470
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j9T0j-0008Tm-1V
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 07:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583324424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+Sc/Ytj5/l/uu/Ia3HqP8++YO1gK1k+ox+yPLhoME4=;
 b=LqEA+qtlH6GfAKoF0XG/19HLhxddfEFFlX6YBclplW8/xXVfnnpU8dHMFV3uYFeiCuR3HE
 RMYvNhJ7zZGjREcvd0c0nnYaS5/Y0qbGTU32RBFZHXwlzJleqTOEd1cJ8CU45tis6N0Pjm
 U9EW67SkC0DBnDAqucL94QnRRjlSeLk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-0_Ug14pQPsa_9ypBFxlw1A-1; Wed, 04 Mar 2020 07:20:20 -0500
X-MC-Unique: 0_Ug14pQPsa_9ypBFxlw1A-1
Received: by mail-wr1-f72.google.com with SMTP id 72so774346wrc.6
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 04:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+Sc/Ytj5/l/uu/Ia3HqP8++YO1gK1k+ox+yPLhoME4=;
 b=pa1F6yBleZrlWp0AIILHbz0WlGjIXwEnzAp6+Cg+3bS9y3vB2EsVhf/yPRlpeKwKZS
 Y8dZnAndBKqm7RlhzvjEPNXXEfB2CsXv41yJgmj1BWD80qN+c+YzMunO5ew4v/tSJnxl
 Ez1L0Z4I9v81sWxPiH82DN70Wm+u+mbKjzDjhEftILPwoGkhAZT9TyhFDkdlPLltgwED
 Z6d8UHIkMgulqfxM1FoYrX82qM5S/MLjm4O8ILb0AVS4xPzdcfepV6O6UiYBd1LSQdFo
 Q/MG7p/oUGAWIUGwrWVvq65ofPmwuDomxQUItmT1ruIMHoBHxf+Ge8gQ38zRpnnmKSQs
 cqZw==
X-Gm-Message-State: ANhLgQ0C33LU7TV32ptgtQdB1lk7DHEgGAU9o44JCbO2Moxfko3pQeqf
 TwlOffOCJetFUZBzv5s6mlENxxSJSMopCGnPWFRmB+PUe5ePG42lnKGQxxdsAJJRn0Cx/jmi8hP
 i78HsjVYiwpV6ox3QMg==
X-Received: by 2002:adf:ded2:: with SMTP id i18mr3868251wrn.173.1583324419718; 
 Wed, 04 Mar 2020 04:20:19 -0800 (PST)
X-Google-Smtp-Source: ADFU+vshvrrpeXFRXbmb2xrQXVEOm80husPmZGBGfnEdZ7YzWg9lSperp8LFHjt7S8qLxpjoboQ8vA==
X-Received: by 2002:adf:ded2:: with SMTP id i18mr3868216wrn.173.1583324419352; 
 Wed, 04 Mar 2020 04:20:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id i6sm5550115wra.42.2020.03.04.04.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 04:20:18 -0800 (PST)
Subject: Re: [PATCH] optionrom/pvh: scan entire RSDP Area
To: Stefano Garzarella <sgarzare@redhat.com>,
 Joe Richey <joerichey94@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Liam Merwick <liam.merwick@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Joe Richey <joerichey@google.com>
References: <20200303105246.66390-1-joerichey94@gmail.com>
 <20200304085541.cyirmrx5dozhf63a@steredhat>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bbbee5d6-ede2-a0b8-16f3-9496a783a62f@redhat.com>
Date: Wed, 4 Mar 2020 13:20:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304085541.cyirmrx5dozhf63a@steredhat>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 04 Mar 2020 12:20:28 -0000

On 04/03/20 09:55, Stefano Garzarella wrote:
> CCing Paolo
> 
> On Tue, Mar 03, 2020 at 02:52:47AM -0800, Joe Richey wrote:
>> From: Joe Richey <joerichey@google.com>
>>
>> Right now the PVH option rom scans for the RSDP from 0xE0000 to
>> 0xE1FFF. This is probobly a typo, it should scan from 0xE0000 to
>> 0xFFFFF.
>>
>> This is actually an issue on some QEMU versions/machines. For example,
>> when I run QEMU the RSDP is placed at 0xf5ad0 which will not be picked
>> up by the current implementation.
>>
>> This bug still allows a Linux guest to boot (in most configurations) as
>> the kernel will just scan for the RSDP if one isn't provided.
>>
>> Signed-off-by: Joe Richey <joerichey@google.com>
>> ---
>>  pc-bios/optionrom/pvh_main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
>> index a015e1bf22..28e79d7fc4 100644
>> --- a/pc-bios/optionrom/pvh_main.c
>> +++ b/pc-bios/optionrom/pvh_main.c
>> @@ -29,7 +29,7 @@ asm (".code32"); /* this code will be executed in protected mode */
>>  
>>  #define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
>>  #define RSDP_AREA_ADDR          0x000E0000
>> -#define RSDP_AREA_SIZE          2048
>> +#define RSDP_AREA_SIZE          0x00020000
>>  #define EBDA_BASE_ADDR          0x0000040E
>>  #define EBDA_SIZE               1024
>>  
> 
> The patch LGTM!
> 
> When I wrote this code I followed [1], where it is written that it can
> be found in the "memory region from 0x000E0000 to 0x000FFFFF", so it
> should be a typo.
> 
> Thanks for fixing it!
> 
> 
> Fixes: 2785dc7b17 ("optionrom: add new PVH option rom")
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> 
> [1] https://wiki.osdev.org/RSDP#Detecting_the_RSDP
> 

Queued, thanks for both the fix and the Cc.

Paolo


