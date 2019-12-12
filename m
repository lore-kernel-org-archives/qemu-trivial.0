Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifCwe-00069a-RZ
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 20:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifCwY-00066M-Rc
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 20:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifCwW-0006z9-9w
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 20:07:01 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33117
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifCwV-0006vf-Lb
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 20:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576112818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXJKZz5IsL95cyHTFXpZXRIU3W8hP875CCGZBLk77i8=;
 b=P9G5Tkuf6pHoJH6W6BUh0eYO/DZit7ZOdHn28zfQ++mTynFLFIbkLzg4Pzg2/HMq63/xnf
 YYpMGgGQAYUp2sCI1Xmt+O/Y11Q3onuzkBgrkqKCQM2RdZChwEAuHHGAY3myCuc6zDf75o
 TbaDZj+1VvBCvsn+ErNzBHeHEyiOuPo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Ai6M09QUNOWJk0xSqJLdGA-1; Wed, 11 Dec 2019 20:06:55 -0500
Received: by mail-wr1-f70.google.com with SMTP id d8so343486wrq.12
 for <qemu-trivial@nongnu.org>; Wed, 11 Dec 2019 17:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TXJKZz5IsL95cyHTFXpZXRIU3W8hP875CCGZBLk77i8=;
 b=iVpsKBhJuUd9Sm9oVQS0BKuhHE4qvcXNN160aSLGNbY3pz153knOBhL+2SJ4K9fHv1
 paRv3Y5GviNRLtX2Q1KzfmBkAUeB1QTHmx8K/JxRqE63tKqqlOgwCXGwJXWAXEJ7k2fi
 ZjyXGAqZJRSKEBBmCScT+SQpwtK1puA6oCkXLZP19dUaBcaSxu/kllvRc+zBpDMvz6v1
 BCu61iZFjwAFZFCBhSvGrBzpeull22J0uTHEQ2AX6JUPzix7Th8+9bykTdCSENNjFQ+E
 C15D2nqxc+P1mYviytujI2Ta4xux3eD2ZAOAt4Mz7D9cikJdFeT7CkMGU4umF9AcnZXa
 12Vg==
X-Gm-Message-State: APjAAAWFj+L5KvmUMulOwSqOHUHBuBsCZfbX8GHfIsFN6rcovE68et4B
 nm3q49kefZF1KTCRu9ZNHXRvBY/coFC+5hD+0aCX0Qo/ByNR1xA9fQVCMunmmjT2yUc8zwwnWii
 gPFYFpOts0dI5f0UQkQ==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr3248011wmi.15.1576112814344; 
 Wed, 11 Dec 2019 17:06:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1foYlnLzY1o69NXI2yoGk2Zq3N0QqKKpGV1L1WLv6gjpTXaAkmrH+RDRPxdaZEDEsF4zmTg==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr3247990wmi.15.1576112814058; 
 Wed, 11 Dec 2019 17:06:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id t12sm4118804wrs.96.2019.12.11.17.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:06:53 -0800 (PST)
Subject: Re: [PATCH] migration: fix stringop-truncation warning
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-3-git-send-email-pbonzini@redhat.com>
 <ce08ed58-78f0-83c8-404c-4caa76d38569@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3de9def-b922-7469-8534-a448bf3384cc@redhat.com>
Date: Thu, 12 Dec 2019 02:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ce08ed58-78f0-83c8-404c-4caa76d38569@linaro.org>
Content-Language: en-US
X-MC-Unique: Ai6M09QUNOWJk0xSqJLdGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 12 Dec 2019 01:07:05 -0000

On 12/12/19 01:55, Richard Henderson wrote:
> On 12/11/19 6:23 AM, Paolo Bonzini wrote:
>> @@ -44,8 +44,7 @@ void global_state_store_running(void)
>>  {
>>      const char *state = RunState_str(RUN_STATE_RUNNING);
>>      assert(strlen(state) < sizeof(global_state.runstate));
>> -    strncpy((char *)global_state.runstate,
>> -           state, sizeof(global_state.runstate));
>> +    memcpy(global_state.runstate, state, strlen(state) + 1);
> 
> We should assign the strlen result to a local variable rather than compute it
> twice.

We could even strcpy since the assertion ensures it's valid, but perhaps
it's better to do nothing, since the best alternative would be
memset+strcpy, i.e. back to strncpy.

We generally are quite mindful about our uses of strncpy, but maybe we
could fold the assertion and strncpy into a qemu_strncpy function,
and/or qemu_strncpy_nonul for when you're copying into an array that
does _not_ need to be nul-terminated (so the assertion can become <=
rather than <).  I'll add it to BiteSizedTasks.

Paolo


