Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot4DN-0001pU-6G
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 04:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4DG-0001lv-9Z
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 04:51:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4DE-0001g3-CH
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 04:51:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso752154wms.4
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLmYjIaaYY/WnQSGr15pjyedyV5fzY72IBKJBL51+uI=;
 b=KsQZILA6P9R2aJ6nqrjfyMS26VxnikGhNbfSJbJ4bcqlvUE8nJ29MJ1BnLP1Xa7nlM
 qEgk41v8ZK9oC+MV1SA3DhYQPHYb5hlDwWvJV0AQloBxMV2CqqHjoNozUkCKcAyvWcNZ
 tR2A6Vh/X/RWb4ywJ2hOL3t0filnJ/K20g+QKqeEqT9DQ3yCySYmf32GJOPLDHgcdjwD
 qe+/KBByw7zn8ti5LLlf8f375qNEKlP0Bwoxh4Fds4c+8RVCJgLNiWIyk2xbBaZoMRci
 kAJtYpRvSaVjQd1+5it0y3UdnGIJdcVOo4hkm/DdAn7psGi1gpaPlFLFR2CCTwzb9BaT
 yGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLmYjIaaYY/WnQSGr15pjyedyV5fzY72IBKJBL51+uI=;
 b=fOdWmLYgVFnA7VkUP00Q5HYfo0MTTkOeFqzGNqEu6f7Y2xYgnsHr3jzb2+TXF/aQxH
 cQruQCPqbMnNt5c0lVQBSVTFvMuk8jMIolhu2sdfQ/oyOvMK8fgl+wf6rHN1uqv+9ix7
 okUh/Vx/MxVxe2WjPi0TeG7cCUkFlkmuZv2UwHSqxPc0XnU8rbETj2M5wp4fHAMHov4D
 kDb8CD31AB+YB+N0iSF7Cv2Zqh+RhWI1VvD8vF4exsK59WD+zFZdolX7dtT/KK/ulz0s
 c0ub7Ri0BeiAksnel0J373bV0cmcK3TAFkSReHbpjk51sJ4fMYdVrC+W8f+Z4uStG/CF
 594Q==
X-Gm-Message-State: ANoB5pl/Bti8vkv3EgU/yrmOK5itd91sAKnHi1GjpAjp4Ac6d4QaodkS
 dm+f++Add1GCZn0fKc7I8KogpMNDgiwtWA==
X-Google-Smtp-Source: AA0mqf5CEUpON1eBENtxeWzpj+6hgehnsUfGlYOWTYrwLCJh/XyRRYkY38hH4buTuxoLjSVoDfKgqQ==
X-Received: by 2002:a7b:c385:0:b0:3cf:c908:b1a3 with SMTP id
 s5-20020a7bc385000000b003cfc908b1a3mr825037wmj.129.1668073865709; 
 Thu, 10 Nov 2022 01:51:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003b3365b38f9sm5000743wmo.10.2022.11.10.01.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:51:05 -0800 (PST)
Message-ID: <62a21dca-21d3-08a1-e0ad-6bdfefaa9cc0@linaro.org>
Date: Thu, 10 Nov 2022 10:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221110083626.31899-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110083626.31899-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Thu, 10 Nov 2022 09:51:16 -0000

On 10/11/22 09:36, Thomas Huth wrote:
> If configuring with "--disable-system --disable-user --enable-guest-agent"
> the linking currently fails with:
> 
> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'
> 
> Let's make sure that we also compile and link the required files if
> the system emulators have not been enabled.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Refine the file list in the util/ folder (as suggested by Philippe)
> 
>   qapi/meson.build  |  2 +-
>   stubs/meson.build |  2 +-
>   util/meson.build  | 20 ++++++++++++--------
>   3 files changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


