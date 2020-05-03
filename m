Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVIAt-00004y-ID
	for mharc-qemu-trivial@gnu.org; Sun, 03 May 2020 13:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVIAr-0008Uc-Qm
 for qemu-trivial@nongnu.org; Sun, 03 May 2020 13:13:05 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVIAp-0002tu-FR
 for qemu-trivial@nongnu.org; Sun, 03 May 2020 13:13:05 -0400
Received: by mail-pl1-x641.google.com with SMTP id x6so1150827plv.8
 for <qemu-trivial@nongnu.org>; Sun, 03 May 2020 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=osQ7iZFKf5dm9x5QhlN6zbt/yUus595FFcS0GaIK+7M=;
 b=xqYZjtAU0iCKJ2vk5weXX+8qpG5S0SSUBe8gjWLOcrIAMsmrZ7YWh/dniA8gwPhigq
 ocAamQ0L+GFDjY3TAPAd+zzVY7Cz/yZMyt+nmgR8lpv0iDvnJ6mxatz6YVyk+LDIvUEY
 ZxaTxmv1Abag8LNv4AeZivoNYagYVgjC/3XUFjRIF6jYizNd7gDC4W1Gle33IDycp4yH
 9WvH7SgDnLHgW9Qx+ZuTMxPq+rlHo/B1bXVxvIS+qgunapA5K7ChDc6q4ii6XygZnkWx
 6OY9C+XrbhO+t8NWuoCPtl70LMoCHUeD2S+mp+Ou0/69s6GDw9qd14RIU5Cl/r07MJY7
 NM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=osQ7iZFKf5dm9x5QhlN6zbt/yUus595FFcS0GaIK+7M=;
 b=maZCGYYTcM5EmQk3su7VzYd+qPTQpAIBTSnvoI/ci8mu3s1KHR++FOxwUyFKZed1Wb
 bPr8m6yKlv5G69WEKUukPVw2bqTcen07YSaztyiwk8mXvajgvb7rvK73FMopANMDscHT
 DqgTsl1M5qMaraMQaf3PheqGgx24gVDLGvzYCACyq5ioUF0qO9WYBXQpfOj8u3yft3/O
 IMkprorOEpsHm0jCKIvy/SA2lkMwQmIN6fWGwm7SMybfJUmN4Tju7BHjSTyW7EHUd8Lj
 6QYBajVj1duVWFbJ1alT5ZiMR/0/bkpsgZw/rKZJxnxzx83vf9Vxh+LbnrEXrRcU3ONg
 +kYA==
X-Gm-Message-State: AGi0PuZ4riRya+q0WF5LfPgLkx7vglSFXYiavi7Jvk83MTyP6pM/mxuH
 4tom3pV3Br2n8vlYX9Z32ZyhsA==
X-Google-Smtp-Source: APiQypLo9r+yb3PR0sJOjv4my0wOAyY+88CGmcO4+fyfAiZBwqS+k7tIu8oI/CGA+kdgC+j9mv7qHA==
X-Received: by 2002:a17:90a:8c9:: with SMTP id
 9mr11698979pjn.183.1588525981941; 
 Sun, 03 May 2020 10:13:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id x132sm6884890pfc.57.2020.05.03.10.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2020 10:13:01 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] audio/mixeng: Fix Clang 'int-conversion' warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89882847-509d-098e-3379-ad4391ccccb2@linaro.org>
Date: Sun, 3 May 2020 10:12:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503113220.30808-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 03 May 2020 17:13:06 -0000

On 5/3/20 4:32 AM, Philippe Mathieu-Daudé wrote:
> When building with Clang 10 on Fedora 32, we get:
> 
>     CC      audio/mixeng.o
>   audio/mixeng.c:274:34: error: implicit conversion from 'unsigned int' to 'float' changes value from 4294967295 to 4294967296 [-Werror,-Wimplicit-int-float-conversion]
>   static const float float_scale = UINT_MAX / 2.f;
>                                    ^~~~~~~~ ~
>   /usr/lib64/clang/10.0.0/include/limits.h:56:37: note: expanded from macro 'UINT_MAX'
>   #define UINT_MAX  (__INT_MAX__  *2U +1U)
>                      ~~~~~~~~~~~~~~~~~^~~
> 
> Fix by using a 64-bit float for the conversion, before casting
> back to 32-bit float.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  audio/mixeng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

No, this should be fixed properly.

First, the warning is in the !FLOAT_MIXENG branch.  IMO that means we should
not be using floating point at all, and this should be a simple integral
multiply/shift.

I had a brief look at this before the 5.0 release.  The arithmetic all through
audio looks confused to me.  There's a combination of shifting and masking
(implying a scale by 1<<32), and multiplication and division by UINT32_MAX.

I'm reasonably certain that every appearance of UINT32_MAX in this code is an
off-by-one bug, or a misuse of the constant.


r~

