Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFwER-0004d2-IJ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2023 06:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwEP-0004Z8-Ke
 for qemu-trivial@nongnu.org; Thu, 12 Jan 2023 06:58:53 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwEN-0002BS-Um
 for qemu-trivial@nongnu.org; Thu, 12 Jan 2023 06:58:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id z5so16782535wrt.6
 for <qemu-trivial@nongnu.org>; Thu, 12 Jan 2023 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NaSs1zavt4EoIUrcZN8lv1cL5KFrHhvM2bvJhBscbnM=;
 b=WEWCDi9AumCTrs5OcnveF8Y0jN5Etc48Vrt+59ZWXjVwHQgvxSK7yAhQqPSn7l5LJ4
 umZSBfomuG+PCEbTHu5s8OMvwsNEEBwlZwCT2aEvVqBG0MU6QBRdIbqy6ivgw42zSUiV
 Gu/qeo/ycXpyOxr+2Jz2o5LJ+oxzuEcJCmtnOPRXCjCEsj9/KWGz6y4vEFiHp2swnhTS
 9QBcW1G0DUpazdxz8zCPoGrw8WuxbHgb1oZxGenYTCuin8RMfaveWjMJC6va5FeyKFwi
 DGzoSadk8IYQoeQ6g1f3xu5YxZSTrHgfHuRILXw8vqmJS9RF8GRIUd9rEbhVxrwPIxOq
 zmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NaSs1zavt4EoIUrcZN8lv1cL5KFrHhvM2bvJhBscbnM=;
 b=q74igsq/Vykpj0f2enXXK6XAKXEZmqnA2EiJ69eCcytdypxyBstrz9hcqKRRV7INYo
 dsuLvi6equdzCfPDllpDLtvCnCJXlNSRzyokHZUx7C1+Oxa1dQeUsL+om23SnAn+haPU
 qfYXO7hZeFCE9ocoZMiPmVw41Ia4WJsC758WnJI3a9haJVD/eWmuQeuPUeVqLVBo1ceQ
 UKB7kvNHEYPUW4Q6UKoOuHs6YlKaHEacqe1ecWZ4QszivPDR15XfR5DgBdeioNxQqWaZ
 kdXKSgeaKgRlrSHPXmEerLGXslWhfB9k4ce5Wm+GEsbG8sFVL3LfUwERcY8gUsdy6uJB
 xgtA==
X-Gm-Message-State: AFqh2kpN1uj6chQ3qJRQlC8S7d07izMeXrbQGAOihXItxoK55DWlJFba
 /UtYT6YdUtBQbbl+H1hT4iNGNg==
X-Google-Smtp-Source: AMrXdXvo05iXthYWJt05DD9nc6DcsCzb7GvkNcVjR1rkmtHrZtGPtv/487epTGmvKy3z22w4SWt6Dw==
X-Received: by 2002:a5d:544d:0:b0:2bd:d84d:bbc2 with SMTP id
 w13-20020a5d544d000000b002bdd84dbbc2mr855656wrv.46.1673524730404; 
 Thu, 12 Jan 2023 03:58:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm16309718wrq.70.2023.01.12.03.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:58:49 -0800 (PST)
Message-ID: <9425e026-e19c-d648-d8e3-71563c686464@linaro.org>
Date: Thu, 12 Jan 2023 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221209113342.61053-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209113342.61053-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 11:58:54 -0000

ping?

On 9/12/22 12:33, Philippe Mathieu-Daudé wrote:
> When using the archive-source.sh script on Darwin we get:
> 
>    tar: Option --concatenate is not supported
>    Usage:
>      List:    tar -tf <archive-filename>
>      Extract: tar -xf <archive-filename>
>      Create:  tar -cf <archive-filename> [filenames...]
>      Help:    tar --help
> 
> 'tar' default to the BSD implementation:
> 
>    $ tar --version
>    bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8
> 
> Try to use the GNU implementation if it is available (from homebrew).
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Supersedes: <20221208162051.29509-1-philmd@linaro.org>
> ---
>   scripts/archive-source.sh | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
> index 23e042dacd..e3d0c23fe5 100755
> --- a/scripts/archive-source.sh
> +++ b/scripts/archive-source.sh
> @@ -18,6 +18,7 @@ if test $# -lt 1; then
>       error "Usage: $0 <output tarball>"
>   fi
>   
> +test $(uname -s) = "Darwin" && tar=gtar || tar=tar
>   tar_file=$(realpath "$1")
>   sub_tdir=$(mktemp -d "${tar_file%.tar}.sub.XXXXXXXX")
>   sub_file="${sub_tdir}/submodule.tar"
> @@ -67,7 +68,7 @@ for sm in $submodules; do
>       esac
>       (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$sub_file"
>       test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
> -    tar --concatenate --file "$tar_file" "$sub_file"
> +    $tar --concatenate --file "$tar_file" "$sub_file"
>       test $? -ne 0 && error "failed append submodule $sm to $tar_file"
>   done
>   exit 0


