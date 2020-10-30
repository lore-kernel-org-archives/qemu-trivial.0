Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYZSh-00084a-L4
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 14:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZSg-00084T-OL
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 14:49:18 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZSf-0001pp-2m
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 14:49:18 -0400
Received: by mail-pl1-x643.google.com with SMTP id u7so1315602pls.10
 for <qemu-trivial@nongnu.org>; Fri, 30 Oct 2020 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QSOyHPfkws29/043P9DzlW3T+ooa6irrXr5ncbzIpUw=;
 b=lQsCgsNI6sQ6PSAC5Lt8mo3XgOqjTLsjQTKIuWISvKMDYjtkhE9s/DRNQq/Xkg9RKk
 IJS3C46xKkthO3GN6CdEAUM01V/sOW2/yvelPijDv1DGJVqq42T/T2lhVKkQbqxxCC5B
 jVFRnFbdQ8X9jbQmVJkB2XeLYno8PQdihV4dnPgjmgqruTTdoGOhbtOpAV7XazKkPzLw
 GHSkSNkIzIlfUSrte+0rSc++KpYeF5/rKkwo8lLTreXtdRVSjUqaKEuMzomHVKzVJXs9
 BDFJl9U/QscLYB/U9ccAmoJNxPQlOU/KzBJUIKbyL5ymtIzIXMzk2MpB/Fc23SdkfgKy
 ouGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSOyHPfkws29/043P9DzlW3T+ooa6irrXr5ncbzIpUw=;
 b=KrQVX5HKrRTCFOSrJloFDowrESviHGbMIb+DRCE3Z30mcKAXQ/XAORGxJDiXQOhNxi
 YcVgaZVcts1ErtJqb1j9LXBPmBd2mZJ+AZMZdd1ogIYaPB313haXDrJKCnCA1dkpdq25
 GI0NZj6FWXRt6x6zonCHZ6ss8zCkhr9VujYzskUYRFxIHQHi+WjlG/FzSbD0BJH73uXY
 Ud8ki3bT8DRcn/f6S+T7MtRTM6hA3hZs/j+dlHHVl+dcmCKD8AfvYdTRIC0xstgF7FIk
 dPsYZONZvQv7eActaB8xCrwM9MhL/mtlzYITa0a5SmeF4WGEkri2KqbYQ8R0I0fR7d9x
 j4mg==
X-Gm-Message-State: AOAM531nYRq3LxoWitawRreooV0HvYjj4b2v9nY+B9J9Jg5Ch/UCGt3N
 KPsCx10M1EL0z9G3rrNX++8rHQ==
X-Google-Smtp-Source: ABdhPJwHvNTs3MDMHXD2TFkoGRjdQQmuzUAW6teVIkTTy+MouU4+L5b3x7PPxi7NC1JtA9cwA/9plA==
X-Received: by 2002:a17:902:ee11:b029:d6:30a7:9e71 with SMTP id
 z17-20020a170902ee11b02900d630a79e71mr10286831plb.8.1604083755575; 
 Fri, 30 Oct 2020 11:49:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id bo16sm4492991pjb.41.2020.10.30.11.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:49:14 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 v2] hw/rx/rx-gdbsim: Fix memory leak
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20201030134918.1518930-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <996efc40-c616-c73a-c65c-ea3ae13e1d5c@linaro.org>
Date: Fri, 30 Oct 2020 11:49:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030134918.1518930-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 30 Oct 2020 18:49:19 -0000

On 10/30/20 6:49 AM, Philippe Mathieu-Daudé wrote:
> As load_device_tree() returns allocated memory,
> we need to free it.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
> Reported-by: Coverity (CID 1432307: RESOURCE_LEAK)
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: NULL-initialize (Richard)
> ---
>  hw/rx/rx-gdbsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 417ec0564b3..d70865962e8 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -122,7 +122,7 @@ static void rx_gdbsim_init(MachineState *machine)
>          if (dtb_filename) {
>              ram_addr_t dtb_offset;
>              int dtb_size;
> -            void *dtb;
> +            g_autofree void *dtb = NULL;
>  
>              dtb = load_device_tree(dtb_filename, &dtb_size);

What I said was, merge the declaration and statement:

  g_autofree void *dtb =
    load_device_tree(...);

but whatever.  You can still keep my previous conditional r-b.

r~

