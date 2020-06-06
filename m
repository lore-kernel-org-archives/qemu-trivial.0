Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhcsO-0000kl-FW
	for mharc-qemu-trivial@gnu.org; Sat, 06 Jun 2020 13:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhcsN-0000kP-8k
 for qemu-trivial@nongnu.org; Sat, 06 Jun 2020 13:44:59 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhcsL-0001m6-BQ
 for qemu-trivial@nongnu.org; Sat, 06 Jun 2020 13:44:58 -0400
Received: by mail-pj1-x1044.google.com with SMTP id ga6so3988501pjb.1
 for <qemu-trivial@nongnu.org>; Sat, 06 Jun 2020 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VI9oT2ndwF7VvgZj9Umnd1iY2byWKqjgY7WtOrfd8SM=;
 b=dC38inu6DapJjYyPEYYMhvIRlba+XNVwBYB7O4orysqz7SyqXY+3i97y52yJAGUD5N
 imqT+O2lGa7Yug/NEyypkQuOqfazk7dQ7yfmRI9+CfFqxITdJUWbJtzkE7kbNJWmvRD2
 neYkAEVmo+sou/rw2w/p/xCOCgUf0d0oN7b5ePa/jXPPtJ8sw8eh3J/kE6pDwKus+Ful
 oY3PiyMfm7QR5a/JB1NayBQecj1/J31Huo1WHmR7+6IvEpgjcufy/bS/vD2TvpE5DqfK
 vTiduw6N9xvVnTpm/+K8JkNd18I9PehpyyC4q9IMi0C/7YxnlXPq5+PtT1dldlsqlsUV
 7eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VI9oT2ndwF7VvgZj9Umnd1iY2byWKqjgY7WtOrfd8SM=;
 b=qxLMgwuuD3RNWTEHwMbDO0ifc5wOJ6oBXiX98Agc86sypndYZyfPi7ZtE9ydfLHKTv
 TR4WFegCE5s8ALejblV/QgEY+q4LflCSh/idtYJDxx+/ZoNl+x6xrc59b0ciMZM7ypJr
 g9Xq/tXK52z3gJPgIKbJkfOjydq6D3b0bATHL14p2cneSvfGVWyl4n94dNzotQZ4FbOD
 66pPpajkUMuKVfcYa2R+G1CmxIvrkm7HzlgqNtLpJnU+PoMoC3L/kGPvSaVuGzHGrN+/
 N4Lt7iyrP9y/Tuye8JlY5t3OIlqdiq2MQ9jz16IPckgs/9EcCUuurNCADAf+qBm5vBvp
 G2eA==
X-Gm-Message-State: AOAM532y6DwZYKPPhJXAy1Yt9GZqzyk/72RLKqRav6BGMcxq4vxFT/7j
 jlKGr4MSznmp0yJC3MmwVpWErw==
X-Google-Smtp-Source: ABdhPJyKroqHqXa4OrfFLCy7G8jYmn3XdAf3MK+XgYdYyOqHBFyKcXETnCQsgw/BZFZQkzeFYMHZGg==
X-Received: by 2002:a17:90a:6f04:: with SMTP id
 d4mr8324880pjk.134.1591465495624; 
 Sat, 06 Jun 2020 10:44:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id r1sm2377268pgb.37.2020.06.06.10.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Jun 2020 10:44:54 -0700 (PDT)
Subject: Re: [PATCH] hw/misc/auxbus: Use qemu_log_mask(UNIMP) instead of debug
 printf
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Fred Konrad <konrad@adacore.com>
References: <20200606070216.30952-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94fe679f-b96c-92cb-e839-d9e68e03346c@linaro.org>
Date: Sat, 6 Jun 2020 10:44:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200606070216.30952-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Sat, 06 Jun 2020 17:44:59 -0000

On 6/6/20 12:02 AM, Philippe Mathieu-Daudé wrote:
> Replace a deprecated DPRINTF() call by qemu_log_mask(LOG_UNIMP).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/auxbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

