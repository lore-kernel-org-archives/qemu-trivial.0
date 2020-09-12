Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGyyy-0003sY-Gt
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 02:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGyyw-0003oR-K3
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 02:25:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58974
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGyyu-0004Pc-Tc
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 02:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599891952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYXOz7Jg1YlweMugGqR2U38OSj1tAH5FKWMiCtRy8hg=;
 b=Pb3dsIbb7GFtbsO/uOJIKkLZvbNQEyxq+GqaWAvsr/mUgSYzmw/40Z5mWw4Xi0I3Gh+tNw
 g3mlIrB9jaQ+VhgJwdKcmhn8I6pQ//TMGLBZnD+saWfWXTpztEKngwjcEMP57KcivZC8wL
 4VoXsl7sUlxWSRSrZkBZr4zZKShXJeA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-XgKmW9iUORCvNGDIk2ZBqw-1; Sat, 12 Sep 2020 02:25:48 -0400
X-MC-Unique: XgKmW9iUORCvNGDIk2ZBqw-1
Received: by mail-wm1-f70.google.com with SMTP id s24so2308841wmh.1
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 23:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYXOz7Jg1YlweMugGqR2U38OSj1tAH5FKWMiCtRy8hg=;
 b=hrTdHEEH+WtF40Hz/+lX9Yz2TYDEgSQrw8eU1O8vMwVo1CixjJ1AVf32gavqAXebGF
 h29LQCvpnFUJMBkwELqS4Mqj++cz/v3OiW7/aOxdEiH2N77XOuJTSznivCC5Ge4innQR
 Ww8hCF82/K9wZE0UxFbRiSLTEufPJ33l+oeMhXzk04C0wmieOf3L2t80G0xaP/qocPox
 d+KifQCae2nknjSX71ficxAX8YD9l94OGa5TDp9EHODFLxvtEgyhqRE9Qdc6Bn7wtnUD
 CsMJxxBLcvxwG9S5Mz0ZNPctvSvsJSUbhL2yZUe3ueFpvrzYJirdG6Se82jFiUuVJaSX
 9SvA==
X-Gm-Message-State: AOAM532jExDo4i3c+JtuBtLzMOfYuaxLQiUkiMP+6X9MmS50JU7hU88o
 waZnalVMqaScMG2j3CGcXHVBu/1cJkUfFkxmOxYGzXUk5dUFAALVLUeiNzR0JEH5sylXC/4M5Js
 cdKN9wY/Ojzxq3ytaRg==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr5442770wms.36.1599891946726; 
 Fri, 11 Sep 2020 23:25:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnkJY3rZjPSnXc1zq0f9JxxItZwv6RUV0FiqbKamUh30yOfuoh8aj4IXhcpvefG9ZgS00KSA==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr5442753wms.36.1599891946435; 
 Fri, 11 Sep 2020 23:25:46 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id 91sm9088439wrq.9.2020.09.11.23.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 23:25:45 -0700 (PDT)
Subject: Re: [PATCH v2] Simplify the .gitignore file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200909080305.258961-1-thuth@redhat.com>
 <2fdc9691-2fd6-d453-be45-8140b0afa429@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e2910b67-fd79-ad08-4232-b314b83dcbe0@redhat.com>
Date: Sat, 12 Sep 2020 08:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2fdc9691-2fd6-d453-be45-8140b0afa429@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 02:25:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Sat, 12 Sep 2020 06:25:54 -0000

On 09/09/20 18:07, Philippe Mathieu-Daudé wrote:
> On 9/9/20 10:03 AM, Thomas Huth wrote:
>> Now that we always do out-of-tree builds (and the in-tree builds are
>> faked via a "build" directory), we can simplify out .gitignore file
>> quite a bit.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued, thanks.

Paolo

