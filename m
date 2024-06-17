Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sJ6eI-0001w0-BO
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2024 03:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJ6eB-0001uh-8d
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2024 03:19:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJ6e9-0003YX-Mo
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2024 03:19:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35f1cb7a40fso3415559f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 17 Jun 2024 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718608760; x=1719213560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tosoy+FeKPaOtHAoln09Q9INtZ+aN/UG3uTnYhXu0jU=;
 b=VCd/Liynhd5wUi2y4JCFzExdRMhYo3T++yUHcSbkP4bdnWMh7ro1eABIcEnuCeil73
 az2vCyLIoKKxyfKlCzMUw4EJfIEFG/R75GpaRaJEzebsTdmAVV+uDm4W0j6W2M5YlGTL
 iSF2K3s6nSpUAFpLZAG0GQMRld/ez80bsUZi8gFQgrAuNuGe3whqapyZIcvZD+n3loy0
 QM+RIMl8Q0040hQCerEJAmCzb/3RDH2edf/cA5OCNG8s576FuXHbcfOHL4fw2QxJYZzu
 nqA6JodrCT5omaNokJIfnYU243nYZqtvDcQWm4fKzDbLDkcWWJcWCeWBP+ut2ci7ebXT
 +CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718608760; x=1719213560;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tosoy+FeKPaOtHAoln09Q9INtZ+aN/UG3uTnYhXu0jU=;
 b=jFGc2hMoWcGg1speO+t4CAe9u+oNX60i+v0Y2emFOmjTcUjBgqrFrYMLy1kp+/XRke
 Fo6lrHTkr5r64O4XDV36tvkk3OymobQ9GESrJhTU97pgjcxe43YzrMiAItcTK9N4C0dl
 B2PK/abPx/p0UlQiG23eJe0wJStHFDsdTBwXKAl6y5qCseQNx7I8Q9LC+CuYIXEOpBE4
 jQoOErfHpRfqYp4LbmvC7ULqHSaeYZWWzt2zJtolx4fyP9xKNAKY3PjEQFJovVZgPBfd
 48dQylTrNkbNB2Cu5zuR0PGjgPB7YpHmG7hA0zRJIQbPjnB9JB8K8lB1yELxFxHddZz1
 EsqQ==
X-Gm-Message-State: AOJu0YyH0AUTnKd9mcTWZ8V9HY7GfQEBehT9yzRqkAiqSI0LyyVTCJp4
 lt6WGrmK95hCeap5CIywzAlf6lg2PPvehNx+uz2lsDyuh1i0eHeZeLlrggFrSs3y7wkX0YWw2rQ
 Vcpg=
X-Google-Smtp-Source: AGHT+IFIjLMEFpt8qU81fHsFnDEVi+p7kBPZkTO1Gn3MsRQKg+w7TvTOTb/+cBvbzcyxQiAmnNMShA==
X-Received: by 2002:a05:6000:1f8a:b0:360:9b83:2970 with SMTP id
 ffacd0b85a97d-3609b832b26mr413610f8f.68.1718608759920; 
 Mon, 17 Jun 2024 00:19:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.169.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f2489sm11181335f8f.69.2024.06.17.00.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 00:19:19 -0700 (PDT)
Message-ID: <b9ed9c39-349d-4397-9b05-d7faa5b95fa2@linaro.org>
Date: Mon, 17 Jun 2024 09:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] os-posix: Expand setrlimit() syscall compatibility
To: Trent Huber <trentmhuber@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <20240614210638.5959-1-trentmhuber@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240614210638.5959-1-trentmhuber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jun 2024 07:19:28 -0000

Hi Trent,

On 14/6/24 23:06, Trent Huber wrote:
> Darwin uses a subtly different version of the setrlimit() syscall as
> described in the COMPATIBILITY section of the macOS man page. The value
> of the rlim_cur member has been adjusted accordingly for Darwin-based
> systems.
> 
> Signed-off-by: Trent Huber <trentmhuber@gmail.com>
> ---
> The previous version assumed OPEN_MAX was a constant defined on all
> POSIX systems--turns out it's only a macOS constant. This version adds
> preprocessing conditionals to maintain compatibility with Linux.
> 
>   os-posix.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/os-posix.c b/os-posix.c
> index a4284e2c07..43f9a43f3f 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -270,7 +270,11 @@ void os_setup_limits(void)
>           return;
>       }
>   
> +#ifdef CONFIG_DARWIN
> +    nofile.rlim_cur = OPEN_MAX < nofile.rlim_max ? OPEN_MAX : nofile.rlim_max;

Why open-code min()? (The man-page also suggests it).

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +#else
>       nofile.rlim_cur = nofile.rlim_max;
> +#endif
>   
>       if (setrlimit(RLIMIT_NOFILE, &nofile) < 0) {
>           warn_report("unable to set NOFILE limit: %s", strerror(errno));


