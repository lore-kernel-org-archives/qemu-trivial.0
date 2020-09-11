Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGs9K-0003gp-Dz
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 19:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGs9J-0003gg-0z
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:08:09 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGs9H-00034S-Kg
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:08:08 -0400
Received: by mail-pj1-x1042.google.com with SMTP id gf14so2370863pjb.5
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FFt5QqvzeNr/MSJoRb5TuXp6VUbt0z1qymt7bCxMVFQ=;
 b=Ww4s5iXQSXFQtC/eD5tlMcGzuImwdc+Kx/X00VxyhoszeQ5Fo4PQPJ8vzNAtT62rIg
 ZC/4WaYgCZyzZv3R62se1DZ8wXch1dKk9rmomokcJdQCjwbII/VPI7HUiWY4ZCbK2ScR
 Ja+EjZZsKUT74Ko6PkpMT/ZnfWpipzuQjohAuiDjfasu/uQB2VAHg8C/vggiAIB4VO/x
 VB5v7/RJ/VB+56191jeTLiA1q/9Yyva5ywPPPChsZb1yhh90lKBbP1fIO9NXns8jWG8T
 0mCGyO33DhTmcAh2jZBjn/IUYMSHSglS4Va+evxdNWk83QfmFw9m4yYmLlDaK6MguycF
 qKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FFt5QqvzeNr/MSJoRb5TuXp6VUbt0z1qymt7bCxMVFQ=;
 b=I8TPAo9H5hghkUgWZP01l0R4fySe9EywB64Uxxl6Xgs2GkknDRosNmar++dLpKGJkL
 AQSuJK0VtzGuA286CZFYZJ7RmzCatgYfk7tMecd95n14nVHH2aevl0saXpUmLOjlNS2P
 vVgAqg9h6cqkurHTWD6zl3UuyW9/IZyunyWQCotJ3S7cOnZ24pU+2QIEvHbiTN+KZKDb
 ss8j8+ovYk5vDeaBY+DbOfL1P7G1zyHz2ajCp9OjMuJLlytOoKAJJiR2RenzIQAnlLhr
 yNEblNV7ruvtREcTdWN/wVVEtHIcMRB46jUhYVA/55Ie+yjfrcBqz2ljUkzkMzqugXH+
 CYew==
X-Gm-Message-State: AOAM531Bf6UnX6IPRDQvzZcojmy1SJF0Es5QcgWLk2d8TAU6CmUZX8ZD
 JN4d0i+eE3wpoxNN/1liePvtUg==
X-Google-Smtp-Source: ABdhPJzKUi2SH/U3Xz+cHoQJug1CIDUfbWTLAkeD07yOUACG1J6ODVuYSjGJFfq/PSn0zx1k036Leg==
X-Received: by 2002:a17:90a:4cc6:: with SMTP id
 k64mr4152311pjh.103.1599865686051; 
 Fri, 11 Sep 2020 16:08:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id il14sm2700586pjb.54.2020.09.11.16.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 16:08:05 -0700 (PDT)
Subject: Re: [PATCH 4/7] hw/char/serial: Rename I/O read/write trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200907015535.827885-1-f4bug@amsat.org>
 <20200907015535.827885-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5decc72a-fc28-d2f5-9516-8bb55f2092ce@linaro.org>
Date: Fri, 11 Sep 2020 16:08:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907015535.827885-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-List-Received-Date: Fri, 11 Sep 2020 23:08:09 -0000

On 9/6/20 6:55 PM, Philippe Mathieu-Daudé wrote:
> The serial_mm_read/write() handlers from the TYPE_SERIAL_MM device
> call the serial_ioport_read/write() handlers with shifted offset.
> 
> When looking at the trace events from this MMIO device, it is
> confusing to read the accesses as I/O. Simplify using generic
> trace event names which make sense the various uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/char/serial.c     | 4 ++--
>  hw/char/trace-events | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


