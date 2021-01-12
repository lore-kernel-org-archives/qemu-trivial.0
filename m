Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzMl0-0006o6-Be
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 11:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMky-0006lD-NO
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:42:56 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkv-0001ln-Vg
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:42:56 -0500
Received: by mail-ej1-x62f.google.com with SMTP id t16so4385559ejf.13
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 08:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=se55N7CQ83XHL6ASJifdDPQei8CVJYwzFO6U63658XM=;
 b=Q5b8a2hj0vAV0J0T76MwRCmOPzq982ImJPlHkX08ZGhwld6ky16tBBlnNxVt19UJ8W
 SQo8MO9jEHMEN0mHcMyIHau8GvNJTDAigShoSU1AKy7inwD6rd9sbQrCDDrew2y/UjqZ
 khlFnlXt7T69WyAy/+DtETbx7z+IM4MNQ7Wy129BdpROm/AzwXXCWkn42ssM33sLVMHc
 2UvmJVyTn48d+j6ixuwBbqgfE5nBMzr44UNStLx8VA9vMJAmONVbkwOw4sFYagQlKgbe
 Zw76JiX/pUJEQkek546RjttTY5EG8jlfsFilnvPkjp+m1AoY0d0gnKiEYEDb9u64QP2M
 +oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=se55N7CQ83XHL6ASJifdDPQei8CVJYwzFO6U63658XM=;
 b=M3u/lQxjks9kahohgEDAwqoP0g8lP29d3eiGix5Fm4k3JnK5T1CQBO4iDtbAdC2DR0
 ajHIniDy0kIHRA/NaX8VtRkt7ZMs9EWjOducR7teJ3XtqErSj5BmtYAHuhXXlAbxwYoe
 sgJh8mrsuXwXCjOUi/Y0aBrg9xXsy9/2vFvCCwQr7gYAAeQZFA5KJ9XGK1kA9HisCckL
 S/PbaboDR7hbFrtPqw+bX2/bzvVplnmEStKT8ZLSTGJVOQJUU4hIv5B9iy4z/YD9LMcq
 U0EIJUHRd5CdVgpWmJXUmlNpgRbc2x6lI60e+2ryIeyv5OOnU5scsAhcUTHVxoRljz1c
 JP5g==
X-Gm-Message-State: AOAM533Z4tWhXQae79/cIxJrRZLz3LdwroMUVFPUounAouaafJzuWx+b
 qvwghaZ7aV06bpuGU51haJU2NenA4ELl7OQEnqxN4YFaUEg=
X-Google-Smtp-Source: ABdhPJx2pAIarunNcZGwBowmeNdJRIGaQy8thJqWqlGAduF6Z4UM9TczOUzQnqPCz8JzHTFQd1WvPwhbmSzFKBp9NtU=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr3756826eje.4.1610469772291; 
 Tue, 12 Jan 2021 08:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-3-ganqixin@huawei.com>
In-Reply-To: <20210112112705.380534-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:42:41 +0000
Message-ID: <CAFEAcA-Wh97xhmyjjJoD9HKiAhHq7SzuPjUoLWg=j4BPtHmWUw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 12 Jan 2021 16:42:57 -0000

On Tue, 12 Jan 2021 at 11:29, Gan Qixin <ganqixin@huawei.com> wrote:
>
> When running device-introspect-test, a memory leak occurred in the mos6522_init
> function, this patch use timer_free() in the finalize function to fix it.
>
> ASAN shows memory leak stack:
>
> Direct leak of 96 byte(s) in 2 object(s) allocated from:
>     #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
>     #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
>     #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
>     #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