>> ---
>>  v2: Do not delete the .sdk, stgit and coccinelle lines 
>>
>>  .gitignore | 152 -----------------------------------------------------
>>  1 file changed, 152 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index b6fdd34ddf..5515f595e6 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -1,163 +1,11 @@
>>  /GNUmakefile
>>  /build/
>> -/.doctrees
>> -/config-devices.*
>> -/config-host.*
>> -/config-target.*
>> -/config.status
>> -/config-temp
>> -/tools/virtiofsd/50-qemu-virtiofsd.json
>> -/elf2dmp
>> -/trace-events-all
>> -/trace/generated-events.h
>> -/trace/generated-events.c
>> -/trace/generated-helpers-wrappers.h
>> -/trace/generated-helpers.h
>> -/trace/generated-helpers.c
>> -/trace/generated-tcg-tracers.h
>> -/ui/shader/texture-blit-frag.h
>> -/ui/shader/texture-blit-vert.h
>> -/ui/shader/texture-blit-flip-vert.h
>> -/ui/input-keymap-*.c.inc
>> -*-timestamp
>> -/*-softmmu
>> -/*-darwin-user
>> -/*-linux-user
>> -/*-bsd-user
>> -/ivshmem-client
>> -/ivshmem-server
>> -/libdis*
>> -/libuser
>> -/linux-headers/asm
>> -/qga/qapi-generated
>> -/qapi-gen-timestamp
>> -/qapi/qapi-builtin-types.[ch]
>> -/qapi/qapi-builtin-visit.[ch]
>> -/qapi/qapi-commands-*.[ch]
>> -**/qapi/qapi-commands.[ch]
>> -**/qapi/qapi-emit-events.[ch]
>> -/qapi/qapi-events-*.[ch]
>> -**/qapi/qapi-events.[ch]
>> -**/qapi/qapi-init-commands.[ch]
>> -**/qapi/qapi-introspect.[ch]
>> -/qapi/qapi-types-*.[ch]
>> -**/qapi/qapi-types.[ch]
>> -/qapi/qapi-visit-*.[ch]
>> -!/qapi/qapi-visit-core.c
>> -**/qapi/qapi-visit.[ch]
>> -**/qapi/qapi-doc.texi
>> -/qemu-edid
>> -/qemu-img
>> -/qemu-nbd
>> -/qemu-options.def
>> -/qemu-options.texi
>> -/qemu-img-cmds.texi
>> -/qemu-img-cmds.h
>> -/qemu-io
>> -/qemu-ga
>> -/qemu-bridge-helper
>> -/qemu-keymap
>> -/qemu-monitor.texi
>> -/qemu-monitor-info.texi
>> -/qemu-storage-daemon
>> -/qemu-version.h
>> -/qemu-version.h.tmp
>> -/module_block.h
>> -/scsi/qemu-pr-helper
>> -/vhost-user-scsi
>> -/vhost-user-blk
>> -/vhost-user-gpu
>> -/vhost-user-input
>> -/fsdev/virtfs-proxy-helper
>> -*.tmp
>> -*.[1-9]
>> -*.a
>> -*.aux
>> -*.cp
>> -*.exe
>> -*.msi
>> -*.dll
>> -*.so
>> -*.fn
>> -*.ky
>> -*.log
>> -*.pdf
>> -*.pod
>> -*.cps
>> -*.fns
>> -*.kys
>> -*.pg
>> -*.pyc
>> -*.toc
>> -*.tp
>> -*.vr
>> -*.d
> 
> Yeah!
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> -!/.gitlab-ci.d
>> -!/scripts/qemu-guest-agent/fsfreeze-hook.d
>> -*.o
>>  .sdk
>> -*.gcda
>> -*.gcno
>> -*.gcov
>> -/pc-bios/bios-pq/status
>> -/pc-bios/edk2-*.fd
>> -/pc-bios/vgabios-pq/status
>> -/pc-bios/optionrom/linuxboot.asm
>> -/pc-bios/optionrom/linuxboot.bin
>> -/pc-bios/optionrom/linuxboot.raw
>> -/pc-bios/optionrom/linuxboot.img
>> -/pc-bios/optionrom/linuxboot_dma.asm
>> -/pc-bios/optionrom/linuxboot_dma.bin
>> -/pc-bios/optionrom/linuxboot_dma.raw
>> -/pc-bios/optionrom/linuxboot_dma.img
>> -/pc-bios/optionrom/pvh.asm
>> -/pc-bios/optionrom/pvh.bin
>> -/pc-bios/optionrom/pvh.raw
>> -/pc-bios/optionrom/pvh.img
>> -/pc-bios/optionrom/multiboot.asm
>> -/pc-bios/optionrom/multiboot.bin
>> -/pc-bios/optionrom/multiboot.raw
>> -/pc-bios/optionrom/multiboot.img
>> -/pc-bios/optionrom/kvmvapic.asm
>> -/pc-bios/optionrom/kvmvapic.bin
>> -/pc-bios/optionrom/kvmvapic.raw
>> -/pc-bios/optionrom/kvmvapic.img
>> -/pc-bios/s390-ccw/s390-ccw.elf
>> -/pc-bios/s390-ccw/s390-ccw.img
>> -/docs/built
>> -/docs/interop/qemu-ga-qapi.texi
>> -/docs/interop/qemu-ga-ref.html
>> -/docs/interop/qemu-ga-ref.info*
>> -/docs/interop/qemu-ga-ref.txt
>> -/docs/interop/qemu-qmp-qapi.texi
>> -/docs/interop/qemu-qmp-ref.html
>> -/docs/interop/qemu-qmp-ref.info*
>> -/docs/interop/qemu-qmp-ref.txt
>> -/docs/version.texi
>> -/contrib/vhost-user-gpu/50-qemu-gpu.json
>> -*.tps
>>  .stgit-*
>>  .git-submodule-status
>>  cscope.*
>>  tags
>>  TAGS
>> -docker-src.*
>>  *~
>>  *.ast_raw
>>  *.depend_raw
>> -trace.c
>> -trace-ust.h
>> -trace-ust.h
>> -trace-dtrace.h
>> -trace-dtrace.dtrace
>> -trace-root.h
>> -trace-root.c
>> -trace-ust-root.h
>> -trace-ust-root.h
>> -trace-ust-all.h
>> -trace-ust-all.c
>> -trace-dtrace-root.h
>> -trace-dtrace-root.dtrace
>> -trace-ust-all.h
>> -trace-ust-all.c
>> -/target/arm/decode-sve.c.inc
>>
> 


