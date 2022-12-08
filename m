Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3LIG-0005mL-5w
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2022 13:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3LIE-0005m6-MI
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 13:06:46 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3LID-0007tW-2b
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 13:06:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id w15so2565981wrl.9
 for <qemu-trivial@nongnu.org>; Thu, 08 Dec 2022 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FkWCgw8KTDMYyTsT29MpQ8HXAmZnFjVvrLN4fandSsk=;
 b=ymDgQgPsnLl1aYhs2nOIr7JRtkjwymVYYtKhiw91ODtGhpfMSIQ1v2MfbLaQUpGEe5
 c5TEnQxju67PxLC4RET5qxrdxu5E1myQ5v5x6A5EwIb8BfQQ3UjWLwFzaGpcpmHtmiRY
 PHo4tfQyGvY6986p3nwh/SFnrj/JSgKpNBX7KJLDJplkNNremJioaIb2H1ZenGO2L86c
 EKpJd9s8BXaLwypTYyPTc06gSgsza72AUkGCfOsyjiCyYtIcHsgoSHbSHtvK//XdcwKq
 3+RGEh+v/7Y/40IRFWb6mHmnmYySfwSa0krEjKJN+J0HR987vAecqrsNi7a+hm7c2TDb
 Rukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkWCgw8KTDMYyTsT29MpQ8HXAmZnFjVvrLN4fandSsk=;
 b=woLZR+nM3sMdUUeDgDsP0VZR3IcUaNtRcLR/UmoGQwWPqF5x1UCHIMMdzmVygwIVnD
 EJtTVu1HhLAm3WcCYkPB4kXPL5nk0tUYiokUKnJMFb5lPYO4eWCgb3Nrw8cOA+EQrt3r
 4yviOICYJqApJyu8hVHgIxxxjTuZkk7ab8CaabJ20DSzgDMXFRu5gUpbr2hBxaH/71mF
 wN3fyB5YN9aCoqylCigs8fXfF8fLDLy619r+9vAMMqz9MTbsiAk89bI4+4puj0qLPC6n
 Yh4049nuYE7MzTywikw7PrJDKF5kC+bd+Bw8Hj+/UlQ5qPz56Y+JVB9gibCZWWEWqUt9
 FlcA==
X-Gm-Message-State: ANoB5pm6VDgNr3P7bgGp0ZOn49NkyDvNv55Ao1qHq58u9x8xRzz/NHUA
 Yw9ka1LQydRCyaJ0mKkaE+vyWA==
X-Google-Smtp-Source: AA0mqf67xNrXijtGgM7kcfbH+hKNohgR1Yj31hi7DbW/U/C8H4JY8+B7VIbYMdeRvTt2KvQQsI4fjg==
X-Received: by 2002:a5d:4b0b:0:b0:241:fd7c:4ce4 with SMTP id
 v11-20020a5d4b0b000000b00241fd7c4ce4mr2082582wrq.21.1670522803181; 
 Thu, 08 Dec 2022 10:06:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b002421a8f4fa6sm22582790wro.92.2022.12.08.10.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 10:06:42 -0800 (PST)
Message-ID: <03745f02-d6e4-aba6-3ad9-e1443934a85f@linaro.org>
Date: Thu, 8 Dec 2022 19:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] scripts/archive-source: Use more portable argument with
 tar command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221208162051.29509-1-philmd@linaro.org>
 <Y5IbuSk3Pnf4cdHy@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5IbuSk3Pnf4cdHy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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
X-List-Received-Date: Thu, 08 Dec 2022 18:06:46 -0000

On 8/12/22 18:15, Daniel P. Berrangé wrote:
> On Thu, Dec 08, 2022 at 05:20:51PM +0100, Philippe Mathieu-Daudé wrote:
>> When using the archive-source.sh script on Darwin we get:
>>
>>    tar: Option --concatenate is not supported
>>    Usage:
>>      List:    tar -tf <archive-filename>
>>      Extract: tar -xf <archive-filename>
>>      Create:  tar -cf <archive-filename> [filenames...]
>>      Help:    tar --help
>>
>> Replace the long argument added by commit 8fc76176f6 ("scripts: use
>> git-archive in archive-source") by their short form to keep this
>> script functional.
> 
> Or install a better tar implementation from brew ?
> 
>    https://formulae.brew.sh/formula/gnu-tar

Good idea, this works for me:

-- >8 --
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..150bdf5536 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -20,2 +20,3 @@ fi

+tar=$(command -v gtar || command -v tar)
  tar_file=$(realpath "$1")
@@ -69,3 +70,3 @@ for sm in $submodules; do
      test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    $tar --concatenate --file "$tar_file" "$sub_file"
      test $? -ne 0 && error "failed append submodule $sm to $tar_file"
---

