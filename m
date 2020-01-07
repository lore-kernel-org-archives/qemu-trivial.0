Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioix6-00072L-Jh
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 02:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioix1-0006mk-Jx
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 02:06:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioix0-0001Ng-7w
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 02:06:51 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43257
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioix0-0001NI-3M
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 02:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578380809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Y9gMMUcwgkrMk7f9O1CDwtG2DUeIx7yjjMWuIxNueE=;
 b=hwNHWv0FE1RCV6lIi9kHOw2Qm5Qu9FuhEdPoxJVrNAhzh0+Q9K/5JTpZv5f9+ZpEoEYiu0
 EY+j7OcCTSHWBQcbGjICuzWsacSq5FM33Lf3ImrxqR2e+iP86fpb1SHr3wcNUyjf/PAGHm
 dc8+M2ChdHNI/ZbLi2KTx1NRCvDiajA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-duoce_PKOP2PGhacred9CQ-1; Tue, 07 Jan 2020 02:06:48 -0500
Received: by mail-wr1-f72.google.com with SMTP id f10so19986421wro.14
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 23:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Y9gMMUcwgkrMk7f9O1CDwtG2DUeIx7yjjMWuIxNueE=;
 b=HJdjEJoDPGSZxHBjjKz6m4H86Ep+b0HR3qyV3po2nyZUhTtz6QrxH6LQ+wigFxEMim
 2+AlafQyizw8/geYh6UpKtjOAGsLg2zLfSW48FAs+0hyL2PqcZZ2NryKqgOtD7NjWGWc
 5cpOe4ZhPflGWpDNoC5OpHsUcbZ6Cvc47SFNT8RxUxF/X8WW03faOBmvLtPleyQF6niZ
 Pipdk7aRjiw1WEdbYVz7M5ZNMb+xFD3PSgY6YJk5Kkp8JPpSFI+oaU2uopSyY0GUxZKN
 Qul9cQghp3qCPxeE10pPPsNjMKWLhjSjo/evRi2odoTE+bIgAd5GJpW7XqWjHynnRAo6
 PKuw==
X-Gm-Message-State: APjAAAXJ0ju4WRcoIy4N152c2K0FCIo5cv5AecIY9RYpY/WaaIk+KheQ
 j6zhCa99GYad8uXr0OBSo+VwvQ5Kc+lJqU+XJomhxWe+U1g+JiyosvaGX0EeslsSma8Tn/i3ieu
 38NHKQuS7ZU49o003lA==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr38658977wmc.21.1578380807332; 
 Mon, 06 Jan 2020 23:06:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHfUSYrv88SY2ptPqMpnoThf6pTogfcjb1juerzpfcRegHV8MrQB7+IKVusIQNhFRzvuukVQ==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr38658950wmc.21.1578380807048; 
 Mon, 06 Jan 2020 23:06:47 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id x10sm75070249wrp.58.2020.01.06.23.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 23:06:46 -0800 (PST)
Subject: Re: [PATCH v1 00/59] trivial unneeded labels cleanup
To: Kevin Wolf <kwolf@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, minyard@acm.org
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106195457.GE2886@minyard.net>
 <f71eb524-571b-54d1-1a99-95d2896f6586@gmail.com>
 <20200107061613.GB4076@linux.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cacf1a76-366e-7209-3f5e-3bb6728c2e8a@redhat.com>
Date: Tue, 7 Jan 2020 08:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107061613.GB4076@linux.fritz.box>
Content-Language: en-US
X-MC-Unique: duoce_PKOP2PGhacred9CQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 07 Jan 2020 07:06:54 -0000

On 1/7/20 7:16 AM, Kevin Wolf wrote:
> Am 06.01.2020 um 21:35 hat Daniel Henrique Barboza geschrieben:
>> On 1/6/20 4:54 PM, Corey Minyard wrote:
>>> On Mon, Jan 06, 2020 at 03:23:26PM -0300, Daniel Henrique Barboza wrote:
>>>> Hello,
>> [...]
>>>>
>>>> Which is cleaner and requires less brain cycles to wonder
>>>> whether the 'cleanup' label does anything special, such
>>>> as a heap memory cleanup.
>>>
>>> I would disagree with this analysis.  To me, I often wonder
>>> when I have to add cleanup code to a routine whether there is
>>> some hidden return in the middle of the function.  That's a lot
>>> harder to spot than just looking for the cleanup label at the
>>> end of the function to see what it does.  For non-trivial
>>> functions I prefer to have one point of return at the end
>>> (and maybe some minor checks with returns right at the beginning).
>>> I'm not adamant about this, just my opinion.
> 
> It depends on the case, but yes, I had similar thoughts, at least when
> we're talking about non-trivial parts of a function. (Very short
> functions of just some initial checks returning directly are usually
> fine.)

 From a debugging point of view, and when adding trace-events, it is 
easier to have a single function exit path.

In various functions modified by your patches, we can split big 
functions in smaller ones and avoid the goto label.


