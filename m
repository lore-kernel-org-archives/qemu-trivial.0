Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIKxw-0005eP-VK
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 19:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msmarduch@digitalocean.com>) id 1iIKxu-0005dx-IP
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 19:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msmarduch@digitalocean.com>) id 1iIKxt-0001Gt-6F
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 19:01:54 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:46415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <msmarduch@digitalocean.com>)
 id 1iIKxt-0001Gc-0X
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 19:01:53 -0400
Received: by mail-qk1-x741.google.com with SMTP id 201so3787338qkd.13
 for <qemu-trivial@nongnu.org>; Wed, 09 Oct 2019 16:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B21mcGjow+HfA5VcpPRsbfHtSTTRAoaikUCR4Luqd6Y=;
 b=hzoYwha2tyyZNabISe7F4a7nWEGAw2Whrul2jdt+f3Y0GkfU63QKM36ffnM0dz/1zD
 MDwjyGtRdCz1ND5SwIoWpdYDSL2ocfIl5s9y7XewCDOh1iHHFqyQSKczph2fd3ZpYq5F
 BG9cNKM4Xssr2iPgn/23Pkad+h2F1bH9opI+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B21mcGjow+HfA5VcpPRsbfHtSTTRAoaikUCR4Luqd6Y=;
 b=dgyB0kXF49v+wtUldSfCD2uz3aho3TeAhOL5EP6MkfD8W8Gs+SnCUQUcm6CS1tpO9w
 +vmlwpa4ZHZsoz6MsNpotKo2FX+mMGqXqPM62297a+VzQn/3XzYyb9mXvJa8z2EpvLSH
 gRHluDsPG9f+2nNcuJ4RxRh3JBLRB1dK3v7i08RRpKfy3k3QGUdEMP8VJG3W17MmaBHJ
 2sNp2EMT85uTRQqubVP2Cx7y2tfCmP6VByo8eH0SvQ2IAxG+lrxDG0qCu124y+gNFse8
 RneoMgL8JL9eHoypakOI6rrnEpqIqhqXebxvbHkttt3Bujq1MxNUXefL98Re4KJh+qSF
 Moag==
X-Gm-Message-State: APjAAAXv//Rnx9Ru5rxXLnWp6XVCs7iW7KnbR/hU/7pyn75jNaJTX8Rv
 o/gVpgRLW85Ay9htzUvedWwGPg==
X-Google-Smtp-Source: APXvYqyfrUWn4twJrb2+/FU7qhzh3QlnaIj29vFfwwCY2evpZmd2s0EQXg4Vz1YRoctz0FbGy4J78g==
X-Received: by 2002:a37:9d85:: with SMTP id g127mr6130448qke.158.1570662112111; 
 Wed, 09 Oct 2019 16:01:52 -0700 (PDT)
Received: from ?IPv6:2600:1700:4a30:84c0:8d5e:794e:8a2e:ee89?
 ([2600:1700:4a30:84c0:8d5e:794e:8a2e:ee89])
 by smtp.gmail.com with ESMTPSA id 77sm1854333qke.78.2019.10.09.16.01.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 16:01:51 -0700 (PDT)
Subject: Re: [PATCHv2 0/2] log guest name and memory error type AO, AR for MCEs
To: Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 mtosatti@redhat.com, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, rth@twiddle.net,
 ehabkost@redhat.com
References: <20191009164459.8209-1-msmarduch@digitalocean.com>
 <71149051-f7b9-b3ef-8493-4e2db1644a8d@redhat.com>
From: Mario Smarduch <msmarduch@digitalocean.com>
Message-ID: <913c58df-73ef-8edb-94d5-aeb191ab806c@digitalocean.com>
Date: Wed, 9 Oct 2019 16:01:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <71149051-f7b9-b3ef-8493-4e2db1644a8d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
X-List-Received-Date: Wed, 09 Oct 2019 23:01:55 -0000



On 10/09/2019 02:19 PM, Paolo Bonzini wrote:
> On 09/10/19 18:44, Mario Smarduch wrote:
>> In a large VPC environment we want to log memory error occurrences
>> and log them with guest name and type - there are few use cases
>>
>>
>> - if VM crashes on AR mce inform the user about the reason and resolve the case
>> - if VM hangs notify the user to reboot and resume processing
>> - if VM continues to run let the user know, he/she maybe able to correlate
>>   to vm internal outage
>> - Rawhammer attacks - isolate/determine the attacker possible migrating it off
>>   the hypervisor
>> - In general track memory errors on a hyperviosr over time to determine trends
>>
>> Monitoring our fleet we come across quite a few of these and been
>> able to take action where before there were no clues to the causes.
>>
>> When memory error occurs we get a log entry in qemu log:
>>
>> Guest [Droplet-12345678] 2019-08-02T05:00:11.940270Z qemu-system-x86_64:
>> Guest MCE Memory Error at QEMU addr 0x7f3c7622f000 and GUEST 0x78e42f000
>> addr of type BUS_MCEERR_AR injected
>>
>> with enterprise logging environment we can to take further actions.
>>
>> v1 -> v2:
>> - split into two patches one to get the gustname second to log MCEs 
>> - addressed comments for MCE logging
>>
>> Mario Smarduch (2):
>>   util/qemu-error: add guest name helper with -msg options
>>   target/i386: log MCE guest and host addresses
>>
>>  include/qemu/error-report.h |  1 +
>>  qemu-options.hx             | 10 ++++++----
>>  target/i386/kvm.c           | 29 ++++++++++++++++++++++++-----
>>  util/qemu-error.c           | 31 +++++++++++++++++++++++++++++++
>>  vl.c                        |  5 +++++
>>  5 files changed, 67 insertions(+), 9 deletions(-)
>>
> 
> Queued, thanks.
> 
> Paolo
> 

Great, thanks for the fixup and y'all time.

- Mario

