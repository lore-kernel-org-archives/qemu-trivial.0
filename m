Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njO8W-0000ts-Iz
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2022 12:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8R-0000qJ-QY
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 12:33:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8O-0004I3-9o
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 12:33:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fv2so3569938pjb.4
 for <qemu-trivial@nongnu.org>; Tue, 26 Apr 2022 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujKFz9c+eaKP/cgRXQlqtMJFC8B2x6PXGhembFAaBjQ=;
 b=zlKIeuJmdqpDoUeiM4Iwr6RY3UMG/AQrGpVtMPGbG1gIYXHGks4bxk+8auljJsdqcd
 VcgPfS6EsL/NXLyOIzuQfcKwhWV3x3RKB5X4zjPr6/qKs/RI7pAHmxugsFdnYH9RhPog
 zhrEtlO1HEZYtFUqM8hQpRDjEF5nSi2z0lpnM5mrrF3nQxSCuV2xQ9P+x6IKR5oOuK2e
 BGM0MDTUMroTATfLBF+uxCGvwvAqqF2p6AcoGhHS62tCeLbiEwuB2CwBm21+/J+pGXL+
 yM/uY/rZi5hL/DGn/e2YbsGw8h72+gFWoaYw876byQWWa8yY/IxxFak83Gv4l0z+aFlJ
 ok1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujKFz9c+eaKP/cgRXQlqtMJFC8B2x6PXGhembFAaBjQ=;
 b=ldORUh/Cn1YJ/3vq29Kz4VSqusjEH0w3mCLIp5CGrm96TOg3krTz96NLNaKBIkf/mk
 7miJYP1gspGOsewMZ2dpk44L9OhNcKdoqPmmJ7kR04F+8asR4Ak/WeijoZ5UD096s6Ln
 ZzSklBUQbxUl84FG8SBzYdY8vqvypuPkPl56CMx+kWJ75yfDZhzpHzfHgvcNz2wNWx3H
 1jCpX09oVDrIj+WgNNCzEIWYrlOUWnYxCzyF9sHI0yZIR3d2L6yGo2wiTXiSVkGqZ0i3
 XZPLbE/VSE/JQlQAKQGM+aN+CuUDV+ZkP9Mvq1x8id7j382nCfUbhpW4iixdxoYwP/Wt
 RYGA==
X-Gm-Message-State: AOAM5314Lf7urI9rTu2xQROTNCg250ObZ38PpKjFjnxluLK9745IX32i
 Wvf09rEyxHWCVQf0F9w4vMLPCYOCXSd9Vg==
X-Google-Smtp-Source: ABdhPJy0QMfI+9ci+/AY/tt1PYgvZY7gMNxmk5GvYULQiUFcaD0A6hIVQIR1xt/0F5DQQpO5CCei/A==
X-Received: by 2002:a17:902:b586:b0:159:684:c522 with SMTP id
 a6-20020a170902b58600b001590684c522mr24047557pls.39.1650990830648; 
 Tue, 26 Apr 2022 09:33:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a17090a529200b001cd4989ff5fsm3618195pjh.38.2022.04.26.09.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 09:33:50 -0700 (PDT)
Message-ID: <7790802f-a917-5cb7-3101-f30da4782d85@linaro.org>
Date: Tue, 26 Apr 2022 09:33:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/5] Trivial branch for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220426124610.639614-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 26 Apr 2022 16:33:59 -0000

On 4/26/22 05:46, Laurent Vivier wrote:
> The following changes since commit a1755db71e34df016ffc10aa0727360aae2c6036:
> 
>    Merge tag 'pull-block-2022-04-25' of https://gitlab.com/hreitz/qemu into staging (2022-04-25 13:35:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request
> 
> for you to fetch changes up to 4a89bf188a318592324769bd2bda95172c9a7091:
> 
>    docs: Replace HomeBrew -> Homebrew (2022-04-26 12:40:36 +0200)
> 
> ----------------------------------------------------------------
> Pull request trivial patches 20220426

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Eugenio Pérez (1):
>    vdpa: Add missing tracing to batch mapping functions
> 
> Stefan Weil (2):
>    docs: Replace Qemu -> QEMU
>    docs: Replace HomeBrew -> Homebrew
> 
> Thomas Huth (1):
>    target/mips: Remove stale TODO file
> 
> Yuval Shaia (1):
>    hw/pvrdma: Some cosmetic fixes
> 
>   docs/about/build-platforms.rst |  4 +--
>   docs/pcie_sriov.txt            |  6 ++--
>   hw/rdma/vmw/pvrdma_main.c      |  9 +++---
>   hw/virtio/trace-events         |  2 ++
>   hw/virtio/vhost-vdpa.c         |  2 ++
>   target/mips/TODO               | 51 ----------------------------------
>   6 files changed, 14 insertions(+), 60 deletions(-)
>   delete mode 100644 target/mips/TODO
> 


