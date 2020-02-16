Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j39Pg-0001z7-NC
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 21:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Pd-0001su-96
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:12:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Pc-0003qH-BS
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:12:01 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41640)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39Pc-0003og-52
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:12:00 -0500
Received: by mail-pf1-x444.google.com with SMTP id j9so6996777pfa.8
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 18:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cb4yQdcURDdIX4q8WdA6bqODiwVHtN16RhHyChu6rSs=;
 b=sCXZJgQmbm9E+YbEwKaJO3rLCq8UD9SYwQFkprWDHNF9cR//vYe1baDUzBGFp9PSFL
 f27f+feBVsk+Vr59vrcxEwbJU4XpEsj8okbMtadIMasi5Bb2cM2BHdsE1JYa21GUYJgp
 wbC31Tb++DMS7msAUwmqilUksnog+3RJndcRMG9wCpy5RB+yY7aTafydkd8X6U/TzVFy
 1xiuAXqoGdzXgqjcKhReompSGAtacxMupg2oTzH1NQKLIuDpK6dXSaZHbuoQYI3q/d9A
 HMW1Jv+3PNjl2/mi7hgeIOvMuZjB1Qelm95D1q0SMZYYTzk5XZMDr6jX8aTYPXyP7vQQ
 F9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cb4yQdcURDdIX4q8WdA6bqODiwVHtN16RhHyChu6rSs=;
 b=a762XGKJDCACsy3QsCpDLwlhMDWXF0SODE8Vpoc7v6pW5MagPhCXf4nmWJYSpCXJxG
 aZjj3/cW3Fl73vMHbldmQRv7pba4aOxrTJ3uW0/Fg4eHa59aU7br2yjE3rrQG/zN7LPZ
 XBS07txHgMCA/bDFVmaclyf8ZVXXZUNO5MxJ6wRvlrw0H1Zr0WrjJYwmYi2bR+tYqUmj
 1zrll88ku5E8K8QJ1hYbPkiTWcUIV12nxzWpiR4Bv23z8mAER9ZX9c6xyv5eyKSv9nfd
 Jvj5FNDdxxSoo37+kKe3vwkKokCzXjWmltId1fqI96vKaj2NdwpDFKtIbaHfURdiI9Gg
 f/CQ==
X-Gm-Message-State: APjAAAVrr2QuUJxul9aqEOhwKhVn3IIZL6p6KqGy0QT1phXEOrl/PjwJ
 hMru3Dllut86Y4e54aiwsp6MdQ==
X-Google-Smtp-Source: APXvYqz/Ppvrsvq1mPWqOgbOiW/1zOMcDc666CxJlxzVTlUi2SeocSK+MbFER18JkspD2zL5JZvN5Q==
X-Received: by 2002:a63:4617:: with SMTP id t23mr11060090pga.444.1581819118753; 
 Sat, 15 Feb 2020 18:11:58 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c10sm11906610pgj.49.2020.02.15.18.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:11:58 -0800 (PST)
Subject: Re: [PATCH 1/3] block/qcow2-bitmap: Remove unneeded variable
 assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz
 <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d501d7a0-c97c-2b88-4387-7b4f48b541f2@linaro.org>
Date: Sat, 15 Feb 2020 18:11:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Sun, 16 Feb 2020 02:12:02 -0000

On 2/15/20 8:15 AM, Philippe Mathieu-Daudé wrote:
> Fix warning reported by Clang static code analyzer:
> 
>     CC      block/qcow2-bitmap.o
>   block/qcow2-bitmap.c:650:5: warning: Value stored to 'ret' is never read
>       ret = -EINVAL;
>       ^     ~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/qcow2-bitmap.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

