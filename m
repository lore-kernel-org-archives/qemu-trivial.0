Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXznB-00052R-Ld
	for mharc-qemu-trivial@gnu.org; Sun, 18 Apr 2021 01:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzn9-00050H-Km
 for qemu-trivial@nongnu.org; Sun, 18 Apr 2021 01:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzn5-00041N-MA
 for qemu-trivial@nongnu.org; Sun, 18 Apr 2021 01:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618722975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBNspBYgWx/iXA3FFi7GF1OO0TrZ4MRAmcgZLV8LXRM=;
 b=JD4tSMSfnssVrjFm6Vn0lutHkimTyndp0+1h7oz48nysKZoijzUsUmO9/ywxin6rFf+Dao
 Wxw14bsNF7vpeLoI8fRyIJ159lkElfRMJ2w9RAAxX+Sh6IHPX6gp6JffqBzkjXD6VWYsXr
 1jJMRfKZUx+N4THjJK5hDoemenzNLrQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-X-fAsXoWP0Ou7iiMvFQrGQ-1; Sun, 18 Apr 2021 01:16:12 -0400
X-MC-Unique: X-fAsXoWP0Ou7iiMvFQrGQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020a5d68ca0000b0290102982b78eeso7001613wrw.16
 for <qemu-trivial@nongnu.org>; Sat, 17 Apr 2021 22:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RBNspBYgWx/iXA3FFi7GF1OO0TrZ4MRAmcgZLV8LXRM=;
 b=s0mbUd+iuJvBEw/O6DBZsU3mN95eLkcYVKC2LlEXHBniMlKfa8JQ+X0GjfF1dDf8nJ
 KpMEa5ne4oSCTPZFy/2QnRhHihzK6bLszp6SEMv8K1RN04CR8U4VqNxvw3erylWJl0Rg
 /kFi0xeyv2D/y5e2YnkiDQMAmT24ajusNQ+qwcrmtUXUpROnAKldAUBfEKbXe8LhjyPD
 3/drQSGJqEPTjbmt8jXmwHriR9OttFu0lboMjdUTjkANM/AlRuzkTdQcuSh35qJOtQM5
 qE4XkDP0Hw+/U4eP0h8VaRqweMsUgBKypNGqFqPMTjQ8Flcmi91S6Cv90IZMNO3LX02n
 qvng==
X-Gm-Message-State: AOAM532iaKFCEBbR5QR+dD93eMW/0Otd4x3LdqtibmHIIyq8UEuU4qQn
 hwz80VxBsV+mc/hcC/POJp90ltN0XhE6mAmLyEE7d71vnSb2+P3yDNEx8c73R9DUW1Adio+LHQW
 Jnepm6knuWGsaBf5utw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7433188wrp.298.1618722971602; 
 Sat, 17 Apr 2021 22:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGXmjwVeGYaHIx6h3fXDW945qW5JUIPxfjiYz25FYDNX1ZIIxl+ro3044UXBdFOYwFRPjZmw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7433165wrp.298.1618722971300; 
 Sat, 17 Apr 2021 22:16:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u9sm15373694wmc.38.2021.04.17.22.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:16:10 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] mptsas: remove unused MPTSASState.pending
 (CVE-2021-3392)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Don Slutz <Don@CloudSwitch.com>, Li Qiang <liq3ea@gmail.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>
References: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
 <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
 <f703a175-cddc-269a-dfbd-303b31cf7f27@redhat.com>
 <fac3b5e0-fec4-213c-1f4c-2488a179717c@redhat.com>
Message-ID: <ecd26542-c466-9bb8-2a32-b824fe9024d4@redhat.com>
Date: Sun, 18 Apr 2021 07:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fac3b5e0-fec4-213c-1f4c-2488a179717c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Sun, 18 Apr 2021 05:16:19 -0000

On 4/18/21 7:14 AM, Philippe Mathieu-Daudé wrote:
> On 4/16/21 1:33 PM, Philippe Mathieu-Daudé wrote:
>> Cc'ing maintainers.
>>
>> On 4/16/21 1:27 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/16/21 12:22 PM, Michael Tokarev wrote:
>>>> During previous attempt to fix CVE-2021-3392 it was discovered
>>>> that MPTSASState.pending is actually not used. So instead of
>>>> fixing the prob, just remove the offending code entirely
>>>
>>> What problem?
> 
> Digging a bit I found:
> https://bugs.launchpad.net/qemu/+bug/1914236
> and Paolo's comment:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> 
> So your patch now makes sense, but please:
> 
> 1/ Reword including Prasad description:
> 
> """
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
> 
> Since MPTSASState.pending is actually not used, simply remove it.
> """
> 
> 2/ Add:
> 
> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")

And:

Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>

> With it:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>>> Cc: Prasad J Pandit <pjp@fedoraproject.org>
>>>> Cc: qemu-stable@nongnu.org
>>>> ---
>>>>  hw/scsi/mptsas.c | 4 ----
>>>>  hw/scsi/mptsas.h | 1 -
>>>>  2 files changed, 5 deletions(-)


