Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfu05-0003Nu-J3
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfu02-0003Lt-HC
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:37:47 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzy-0006PM-OI
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:37:45 -0400
Received: by mail-pg1-x544.google.com with SMTP id p21so4190374pgm.13
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=FatqtVOR5hD/fcjlHQiJxex0C6zQusiasYEb/yEipsUHJ8XYLQsy5xfoCZP0e+yu2k
 iuyeevu0q7AhEwUlWsJu32GG5SazukklQ7e67apLyPFjt5a/kRoa7XobmxW3KegBIMKP
 ENP/BSizdgxJ2u8Tvh8iFJAyCgLU5iLwR4aQ1m509XvSedk9+fo6MComm8rgpnGt+o0N
 Q98WvROsPGMZBjMcvm6JrmLaNrnVanswonOdPV+SMxS43AgLRfuApjZXh5bhpv+tDGdz
 MMCTMQ66HTYSfiIMqxA5Ki+niSFNrxoUK9Dpm02g07u76J4kojC7ItRwfO6gs62s6NM6
 DARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUapqzqKD/nil8AJP/KRmcd5zCFEf0jfxXrXYdNEGQI=;
 b=j5VGYl89OOC270w2jCbKKtUySpvIDNTDYc64ZZtJjiWWCOKpDy6Wv1cPat/JadCCDD
 wyahBPwNWYpPaJ8xBD/SU70XeByr1ap9DaDtD/3EPyKOySXX0PgO6QAYNZUxxpbOaFnK
 872W4FQYP3K9PPNGIrIFyVPqoC3ST/54TYybBPcSGUdpC22lEYb7CrVuQs6MApsEjff+
 JF9DE2CnXwOGAh4IwkVE7TJeAPZSXHtgShud6ApJ0t8PXWxwi+Vugio8mp3gKWkwVOan
 sV+3uKEwECByJjJnh6Yj89BkokmgX/Px20h0s+pXVqLJGUOFaF9PBhuZ7mE6vSE9n9VN
 68jg==
X-Gm-Message-State: AOAM532fgpVKRs1nC3GdCxSq/GTO54ffKo4qVrBHfXBWFYp0Zt5XSUk3
 h1LWzCPALj8sIs67IcjN1hih1Q==
X-Google-Smtp-Source: ABdhPJxhd+PX2dAfPlV44Fx/pz/N3NFXKQtVkApW6bgZq/7EFs6cRCLgC6WvnR+4RiTgTsBqwCGGXQ==
X-Received: by 2002:a63:6345:: with SMTP id x66mr20915001pgb.156.1591054659488; 
 Mon, 01 Jun 2020 16:37:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id g19sm415680pfo.209.2020.06.01.16.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:38 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <403c7efe-bfa4-c6e3-7ab7-0592bc16bfc8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 23:37:47 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


