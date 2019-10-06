Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHEb7-0000T2-On
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2019 18:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msmarduch@digitalocean.com>) id 1iHEb4-0000Se-LA
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 18:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msmarduch@digitalocean.com>) id 1iHEb1-00080W-E2
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 18:01:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33406)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <msmarduch@digitalocean.com>)
 id 1iHEaz-0007ze-MY
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 18:01:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id 60so9445681otu.0
 for <qemu-trivial@nongnu.org>; Sun, 06 Oct 2019 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9DFR8yC2x/5u/5qAWy8C41+BwugyFIuapuCKaLIFcSY=;
 b=CQH24xo/dEdJvX6QxaIQ1ZXB482Q//hKKufBtwTAC81oFBmQfx54Ym1xpeMrMSVEOc
 ZWP2OE4RGc7CLZ++NsXGRC2oReDrnapBbQEJzLC2MGYoRxy2JDu+bdKkUb8oGJTjudxA
 MSOhLzhmVEtszK3RfsMdIW9Wbj37oElTZcW5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9DFR8yC2x/5u/5qAWy8C41+BwugyFIuapuCKaLIFcSY=;
 b=Uzfsu2/cDcxa7UEqpYxduGLO5skczTXeJRBBte44p2y/Nycr22NSgH5TIjzd5xiF+3
 sryiJMaQI2xDBFvG8bsutq79kihK+XLr65m9Ts1PxMBDA088fGYqqdHOuOmj4jYb6uN8
 SdvrCyGRszBWb4TjYljKf5qK2TjRANeH5Xkuop3dtiTnrsaeWqJ9p2udXA7LvgJjPsFT
 28/xpo5Cute5/cspy0QZ0ujKTagnMTS3NgsVEa+baBMJ3aG+IYZ2At0vMCcYDZZis6i2
 3a+zA5TeU4XXV2K6hSOb09OmG6PfPKWGzWa+Cd86Ffp4povi43EuBPhCB+y9ko6gzG42
 5wNw==
X-Gm-Message-State: APjAAAXSHWzY0CWENQW9o5ecGOrxsHmdEd6Zyhpr8FS584o1ifYNbe2Q
 q9goO3Uilw35e1z0xkOdoquzJYrZGH7bRw==
X-Google-Smtp-Source: APXvYqw19IkA27esOslvO0Wla1T1BepeOZ0b6ca9J6ipzCRIyCsCmB8hL7bG3dXPxoIEtcpXTmNWSw==
X-Received: by 2002:a05:6830:1292:: with SMTP id
 z18mr19510887otp.7.1570399299419; 
 Sun, 06 Oct 2019 15:01:39 -0700 (PDT)
Received: from ?IPv6:2600:1700:4a30:84c0:a5c5:faec:38bb:f557?
 ([2600:1700:4a30:84c0:a5c5:faec:38bb:f557])
 by smtp.gmail.com with ESMTPSA id a88sm4065197otb.0.2019.10.06.15.01.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Oct 2019 15:01:38 -0700 (PDT)
Subject: Re: [PATCH] target/i386: log guest name and memory error type AO, AR
 for MCEs
To: Paolo Bonzini <pbonzini@redhat.com>, mtosatti@redhat.com, armbru@redhat.com
Cc: qemu-devel@nongnu.org, rth@twiddle.net, ehabkost@redhat.com,
 qemu-trivial@nongnu.org
References: <ceb4d639-842a-30bd-5d54-bfacb07b5cc4@digitalocean.com>
 <c78d014f-20f4-d25f-e50a-92c960200d7e@redhat.com>
From: Mario Smarduch <msmarduch@digitalocean.com>
Message-ID: <5032a0a0-afff-a7e6-1adc-996dbe4cf086@digitalocean.com>
Date: Sun, 6 Oct 2019 15:01:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c78d014f-20f4-d25f-e50a-92c960200d7e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Sun, 06 Oct 2019 22:01:47 -0000



On 10/06/2019 09:11 AM, Paolo Bonzini wrote:
> On 05/10/19 01:53, Mario Smarduch wrote:
>> Guest [Droplet-12345678] 2019-08-02T05:00:11.940270Z qemu-system-x86_64:
>> Guest MCE Memory Error at qemu addr 0x7f3c7622f000 and guest 78e42f000
>> addr of type BUS_MCEERR_AR injected
>>
>> with enterprise logging environment we can to take further actions.
>>
>> Signed-off-by: Mario Smarduch <msmarduch@digitalocean.com>
> 
> The guest name part should be a separate patch, controlled by "-msg
> name=on" or something like that.  The MCE parts look good okay.  Can you
> split the patch in two?
> 
> Paolo
> 
Yes will do.

thanks.

