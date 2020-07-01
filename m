Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqdYA-0004dq-He
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jul 2020 10:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jqdY8-0004aM-GB
 for qemu-trivial@nongnu.org; Wed, 01 Jul 2020 10:17:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55158
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jqdY2-0000p5-K6
 for qemu-trivial@nongnu.org; Wed, 01 Jul 2020 10:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593613033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+CFcFn1h/y7gWygLKNgtZPwE9tfsBRjkTlSxlKkrx8=;
 b=MW/EKEYxOKeLO99zHp86xCHEr0BP8yQPtQJ9IyDYLjzX73r7QI+tHn8yXiyaH7SQvMmrrg
 y8CQsnP+8cz/CTdFe33gjPEGt6vyK+4cxAEiC0KBsiM3V85dLRzyhr6tZRVeEV6yRCGTxX
 55GfCgT3xFULyxJp2WyFElBjmcyUmqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-g1oS7VTIMyWFnIfIUVM8TA-1; Wed, 01 Jul 2020 10:17:06 -0400
X-MC-Unique: g1oS7VTIMyWFnIfIUVM8TA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38BE885B673;
 Wed,  1 Jul 2020 14:17:03 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B488C1057FD7;
 Wed,  1 Jul 2020 14:16:34 +0000 (UTC)
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, David CARLIER
 <devnexen@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
 <CAFEAcA8jkzf8+d5AyAVH2HJ544TyHsM4xP5tpWsKiJbJtWMjKw@mail.gmail.com>
 <20200630165356.2ka2ltwmrfjb5msn@sirius.home.kraxel.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3eb3c266-1a83-9f40-4760-1ab2578ae5d6@redhat.com>
Date: Wed, 1 Jul 2020 09:16:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630165356.2ka2ltwmrfjb5msn@sirius.home.kraxel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 22:25:53
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
X-List-Received-Date: Wed, 01 Jul 2020 14:17:20 -0000

On 6/30/20 11:53 AM, Gerd Hoffmann wrote:
>>>>> -util-obj-$(CONFIG_POSIX) += drm.o
>>>>> +util-obj-$(CONFIG_LINUX) += drm.o
>>>
>>> Can't see anything linux-specific there.  Also note that FreeBSD (and
>>> possibly other *BSDs too) have drm support.  So CONFIG_POSIX looks
>>> correct to me.
>>
>> This change was my suggestion; I assumed that "open /dev/dri/whatever"
>> was Linux-specific. The specific thing that doesn't work on
>> Haiku, or on Solaris for that matter, is that the code uses
>> DT_CHR, which isn't in POSIX but is a Linux-and-BSDism.
> 
> Ah, that is the problem.  Yes, DT_CHR is an non-posix optimization which
> allows to get the file type directly, without another round-trip to the
> kernel.  If that isn't available you can stat() the file and check
> ((st_mode & S_IFMT) == S_IFCHR) instead.

Even when d_type and DT_CHR is available, there are filesystems where 
the Linux kernel reports d_type of DT_UNKNOWN, and where you are best 
having that code also falling back to an fstat().  In short, any 
portable code that uses d_type should have fallback code for DT_UNKNOWN, 
at which point porting to systems without d_type is as easy as writing 
an accessor macro that returns d_type when it exists and DT_UNKNOWN 
where it doesn't.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


