Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1libdW-0001GH-U5
	for mharc-qemu-trivial@gnu.org; Mon, 17 May 2021 07:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libdT-0001Bi-Hp
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 07:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libdO-0002bk-2Q
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 07:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621251723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFljbWd4DU7XTa5qfHxcQh0G6vZ/b6k9LAWhOT9skGs=;
 b=E7TZGb0ICHy7kKqRicGSrHVEcFNnnm3TkCfngXFeKmB8Gw3r0OTq3cQ3UR8kjI4bTzLf6D
 kDxGKhu0n1agO7/LH7/KKmSp1QHl8nxQHOuWw/19kYj2H7mTtBCR0FxR1q79Nt4cO94uOc
 Fx8GRGbr6FY8S4yDZXSpxBoSJeVZKBU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-5l3Z4uofNl25ojB91AfHFg-1; Mon, 17 May 2021 07:42:00 -0400
X-MC-Unique: 5l3Z4uofNl25ojB91AfHFg-1
Received: by mail-ej1-f72.google.com with SMTP id
 y12-20020a170906558cb02903d65e5767ebso640977ejp.0
 for <qemu-trivial@nongnu.org>; Mon, 17 May 2021 04:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LFljbWd4DU7XTa5qfHxcQh0G6vZ/b6k9LAWhOT9skGs=;
 b=kc0CJaoQa8O/MFxi/K3gaC0rlkru+YnnFgU8U5+CBwv/LoCvdrZmE5iUEg67r7Yk35
 GVh7GcosyX3388E1CfYR4jlsgOBkcal0rZ5u4LZZHU+yNyLaP1fri10ouk1Fq1io+BGV
 gjyv3Nx0NqFfziv3H6T6hi3W8T/MLmfyG8sgZKxDeggkJDjX5kxFgI5Qx9O6zNPeJxnX
 2i+QrqNI5WoLF1YsyqCVPbzXZDZ6Ox0y3JioVFQCjuTmFdlGuRxgtcs5n4lik8IYMUee
 LykDVEgF5XUimx11tRA9nB0LR4iWD7bcX/9anqRKkHBEFNHcFnFCX7kPK944t/tMMWdD
 iEmQ==
X-Gm-Message-State: AOAM530Djpg63XTYuFi1wNHlcbryEWbSnXCpOMDyLbmhBxjFFAgGU6Nu
 R6jNaLUDGBbWyiMHc700vCAyxth9DEgN8FCCwVo7NwNS9bEKBjnlYaWbGQiHSULZtbYf83HvXI0
 zubrkInVY6TpAnhrlOg==
X-Received: by 2002:a17:906:ad81:: with SMTP id
 la1mr330103ejb.346.1621251719202; 
 Mon, 17 May 2021 04:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPoe/SEshZ5pruI9QrHfN9MJZJzK8M5zJp/i9wZsA5ap0f5Xe2CeQCfW5dFu8Uiakvshs+4A==
X-Received: by 2002:a17:906:ad81:: with SMTP id
 la1mr330087ejb.346.1621251718975; 
 Mon, 17 May 2021 04:41:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b19sm10642396edd.66.2021.05.17.04.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 04:41:58 -0700 (PDT)
Subject: Re: [PATCH] meson: Set implicit_include_directories to false
To: Katsuhiro Ueno <uenobk@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
 <2571b8c3-3e2b-f90e-6077-05232a52c711@redhat.com>
 <CANrJRqLyfijWWbrAwpQLrWuH1-hmraGnx2EQO4GaTH6D1TVxEQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f6be65f-b3d9-c5fd-38a8-c52f9275430f@redhat.com>
Date: Mon, 17 May 2021 13:41:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANrJRqLyfijWWbrAwpQLrWuH1-hmraGnx2EQO4GaTH6D1TVxEQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Mon, 17 May 2021 11:42:13 -0000

On 01/05/21 04:08, Katsuhiro Ueno wrote:
> 2021-04-30 16:48 Paolo Bonzini <pbonzini@redhat.com>:
>>
>> On 29/04/21 04:43, Katsuhiro Ueno wrote:
>>> Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
>>> include file name conflict (usr/include/c++/v1/version conflicts with
>>> VERSION).
>>>
>>> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
>>> ---
>>>    meson.build | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index c6f4b0cf5e..d007bff8c3 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -2129,6 +2129,7 @@ common_all = common_ss.apply(config_all, strict: false)
>>>    common_all = static_library('common',
>>>                                build_by_default: false,
>>>                                sources: common_all.sources() + genh,
>>> +                            implicit_include_directories: false,
>>>                                dependencies: common_all.dependencies(),
>>>                                name_suffix: 'fa')
>>>
>>
>> Can you include the difference in the include paths (the -I and -iquote
>> arguments)?  There are many cases in which we rely on having the current
>> source directory in the build path, for example all inclusions of "trace.h".
> 
> This only removes -I.. (current (top-level) source directory) from the
> arguments. The meson manual says that it also removes -I. (current
> (top-level) build directory) but -I. is still in the arguments (I am
> not sure why). This does not change any -iquote argument.
> 
> As far as I know, this does not affect the inclusions of "trace.h"
> because each "trace.h" is in the same directory as the files that
> include it, and the top-level build directory, which has the "trace"
> directory containing generated "trace-*.h" files, is still in the
> include path.

Queued, thanks.  It looks like "implicit" only refers to the directory 
that meson.build lies in.

It would be nicer to have _all_ targets in meson.build have 
implicit_include_directories: false, since we would have the same 
problem for other C++ sources, but that can be done later.

Paolo


