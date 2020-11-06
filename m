Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb33Z-0000lW-4n
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 09:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb33X-0000k8-M5
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb33W-0003cb-2j
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 09:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604674172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3RAt5gU4b6xZjcbF/eXTV1ap+70W4fuDZRQSNFImrY=;
 b=D+RWN71gN+YCKScQVY75EPiLhI1XMurpgiVXYVXdQC08830yHy7YdbKOaWHYu+Ml66dAOu
 q09/gdV32LoL6dufyJE3jFjHakz5oYphI477+bDS51D1wrtr/ySTT6bv3KPp4/mReO0xCr
 TyDp52RQw4iUJLodHnHseP+WepCyrN0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-lmbQ4BPlOgiq5W5xFnrL2g-1; Fri, 06 Nov 2020 09:49:30 -0500
X-MC-Unique: lmbQ4BPlOgiq5W5xFnrL2g-1
Received: by mail-wr1-f69.google.com with SMTP id v14so552072wro.12
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 06:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p3RAt5gU4b6xZjcbF/eXTV1ap+70W4fuDZRQSNFImrY=;
 b=CRMeq3cF14dfT0LoPBi3ztMRPp0Pgzp7Hr3Yw4wO2J/JTThvNW9EJFJ1EyDJBGWL8r
 Vw9F8ETu7d6t1KhDCtMAekIalhBRF/ebPLvUZLA9qCPYTvocU7i1vnv0LkgnAeU6oXCA
 5J1zSO5SPJhwGhwjG8gpV7hua8NMMw4gxQuM/UChsxDnMOFqDiK81zP30BDP1h0IjR9W
 91o1URgFUDViNy0dA197uIz9DmZYYFoTV2J/4gLoEaCffx3NwCFRjOnRJsKNdgpQRbsJ
 vO0IMQZeSYliRXFyRH15lqVw+rM+ebcVWRmgRrLFqm0+kksqi1pO5Hk7aw1C7mzLgGWZ
 yDbA==
X-Gm-Message-State: AOAM5320+oNxLVChqV4yMo6lmGt9dHdIhQrzduER4Ot2jI0SLPsOYa9p
 qMm2enh6r+cyO3QAxRrFwRlgcR/shc5spVivevuOkDulzu3swHTxSq4bMGiDn3MeMT25RG/OMny
 J3qDP2LoGZkAGlm8mOg==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr3316867wre.55.1604674169210;
 Fri, 06 Nov 2020 06:49:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNfigChjYNIUrTqxd+fy+WfbQTdIDSXPIZDwDpHhVixTnfa37iHhJT2gOCgcgD1CLFm82j1A==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr3316838wre.55.1604674168965;
 Fri, 06 Nov 2020 06:49:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 89sm2739596wrp.58.2020.11.06.06.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 06:49:28 -0800 (PST)
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Gan Qixin <ganqixin@huawei.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
 <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66edd934-0ff0-bc91-7539-a6792c1906e9@redhat.com>
Date: Fri, 6 Nov 2020 15:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
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
X-List-Received-Date: Fri, 06 Nov 2020 14:49:35 -0000

On 11/6/20 3:16 PM, Peter Maydell wrote:
> On Fri, 6 Nov 2020 at 14:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Can we keep the error please? Maybe 132 is the next display logical
>> limit once we increased the warning from 80 to 100.
>>
>> I understand hardware evolved, we have larger displays with better
>> resolution and can fit more characters in a line.
>> I am a bit wary however functions become heavier (more code into
>> a single function). Maybe this checkpatch change should go with
>> a another one warning when a function has more than 80 lines,
>> excluding comments? (Even 80 is too much for my taste).
> 
> Personally I just don't think checkpatch should be nudging people
> into folding 85-character lines, especially when there are
> multiple very similar lines in a row and only one would get
> folded, eg the prototypes in target/arm/helper.h -- some of
> these just edge beyond 80 characters and I think wrapping them
> is clearly worse for readability. If we don't want people
> sending us "style fix" patches which wrap >80 char lines
> (which I think we do not) then we shouldn't have checkpatch
> complain about them, because if it does then that's what we get.

I think I was not clear. I am not arguing against changing the *length*
limit of a line (although I'd still keep one, as I don't think we want
lines with 500 characters). I'm suggesting an orthogonal change,
restricting the number of lines in a function :)

> 
> thanks
> -- PMM
> 


