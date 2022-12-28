Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAbWY-0000oJ-Vv
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2022 13:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAbWY-0000nv-9Z
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 13:51:34 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAbWW-0002sg-AD
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 13:51:33 -0500
Received: by mail-ej1-x634.google.com with SMTP id jo4so40191186ejb.7
 for <qemu-trivial@nongnu.org>; Wed, 28 Dec 2022 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zIqPkPKYGyGstvfFLENN71HfavU8XzDhedtJd5Ne8Y=;
 b=Umzgvtcne9+X91ACmMNvrisru9hUZOf+I39VCoGl6GPifj01hNPvzhEaSTD3283AGT
 RPCVP1rkTU7ID2vCvJZndWpHNTN4/y4W95fw6ZFSO1q60laykXsxnc3edNW330rXCdQB
 L+5bTf+ueQs9dc1WamqG+nFNCXY0qfr1igtMrLqBQ5vcw0349C/rm0iOJyp3BK8aGlTi
 8dQNtT5U3KwR2o2iIzxZrr9vJBBzwgquKHKGoKKuZ+oFVVK6fsZdUBwnUm7L66ZGqlh+
 ccBKoywJ8TYAOijwoCmycTUkeKmmLSp6wfeZ5+nh15kXeMCjrA+lqmBbg/YrrMFICTiz
 CPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zIqPkPKYGyGstvfFLENN71HfavU8XzDhedtJd5Ne8Y=;
 b=pzP8N5usgrXbjZ+67fOPKn5F5p5wy8VvWMo9/LXoEeSUWYfOusTCUc6zfjgQ6cevgz
 bHu5aTEIrH2ESTFaZIzOkC5rECeDRUsNl1ML0OCf7i7mfVJtPSbDfBJemVfLd7NXx4Dc
 ycJH2SE32BA3vRVN/yHI1H6gnBIpggdrh8xd6hfRF3amjk89FB8JujvxFv24KEarcbQB
 pJAy0BXUPYMp73NCdzXW17x4AuwKuwq3zWicc76fkWTMQNYnysWL7vqyJx54jzmbvkBS
 fhlo+hNf1dhnbReMESLMTvyGU2hYSSyLyRUUCM4dsUgnIsQLT6cfeFDmtP/dV47Cw9gM
 Dfnw==
X-Gm-Message-State: AFqh2krV7bb+2iG0YPBlot//HzC8a9t/VwGdDQu2sViqJDRT8UsjWIqR
 bA8wXR9MZ9NJe66iLvsLuMEONA==
X-Google-Smtp-Source: AMrXdXsPKucj72G6iVwgCfVog6AGGX2uRlZ+ECoFtM78yJfU7jMN2UnBj/BJM2yhLDtAaZTtXntLPA==
X-Received: by 2002:a17:906:1c4e:b0:7c1:49e:6e3b with SMTP id
 l14-20020a1709061c4e00b007c1049e6e3bmr22457885ejg.68.1672253490514; 
 Wed, 28 Dec 2022 10:51:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ba29-20020a0564021add00b0047a3a407b49sm7506892edb.43.2022.12.28.10.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 10:51:30 -0800 (PST)
Message-ID: <97d4e782-c10c-9e3b-28d4-122c4d524608@linaro.org>
Date: Wed, 28 Dec 2022 19:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] memory: Do not print MR priority in flatview HMP output
Content-Language: en-US
To: Mark Burton <mburton@qti.qualcomm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221228130439.80341-1-philmd@linaro.org>
 <SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29@SN4PR0201MB3613.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29@SN4PR0201MB3613.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Wed, 28 Dec 2022 18:51:34 -0000

On 28/12/22 17:26, Mark Burton wrote:
> Is there any chance between 7.1 and 7.2 ‘something’ happened to make it 
> so that Qemu ‘cares more’ about e.g. when memory regions are added/removed?
> 
> I seem to get an abort because a memory region has not been completely 
> setup in 7.2 (while it is being flattened actually) - In 7.1 that never 
> seemed to happen….?

I couldn't find any relevant changes in softmmu/. Maybe TCG related?

$ git diff --stat v7.1.0..v7.2.0 -- softmmu/
  softmmu/cpus.c         | 18 +++++++++++++-----
  softmmu/device_tree.c  | 58 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  softmmu/dirtylimit.c   |  4 ++--
  softmmu/main.c         | 10 +++++-----
  softmmu/memory.c       | 72 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  softmmu/physmem.c      | 36 ++++++++++++++++++------------------
  softmmu/qemu-seccomp.c | 13 +++++++++++++
  softmmu/qtest.c        | 12 +++++++++---
  softmmu/runstate.c     | 11 ++++++++---
  softmmu/vl.c           | 85 
+++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------
  10 files changed, 249 insertions(+), 70 deletions(-)

$ git diff --stat v7.1.0..v7.2.0 -- accel/tcg/
  accel/tcg/cpu-exec-common.c     |    2 +-
  accel/tcg/cpu-exec.c            |  229 +++++++++++++++------------
  accel/tcg/cputlb.c              |  350 
+++++++++++++++++++++---------------------
  accel/tcg/internal.h            |  101 ++++++++++++
  accel/tcg/meson.build           |    1 +
  accel/tcg/plugin-gen.c          |   22 +--
  accel/tcg/tb-hash.h             |    1 +
  accel/tcg/tb-jmp-cache.h        |   65 ++++++++
  accel/tcg/tb-maint.c            |  704 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  accel/tcg/tcg-accel-ops-mttcg.c |    5 +-
  accel/tcg/tcg-accel-ops-rr.c    |    9 +-
  accel/tcg/tcg-accel-ops.c       |   98 ++++++++++++
  accel/tcg/tcg-all.c             |   17 +++
  accel/tcg/translate-all.c       | 1249 
+++++++++++++++++++---------------------------------------------------------------------------------------------------------------------------------
  accel/tcg/translator.c          |  138 ++++++++++++-----
  accel/tcg/user-exec.c           |   59 ++++++-
  16 files changed, 1628 insertions(+), 1422 deletions(-)

I'll have a look at

   $ git log -p v7.1.0..v7.2.0 accel/tcg/

> (Putting it all async work seems ‘excessive’ but maybe it’s needed now?)
> 
> 
> Cheers
> Mark

