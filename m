Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keegB-0002at-Tn
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 08:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1keegA-0002ac-FI
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 08:36:22 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1keeg8-0003LJ-R0
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 08:36:22 -0500
Received: by mail-wr1-x443.google.com with SMTP id d12so18678233wrr.13
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 05:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1ubJJlH9rfte8+pUGPT5fJGB+P3KWcyR5Xhz7Eq0wQo=;
 b=Qv/uxgQslJmb+ZD0djxrBv7NMeR7zBpwB4PiRJ0EsU4uezvQvoEUzEkTqgdHxPdSUh
 WOdNbDTegPp6bHxTto+eSsWmCEEH3cX1BgG3TKcqWOQnkAY2m9ZRElaBXZT68aTpcf7b
 YG+bfuPWracV54yEZFctS0I0jBwm4M3+wiRykqioSDvASsi4goGwFFG4yVdAEdVwcBJn
 cwLIr91sp/x+pGnzHnQmwrSJgZMaqVe+5+ZgfkqmuP3E1qMoUV1uRbo9p3ODQr0kZeHO
 /czwXPHetorwxXBMlNIzg+kd6I+igJhJ4v/qqHvaI+jrUnFfv5snW/ZO4D7kVAphJsIv
 /Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=1ubJJlH9rfte8+pUGPT5fJGB+P3KWcyR5Xhz7Eq0wQo=;
 b=NZYfJ4UlLTsjRd8Hoe50FLpOd9ZSrv3E0yknscniCSsN4+Un204VdKPKwZOl4QIIXl
 lweS4JV4H3bkMBaDDXYs1eQvkilL+9fG23uIFJEbB7bj+hDLD0pjIcyv3mPtIeiR5wN6
 IMdWSbgtZRvchJH9/AZIj94JrEU/MbxqxlqsRLvmeRPyS/GfFzXce7EeGal3L5y36vd/
 9lHLWI8tr5+DLxc6zw4CKP9W/HOncaRGvZ5r7hZJ8J2qrTMoSr6QZpMTBUQEiG6jICLu
 fkQ7vIZotbTe71YdOrjY6Puvt/l5SPdfp3CZU4ku1mxufKDsutS7XDQCRut1TT+LggYj
 IBAA==
X-Gm-Message-State: AOAM530jR/5WkgbOtD6IN56MQU2WJVDoKgMJJooVG0f2I5tUVN0VDvaj
 eh8AQm3l5I47768ez60Z2lgtvg==
X-Google-Smtp-Source: ABdhPJxZIChO3DPXHVR9hOQmoAnN1LPQJR99VkoBh31qWTI0kcRylJRbQW3nCdq51Dl1EGx/wTx+Rg==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr19571523wrx.412.1605533779174; 
 Mon, 16 Nov 2020 05:36:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a131sm19683212wmh.30.2020.11.16.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:36:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CB811FF7E;
 Mon, 16 Nov 2020 13:36:16 +0000 (GMT)
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-4-kuhn.chenqun@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Riku Voipio <riku.voipio@iki.fi>, "Richard
 Henderson" <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?= <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/7] accel/tcg/user-exec: silence the compiler warnings
In-reply-to: <20201116024810.2415819-4-kuhn.chenqun@huawei.com>
Date: Mon, 16 Nov 2020 13:36:16 +0000
Message-ID: <87v9e5whin.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 16 Nov 2020 13:36:22 -0000


Chen Qun <kuhn.chenqun@huawei.com> writes:

> When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler sho=
wed warning:
> ../accel/tcg/user-exec.c: In function =E2=80=98handle_cpu_signal=E2=80=99:
> ../accel/tcg/user-exec.c:169:13: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
>   169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../accel/tcg/user-exec.c:172:9: note: here
>   172 |         default:
>
> Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix=
 it.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

