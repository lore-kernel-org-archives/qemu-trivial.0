Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9pCN-0005hd-HI
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9pCC-0005en-GJ
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9pCB-0004JR-G6
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:01:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9pCB-0004HE-B3
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583409702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar8CYivpVy6FUoJvhUtX6ynC1Z30c2C8GMW/wP3ZGlw=;
 b=LIgY5dpuXKlHyOb0nPQdU1IEKERnpYJQGczTrAfLVHbwjnw7J9mX0TrJbrWWWHGtquwvxa
 83SeolUGqLxQuBmaJ6SyIgY2iqOaiRWNkg3KGfSq20Q6yySKK87y9Fcl1w1z8IZAJlTouH
 1M4/u+PbDJgeTnW2pfZFiLjftg6y3mo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-JxAnlIu9PUmm9U1L0XpVSw-1; Thu, 05 Mar 2020 07:01:41 -0500
X-MC-Unique: JxAnlIu9PUmm9U1L0XpVSw-1
Received: by mail-ed1-f71.google.com with SMTP id y35so4205617ede.4
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ar8CYivpVy6FUoJvhUtX6ynC1Z30c2C8GMW/wP3ZGlw=;
 b=J+mN1Japt+edIMIu8hwmmxNxa5NkBHU2wefWcP22xMBJudOxJnZ3xBRsik/izyTWwb
 DPHE4hI+mKpjCu3J42hHtD8JCP8bntzQrCiFL2yuojtpwILrEB9zwWbvJ4i5x8aLcP0n
 32p90VAwfJqXN9dbjCDGf6lq9GIWROPfoeYKOYxa5orGMPGSHcmuIst3uKSo31/F/T7P
 5hiNOp5xZvh7p9NeKBZloyW53cg7qK+9G/RXhYndJUw8Qe0gh4ME2QWlduWio+4k0Rok
 7ZGv/k7NVRUzb9sWFv1mYjeLPhSPB5yUslavnC4t1WIPMgELdMJYx0tZu9pOa2mcV40U
 KpJg==
X-Gm-Message-State: ANhLgQ3zBNl5gGl9Y3y7Fpc+x3PFh5tCjsHNCilGJjTffnrLS5+wzZ9B
 oHqPyarW14+H8/SIG5EDP5g/tfYKb1t/X3acGv44ktTEvaHbohKrOni/TAMa3VlB9eKRBZVvAo1
 JUAbOIpJ5+keYnX0uPA==
X-Received: by 2002:a17:906:f44:: with SMTP id h4mr7329106ejj.44.1583409699498; 
 Thu, 05 Mar 2020 04:01:39 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs1BTaMHRvNgQVM2YmYdD9IWJ3dgCsKgcJGQNwkPzMjWYO8LSagSRFcOcUuIaP8ONNd2V9FXw==
X-Received: by 2002:a17:906:f44:: with SMTP id h4mr7329071ejj.44.1583409699188; 
 Thu, 05 Mar 2020 04:01:39 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id gf7sm1028813ejb.57.2020.03.05.04.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 04:01:38 -0800 (PST)
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata by
 10KiB
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
 <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
 <a5b6cddf-5887-be27-db76-2e515daa2c11@redhat.com>
 <CAP+75-XBbTPHbQJWxn5nEYsz4hdGXSTLTqKRRR-sx-APbPN2Sg@mail.gmail.com>
 <20200305115910.zhmaw3xqgoz4fan2@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ce21679-20c1-19db-c0df-9c7cb1bff629@redhat.com>
Date: Thu, 5 Mar 2020 13:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305115910.zhmaw3xqgoz4fan2@sirius.home.kraxel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 12:01:45 -0000

On 3/5/20 12:59 PM, Gerd Hoffmann wrote:
>>> And went this less intrusive way.
>>>
>>> I'll respin with s/-1/UINT8_MAX/.
>>
>> Problem, now this entry is ignored (interface_class==-1):
> 
> Yep, "-1" is used as "not used" or "end-of-list" indicator, and it is
> outside the valid range to avoid that kind of clashes.  You need some
> other way to express that if you want go with smaller types which don't
> allow values outside the valid range any more.  Add a "flags" field for
> that maybe?

Oh I wasn't expecting 0xffff valid for idVendor /
idProduct, neither 0xff for bInterfaceClass / bInterfaceSubClass /
bInterfaceProtocol. Well maybe it doesn't worth the churn for 10KB of 
.rodata.


