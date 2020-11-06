Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb2Pi-0007eZ-S4
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 09:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb2Pg-0007eI-Ry
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb2Pe-0006Ie-3D
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604671701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bS11JZvYuw8fQhIRHUl4jInVsxqktGVvq+Wt24XfiM=;
 b=HojbH0hSTiAZS4wE2bvVrpFXytWhof+RNjtvtdZ0sqyH/JNDRwcgkK1Qhkg6feCiX/8Bzc
 ikBaAslt7gv65WwDTFm+83+NYZmKVo5YMPvt5NaLImaJjZGPclzx6TFltEu4uqMk2QBv7Z
 mKYDvCu4D7csrxpjTLGNiuxCgTvvwtA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-5PJkyokVOIuYXb6EwMGZSw-1; Fri, 06 Nov 2020 09:08:18 -0500
X-MC-Unique: 5PJkyokVOIuYXb6EwMGZSw-1
Received: by mail-wm1-f71.google.com with SMTP id a130so601698wmf.0
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 06:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1bS11JZvYuw8fQhIRHUl4jInVsxqktGVvq+Wt24XfiM=;
 b=KdfKMw1wMcuzt9GSHueCOjtSyUVpWEDMlQ1odHX6GicsyggoiZc3CoZOytS2vAjuVj
 64fmJA2ncn16DfJIeVzEcXusAKlUTyzCsL36C5ugNnMoxs9E8gzRt4YJMPZ8oL3HFelK
 GBESbZGtQ6ZZK91WSoOFceQE2E/uSp6ku9HGVoz9i8WO/ZyBXVZTMNU3yoEUzWzbpu3z
 5ZkPETwiI5UBWD9Qr3EFJdyD6G/uOy6QFeXNaCeKVfHD82u5GBb57yhiItUefMv0D7t1
 tYYMsG+TxUMJWOtBEa3pM1DpZAmliJ7QLUGDgZ1683CNbwoaGRF5gRtmFh1cgvtjzigg
 3ShA==
X-Gm-Message-State: AOAM532NGXw4AdYw9Jw35DavwsVmGfB7RAXhhWWqja5sxekfeQgvbkBL
 MZcOCF0xjyX6m2yFd1F5o+b3lT7tS3lkjNG6wmS7MO3mS+SKKn1uLiGCffx0zbYlVeVJfhBeQ4p
 TK2Vn1V7+9A7qfT9RCg==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr2805885wrr.119.1604671696862; 
 Fri, 06 Nov 2020 06:08:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwissxLkze5VqyFHlFxuJVuw89BiHOEdrKz/Q4ezEp8nQiSA/7yuwGmpfFNsHUAOoH9EioDeQ==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr2805848wrr.119.1604671696582; 
 Fri, 06 Nov 2020 06:08:16 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i33sm2274362wri.79.2020.11.06.06.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 06:08:15 -0800 (PST)
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: Gan Qixin <ganqixin@huawei.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
Date: Fri, 6 Nov 2020 15:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 07:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Nov 2020 14:08:25 -0000

On 11/6/20 2:39 PM, Peter Maydell wrote:
> On Fri, 6 Nov 2020 at 13:07, Markus Armbruster <armbru@redhat.com> wrote:
>> The current "warn at 80, error at 90" is a compromise.  It's the result
>> of a lengthy argument.  Why reopen it?
> 
> There was some previous discussion under this thread:
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html
> 
> which I think is what prompted this patch.

Can we keep the error please? Maybe 132 is the next display logical
limit once we increased the warning from 80 to 100.

I understand hardware evolved, we have larger displays with better
resolution and can fit more characters in a line.
I am a bit wary however functions become heavier (more code into
a single function). Maybe this checkpatch change should go with
a another one warning when a function has more than 80 lines,
excluding comments? (Even 80 is too much for my taste).

Regards,

Phil.


