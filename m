Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pD5UZ-0001y0-SD
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2023 10:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5US-0001uf-RH
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 10:15:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5UQ-0004nw-Az
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 10:15:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id ja17so25814483wmb.3
 for <qemu-trivial@nongnu.org>; Wed, 04 Jan 2023 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/nNxWdWpphWsglRXUcAPFMK93J9Ugc9zSKBe0YkUS8=;
 b=AaesFiDIlR3VelsGqsua7PJQ6jjPpCsYfTnEjXVw2hHQjxZ0v/tDbXTiV9DKqqW52C
 mkZsmVbEjr6IX/5HHS2vSH5WS0RhMC1E9d+oIChNlUq9z2gqNhIU8UlEVw3NMK6mJ6/D
 BFiprtwT5hr+A7qnhkWe8hJr2tdK3ls5r/5wkrAC5FufRYry1lrYuwVK9X5TuYnxTxb5
 GX4gpAcPRnt4lhR5jRynRBi2yaCBC76plp34N98zyuTeeRwU65bFh2fl5siHf8oPE/Bh
 TmX0HV7wXL3rDNIy12N6TNZJ2ClcM6oNG8gK2ZAFr7eptWA+wd7qfDBccjjp4mUbutYa
 eKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/nNxWdWpphWsglRXUcAPFMK93J9Ugc9zSKBe0YkUS8=;
 b=NjOhRCW8fGSsugzMA8g+g8sdG9JCl/dJktXNDnCQ0zDNIzvnGKTI9O7xEQMn+4WStY
 WlS2EQJoBxTlnQYrwPOQ4EDdpHhZJzpMmjUw5ORwIT7z13RmhAiN2Jn1Je/dKnHbNtkn
 mgBRbyPf7t1je/2jDypUlHQ7VKjMCteX6gzWEHx/BUpT7NE2Yr+L0YZw1C4JvvTrJW44
 RDId3xxCoAkrzY1SW0ndMlfOCb6aZCQ+ft/EAeWh4VBZLYgyn/MPst8xNsPGUCGG3YKB
 CDYVtVIP85O0k01exmMX6m0dV2QWCp67wkfGiXO7BGF8w2ajqEWTXo+7X8JuC4+map5M
 wWZg==
X-Gm-Message-State: AFqh2kpn+cMI7IUaZCgv5gJJDVgnvPvgMPdNz97xY1I7+2+4xM7eX9oE
 0vPpn2HoQAbVG/YVW5vpzKcx2A==
X-Google-Smtp-Source: AMrXdXv1VjKzmwVQwkMj33FJp5LbXO04tGw1pvgOO52I0mGk5IxTx2IpoK6zXKBDCtm62TULtFGpHg==
X-Received: by 2002:a05:600c:42d5:b0:3d6:e790:c9a0 with SMTP id
 j21-20020a05600c42d500b003d6e790c9a0mr41530932wme.10.1672845335898; 
 Wed, 04 Jan 2023 07:15:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b003b4cba4ef71sm56447551wmb.41.2023.01.04.07.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:15:35 -0800 (PST)
Message-ID: <4c891001-4744-c174-7459-d13903037990@linaro.org>
Date: Wed, 4 Jan 2023 16:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] meson: allow disablind the installation of keymaps
Content-Language: en-US
To: Carlos Santos <casantos@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230102161903.3857354-1-casantos@redhat.com>
 <CAC1VKkOzUsh-EZfwSRbGRC13auykBL5jmszpStw=GHcgx9G6Vw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAC1VKkOzUsh-EZfwSRbGRC13auykBL5jmszpStw=GHcgx9G6Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 15:15:41 -0000

On 4/1/23 15:49, Carlos Santos wrote:
> On Mon, Jan 2, 2023 at 1:19 PM <casantos@redhat.com> wrote:
>>
>> From: Carlos Santos <casantos@redhat.com>
>>
>> There are situatuions in which the keyboard maps are not necessary (e.g.
>> when building only tools or linux-user emulator). Add an option to avoid
>> installing them, as already possible to do with firmware blobs.
>>
>> Signed-off-by: Carlos Santos <casantos@redhat.com>
>> ---
>>   configure                     | 2 ++
>>   meson_options.txt             | 2 ++
>>   pc-bios/keymaps/meson.build   | 6 ++++--
>>   scripts/meson-buildoptions.sh | 4 ++++
>>   4 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 789a4f6cc9..c6ed6a23d0 100755
>> --- a/configure
>> +++ b/configure
>> @@ -889,6 +889,8 @@ for opt do
>>     ;;
>>     --disable-blobs) meson_option_parse --disable-install-blobs ""
>>     ;;
>> +  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
>> +  ;;
>>     --enable-vfio-user-server) vfio_user_server="enabled"
>>     ;;
>>     --disable-vfio-user-server) vfio_user_server="disabled"
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 559a571b6b..be27137e98 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : false,
>>          description: 'try to load modules from alternate paths for upgrades')
>>   option('install_blobs', type : 'boolean', value : true,
>>          description: 'install provided firmware blobs')
>> +option('install_keymaps', type : 'boolean', value : true,
>> +       description: 'install provided keyboard maps')
>>   option('sparse', type : 'feature', value : 'auto',
>>          description: 'sparse checker')
>>   option('guest_agent', type : 'feature', value : 'auto',
>> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
>> index 06c75e646b..7d80c23005 100644
>> --- a/pc-bios/keymaps/meson.build
>> +++ b/pc-bios/keymaps/meson.build
>> @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
>>                          build_by_default: true,
>>                          output: km,
>>                          command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
>> -                       install: true,
>> +                       install: get_option('install_keymaps'),
>>                          install_dir: qemu_datadir / 'keymaps')
>>     endforeach
>>
>> @@ -56,4 +56,6 @@ else
>>     install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
>>   endif
>>
>> -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
>> +if get_option('install_keymaps')
>> +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
>> +endif
>> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
>> index aa6e30ea91..f17d9c196e 100644
>> --- a/scripts/meson-buildoptions.sh
>> +++ b/scripts/meson-buildoptions.sh
>> @@ -11,6 +11,8 @@ meson_options_help() {
>>     printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
>>     printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
>>     printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
>> +  printf "%s\n" '  --disable-install-keymaps'
>> +  printf "%s\n" '                           install provided keyboard maps'
>>     printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
>>     printf "%s\n" '                           (can be empty) [share/doc]'
>>     printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
>> @@ -291,6 +293,8 @@ _meson_option_parse() {
>>       --includedir=*) quote_sh "-Dincludedir=$2" ;;
>>       --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
>>       --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
>> +    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=true ;;
>> +    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=false ;;
>>       --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
>>       --enable-jack) printf "%s" -Djack=enabled ;;
>>       --disable-jack) printf "%s" -Djack=disabled ;;
>> --
>> 2.31.1
>>
> 
> Thinking a bit more about this patch, I think the correct approach
> would be to install blobs and keymaps depending on have_system:
> 
>      [...]
>      install: have_system,
>      [...]
> 
> And use the same approach for trace-events-all, in trace/meson.build:
> 
>      [...]
>      install: have_linux_user or have_bsd_user or have_system,
>      [...]
> 
> This would prevent installing useless data.

Yes, similar to:
https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.org/


