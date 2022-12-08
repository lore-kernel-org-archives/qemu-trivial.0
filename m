Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3KOC-0008KB-Ui
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2022 12:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p3KO9-0008JY-AC
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 12:08:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p3KO7-0003kg-Py
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 12:08:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ay40so1595464wmb.2
 for <qemu-trivial@nongnu.org>; Thu, 08 Dec 2022 09:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXHH0/2Ot0/BzL3xix9wMWxmVvmmV4W5umcIlzr5PDs=;
 b=nDdOmL2EA5NbijInSvKpp0CNF2ax4tb1ti6CgUIFAcslHtcdK7rP1yq01yx24/7ZMt
 L934ETdTBA+/IIHWyqhSafBoZxaVx4SFdnusvEmFmkrAPWoAdsGL16H/7ZU/af8zRnKy
 oJYuHhooARkuLK3wkId3nlNglntLX6E5m+X/y/a5sqwufJSWI7QeD7NTfQplNiM6KgdW
 SfxV2rZtbLoRJFGN3xi3T49hcN/kcnSl40IepdRknM7xvMHY9LKYY55BezjGTIR8cU4J
 qZ2SuMtOShoRkOkYfr5folqsLUum8rGjZfFyNwKaFWQ8/jHsvIfLwCeca+VMKnmfnwjM
 vdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LXHH0/2Ot0/BzL3xix9wMWxmVvmmV4W5umcIlzr5PDs=;
 b=SAjXa1liGqz4gGh17XwO8klvbj+HAZH192jcKUEQGh9A3D12M2iGa/sy3jL12K0Com
 xqN/xbk9oS1418OAy6uYQYfz1CX1gosCHZJKdPmC29H+SYAwih8YPHepgP3OkOC/Q4IH
 DKypqWxFw74iIDPU54q4J5PX7rhgf6m4MdqORbeMNO9rWNjSA6W1zgAp/+pnXy+sjcGa
 2wu21iht3Brk1M8yabkqTMhRYTsg8J/Yk9X48A3IRQYxPbwwDYoRukAVg+yxWEod0aFP
 XsNW/bIO/mUSk1tKIJJYk2P7wnDZanzK3MAGTE5Iid2bn8PTzhxXG7Lj4YKK/XiaUzA0
 3rnQ==
X-Gm-Message-State: ANoB5pmwwDX0I5cAX4KurkDWNqNK+tbXTlHLT3cRtAUjVi+n54ZRdQYi
 iAWVAGMUACf8+pm6R3+HjgA01A==
X-Google-Smtp-Source: AA0mqf4p8WFPpKw14d1sVu0OPKPZyoT90RWAzfosxxGz4Cm4YOIVbeIeVnx81p6HIoq4tX/hqsHuuw==
X-Received: by 2002:a05:600c:5125:b0:3c6:e62e:2e8a with SMTP id
 o37-20020a05600c512500b003c6e62e2e8amr2632209wms.37.1670519325867; 
 Thu, 08 Dec 2022 09:08:45 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b002422b462975sm21700819wrv.34.2022.12.08.09.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 09:08:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B34F61FFB7;
 Thu,  8 Dec 2022 17:08:44 +0000 (GMT)
References: <20221208162051.29509-1-philmd@linaro.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, qemu-trivial@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] scripts/archive-source: Use more portable argument with
 tar command
Date: Thu, 08 Dec 2022 17:06:59 +0000
In-reply-to: <20221208162051.29509-1-philmd@linaro.org>
Message-ID: <874ju5su03.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 08 Dec 2022 17:08:49 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When using the archive-source.sh script on Darwin we get:
>
>   tar: Option --concatenate is not supported
>   Usage:
>     List:    tar -tf <archive-filename>
>     Extract: tar -xf <archive-filename>
>     Create:  tar -cf <archive-filename> [filenames...]
>     Help:    tar --help
>
> Replace the long argument added by commit 8fc76176f6 ("scripts: use
> git-archive in archive-source") by their short form to keep this
> script functional.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  scripts/archive-source.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
> index 23e042dacd..6a710a212e 100755
> --- a/scripts/archive-source.sh
> +++ b/scripts/archive-source.sh
> @@ -67,7 +67,7 @@ for sm in $submodules; do
>      esac
>      (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$s=
ub_file"
>      test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
> -    tar --concatenate --file "$tar_file" "$sub_file"
> +    tar -c -f "$tar_file" "$sub_file"

I'm not sure that is correct. The gnu shortform for --concatenate is -A,
-c is specifically create so I suspect you end up re-creating the
tarball rather than adding to it.

>      test $? -ne 0 && error "failed append submodule $sm to $tar_file"
>  done
>  exit 0


--=20
Alex Benn=C3=A9e

