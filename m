Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnylm-0002XO-Lp
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 06:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnylV-0002HE-SP
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 06:06:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnylR-0002ZO-N2
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 06:06:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-406618d080eso19561355e9.2
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696413956; x=1697018756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rbs7VzPQpg6YMMP8mDVhDNXZEE7p3sPPqe6A4FLvfPE=;
 b=FqOfPsJWI1MtC0DO/VBfwI7l2WSiRaLq8jwenh6rdFNyFjO+zKHvKHJ3pKhIhCuz4g
 wf58av5JVbbrGj/E4/Dyh3a/bmE7u9GoJoGUMcq58ZBQyKH3wdj7Oap0Yq0cPKoZFr+A
 lt2YSIeBuaKHCmbOplO9tBmA3EnODzFtvXcjc/9FIEGN9+aLwA6MKaZ89+s3RmGQg/IU
 IyPYPCjZX4kvuTWraM8eqNq0+GUU+ZSpspefSDsqtBblRZSuYNyy7D+FeTLSgn2eNGES
 517TFyPCs+JKoORHRbqX4Q9lV9x/oB3LNgL9TljrGRdNYk+XSAnNB08Hw/kvzFoP4GDM
 4FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696413956; x=1697018756;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rbs7VzPQpg6YMMP8mDVhDNXZEE7p3sPPqe6A4FLvfPE=;
 b=MhCDnWjgIYDnQh/Rl+ON5bw7yqF/XA4qe0SIJUMDSNKirsyPBSuv/iho5RJEczy2NL
 Natf8sPrboBhaDCwPHcNsn4Ox9UytxXIvpqKEjkXRKVASGCpic3GUczyjwOsuWZTnrdr
 WNY/QzqmWxjzJDWheeIWbCaUUigRw9N/7DrJ8stycNU5zOq8jMSgESmUodIi6xlAWCbl
 XPHmll8eohp/Y9TmcYXE6iQlSyXmIDfzlPPYc0vlECPQzGUeiUMckLvEpnSYkop0t6UF
 CjwsOQzkMhnr0XoANUv8I00zYM0dm0O9d/SjalxW63Y6deUzpfWH4HhjPH28mQB9oswB
 vv7Q==
X-Gm-Message-State: AOJu0YzzTRCZw9QlKT43iHLhktnASuQXvKNwM/N5uAsZLKL1nn23J/N8
 ayE+Bmf1FOWXN+JgAt3zBc62Vw==
X-Google-Smtp-Source: AGHT+IFSFj65nG8ashhBv1itTK7AUVvUecoXwPzJDZiDkXbBx3y6LzUW91nME1ZE9O+VI2/FAQc3+g==
X-Received: by 2002:adf:f80d:0:b0:31f:fedd:83ad with SMTP id
 s13-20020adff80d000000b0031ffedd83admr1729745wrp.4.1696413955687; 
 Wed, 04 Oct 2023 03:05:55 -0700 (PDT)
Received: from [192.168.69.115] (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 p5-20020adfcc85000000b0031f300a4c26sm3603299wrj.93.2023.10.04.03.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 03:05:55 -0700 (PDT)
Message-ID: <943d5ab9-cb8e-71fe-f230-7be74dbb0b76@linaro.org>
Date: Wed, 4 Oct 2023 12:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2] hw/virtio/virtio-pci: Avoid compiler warning with
 -Wshadow
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20231004095302.99037-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231004095302.99037-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.09,
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
X-List-Received-Date: Wed, 04 Oct 2023 10:06:08 -0000

On 4/10/23 11:53, Thomas Huth wrote:
> "len" is used as parameter of the functions virtio_write_config()
> and virtio_read_config(), and additionally as a local variable,
> so this causes a compiler warning when compiling with "-Wshadow"
> and can be confusing for the reader. Rename the local variables
> to "caplen" to avoid this problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Fix virtio_read_config() function as well
> 
>   hw/virtio/virtio-pci.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


