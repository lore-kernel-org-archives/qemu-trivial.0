Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B60CD4F52
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 May 2026 12:33:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wOx8G-0003kp-Fg; Mon, 18 May 2026 08:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOx80-0003hO-NW
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 08:31:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOx7w-00049N-J9
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 08:31:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso1898092f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779107463; x=1779712263; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o9dCBHREVN4FOUkZ7TOOiDnBqojjUMpj/VFwISRHQ94=;
 b=pyhKWZw01tbH+FbfgP/gmM7TiMGYpfTm2gMXvZ62qSWUn/P9fm0YMq0KNSXihaFeIl
 u2adrskv4tpERrPJvq9tIkX192+yPfFC7B5gKw55T9wwI1gcUcc/DDg1SoyLogsBXLA+
 ygUsUmVJq8BVC5a/8TvBvvMLwkMP40p3WYyS+smdz526LbYUJnIljzpOCERVDH/zwToo
 D0ENIdZ4T96Ssn0AOD9ElfeQva4kcVfa7G7gUKBYPU/TKz9Xtz62LdUJ5rB6PFauiQ/T
 BpNUuk8PsfCBCTH6QxV4kMSeJqxLdDlHZ1K9rQkR+/iB/jV77fEx1cIHwoXJbCZ0v5GN
 FYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779107463; x=1779712263;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o9dCBHREVN4FOUkZ7TOOiDnBqojjUMpj/VFwISRHQ94=;
 b=iMJz6LjW05jwT4K88h0uO8mjkXZvU4yO488qXlrdNGEKbQ6VIO4Gja1a8NRKFwLsFR
 0clVyEh6T8yw0ZbGZYkd3OVqbRdr6FcDFN0F1EaIPXI2e3xN6G/XG+1NxK7e155cllrW
 7ETXp3EYZGW/S9Bl5s9nQULHMSm7sWGGdVyKlXtZdfAwzYhC5mEKwbXXUlxFcRH2Wt7+
 5u8xVPLtdneSVsPIzMZV3b8bOSpFs+wHqwdTNv7dn7VtAfWwhWWXh1ZH45aZFOXdEJ7q
 3E3eJM1WfZj7/XgHcnkw9cFajf4Vil5PPanJS2Xv/o0wKNNKZdJsEXXFSZlDEC8azZjY
 E5IQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rsG74/gBPNdhigIbyk4s/V8qVhyIpbYwLoHRYL2tnOoJziY/xEy5UUfd05R6kYGOEMOOWXrFSUiOHTII=@nongnu.org
X-Gm-Message-State: AOJu0Yy1NFzQme7VYqibVp/MFE3M3PJt9LKQfbPeRelwCiqb88S7dC0G
 XadY5nlFQfT3YPVzmAcp+/eWFYeTMndYBKxjHcUWtyya+DxUYKxRAxZ2/j/xnj7FDFc=
X-Gm-Gg: Acq92OGUZAoIdPw5JPn8mFlysgvcQ3fRRAS/hAzlSguhht2GzbHXxP4uxkZOzNyJDkW
 LwJTrRJ/R6Ot/Z/DgezW1zxOjz94Py2+BGLO+0OcvIPTd5cvPg7FU7ZI0GEQP+DBCVLOgfBnWa6
 15IZh3XBh5luuUTId9vrHmFfLMSVwkDFBMGyaxsjmpBOYEhd81z7SfpCBqQDRMPa9IJwP92ZYiv
 GDEAJ1TS7O2mXqrVXSs4ScN7yVUlkDDlzdTk6YhXUk+hKwGrLGbSXWaW51fx26hz4NVUydK3oR0
 n8jkQLGC3A1Qud833ejEZViMOlrDsA0Ly6RGAgg0drip6i3nwZJQ1EBy698+4U40C6+mBJssBMT
 DKEgQCy6eNQJAnWrkNXQ0JdlYAfeUjlAM93m+peDDDXf+U91BxIDfwrqo0coiBkgMRzjJciu0jV
 IsB8elbt0jnej/6rZ3DvoMdQj5bTt5tQQ28KLMLCTtwSQELaR+J7MKtGYzPiW6gyIz0w==
X-Received: by 2002:a5d:5d82:0:b0:45c:1c89:b1c6 with SMTP id
 ffacd0b85a97d-45e5c5952e7mr24788660f8f.33.1779107462934; 
 Mon, 18 May 2026 05:31:02 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39806sm36236632f8f.9.2026.05.18.05.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 05:31:02 -0700 (PDT)
Message-ID: <eae9fbe5-a09a-40a0-b299-d0039fcbfab8@linaro.org>
Date: Mon, 18 May 2026 14:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/vl: Free allocate memory for pid file name in case
 realpath() failed
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: f.ebner@proxmox.com, qemu-trivial@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <20260515143854.2010741-1-thuth@redhat.com>
 <1aec7543-ea5a-482c-a42e-fb1cdb0e7498@linaro.org>
 <b6cc3aa4-6c32-4ebf-90f9-efb7f2a9b897@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b6cc3aa4-6c32-4ebf-90f9-efb7f2a9b897@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 18/5/26 13:50, Thomas Huth wrote:
> On 16/05/2026 12.13, Philippe Mathieu-Daudé wrote:
>> On 15/5/26 16:38, Thomas Huth wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> In case realpath() fails, the code returns early in the function
>>> qemu_maybe_daemonize(), without freeing the allocated memory. Add
>>> a g_free() here to fix it.
>>>
>>> Fixes: dee2a4d4d2f ("vl: defuse PID file path resolve error")
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   system/vl.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/system/vl.c b/system/vl.c
>>> index d2f4044e5d8..7e2ed898240 100644
>>> --- a/system/vl.c
>>> +++ b/system/vl.c
>>> @@ -2670,6 +2670,7 @@ static void qemu_maybe_daemonize(const char 
>>> *pid_file)
>>>                   warn_report("not removing PID file on exit: cannot 
>>> resolve PID "
>>>                               "file path: %s: %s", pid_file, 
>>> strerror(errno));
>>>               }
>>> +            g_free(pid_file_realpath);
>>>               return;
>>>           }
>>
>> Don't we also need to release the other paths?
>>
>>   - qemu_unlink_pidfile()
>>   - pid_file_init()
>>   - pid_file_cleanup()
> 
> Adding it to qemu_unlink_pidfile() makes sense here (though QEMU is 
> terminating anyway afterwards, some malloc sanitizers might complain 
> otherwise), so I sent a v2 for this.
> 
> pid_file_init() and pid_file_cleanup() is in the storage daemon, so this 
> is a separate problem (the variable just has the same name there). Not 
> sure whether it's worth the effort to free the memory there, too, since 
> the code exits afterwards anyway, and the pointer is kept 'til the end?

OK, fine!

> 
>   Thomas
> 
> 


