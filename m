Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omrG1-0005GS-SI
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2022 02:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omrG0-0005CG-Lq
 for qemu-trivial@nongnu.org; Mon, 24 Oct 2022 02:48:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omrFy-0000hu-U9
 for qemu-trivial@nongnu.org; Mon, 24 Oct 2022 02:48:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id bu30so14587543wrb.8
 for <qemu-trivial@nongnu.org>; Sun, 23 Oct 2022 23:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ai1ej37o9Hc4blbbw1ItSj94465SUXhgj2+sX0zsi70=;
 b=lnO1GnOQ6ikEQ7BTDT/MS85rsUC7O0Qly+usCLldr6siPRC+SNMRjic7jLELG86O8R
 Oi9JW8nDQRRf+8hnM/7uHqWvjUBd+d+/I6cs1/UXYZM1RNmCTm7rMJIjznJJd+xBhH8v
 gMH4li/Xdg1WF2K113QNofJF3z77olQR2uSED2UegR9qjDcRggaidDh4tJ/DulFRfZJ9
 yJkRrvzfmshcpR4nSZsYRmTOQRAAGeHa8xqrcOTu2vl1P/BmiDuilBhoDgNl/oQe+l3i
 Oy3nN5Dkyu4RFrDOA2ieEC5giDHAsLfiC27SOCLbPuTJv4qVAT/Q7nhryjgjmJKT/DHo
 l15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ai1ej37o9Hc4blbbw1ItSj94465SUXhgj2+sX0zsi70=;
 b=nYsljApO65S9/bg8YOYdnQCWYu5DHEiBOFMdGcvA04Um3EoPoXAxPmNecor/Gwj8pN
 jr44d74R/n5oztfNXk9LCqFOxT8ZHriW5jpTofwCv5dZZcww9lypxfneX4ISdU46y+Ei
 WGVrthRynnLE/048wYTS/kO1Gn5vnEmzDF9n63fNPWMcRHkvmBnepQeOcvPCHZqE5UNT
 k5pSJnlMQclnzZeg9d8Jl+bOJi2H08DTqWH0NIFMxuLcq9WJTzno4oQU3KFwPwCVjcij
 N2/V2pxN/2KAkiscM6NahCRoxKFRaR9uAPZZHurhE6vQzo2lHWskAAsee4qZes/+24FZ
 JJJg==
X-Gm-Message-State: ACrzQf3jnueNVoh3xP/L/Af5Di0/0ifTZNgCQJsiJyAXk6oeOaKSXsUQ
 P8wE6K5/w83OVRbiGS7sIsMbYQ==
X-Google-Smtp-Source: AMsMyM72OPCKnPFtkcMLwDKciusoCpI3XTboVC47HY6VuktKgA7I3THdw6Nuked/Dotvr5FFlhtpTg==
X-Received: by 2002:a05:6000:69b:b0:22e:36aa:5f1 with SMTP id
 bo27-20020a056000069b00b0022e36aa05f1mr19767017wrb.430.1666594095508; 
 Sun, 23 Oct 2022 23:48:15 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003c6c182bef9sm9202775wmq.36.2022.10.23.23.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 23:48:15 -0700 (PDT)
Message-ID: <814a7987-dece-6fc5-0bae-06b72c202b0c@linaro.org>
Date: Mon, 24 Oct 2022 08:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] ui: remove useless typecasts
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20221022141204.29358-1-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022141204.29358-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Oct 2022 06:48:21 -0000

On 22/10/22 16:12, Volker Rümelin wrote:
> Commit 8f9abdf586 ("chardev: src buffer const for write functions")
> changed the type of the second parameter of qemu_chr_be_write()
> from uint8_t * to const uint8_t *. Remove the now useless type
> casts from qemu_chr_be_write() function calls in ui/console.c and
> ui/gtk.c.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   ui/console.c | 2 +-
>   ui/gtk.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


