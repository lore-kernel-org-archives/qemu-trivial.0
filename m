Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uDPeZ-0005ml-Uf
	for mharc-qemu-trivial@gnu.org; Fri, 09 May 2025 11:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDPeV-0005da-RS
 for qemu-trivial@nongnu.org; Fri, 09 May 2025 11:28:43 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDPeT-0008Kj-8H
 for qemu-trivial@nongnu.org; Fri, 09 May 2025 11:28:43 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e6dd991a0e6so1955695276.1
 for <qemu-trivial@nongnu.org>; Fri, 09 May 2025 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746804515; x=1747409315; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fm+ll4+BV5oVu4s3b2y9Tr8jYcVIflrqUCDYZvDl7K4=;
 b=sJqZ9h/4xfByWcy9qTF6ArQqq6GBMXnz+J+psgAZJiOZMVjUN9f9HKIYZjiHGhGR6+
 l9rcLGPfNwUrgteFLEK5TFN85zhFzAu29Cimq+Ml/8zDFIN3mw6Hn24ie4XbB7j+aTIv
 GONc42rQKlbcmZ1vDv25RT04KAvL5hiiGRYmmIX4pGrKemVXdbwu4rENSa6UVWHKkGWo
 04fwL285MF2WzTYnflRKVIUcijwbcKw9Y7dAqdzAd6aStBaVv0vACxx3r0AIzAe6febh
 or/28gkOHQYe7d/abLbPkiLzc+BozFOwy0XiK/6z3bqujpETtiH3UQx6o95wJQNvvRD0
 xe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804515; x=1747409315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fm+ll4+BV5oVu4s3b2y9Tr8jYcVIflrqUCDYZvDl7K4=;
 b=ull+k/uvEfzRKnJpSFKjqouItACLZLk8OSBa9QwJPJSiMQ+LB2XUVTdWFQGQGgzBLz
 HN1o/ZVcPogdRWU7LoSTS2xY28Fy+lOthWESLf/hLGkUnr2tCx226RUL316iIgFgOjK8
 Ah/noPzkJxzZvQg12JHxfQaPn3eBeYAXP8TCBJma+AhL2vHk7Ys2hZjm4PDxNSjundqG
 dSgwVcMakU2UO3cKOXvnRKpG21NzjBNAdNvA9ITUJPNU2LSMrLvphk548OtMPZcwY241
 aX4ZIzm6nvwURyx1jTgV/ssYIpWL+P1mqvAGPQWAvMG/hx1/OGyXW2sZN3c+s/0ysDrO
 0v4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6tq5p+5XocR9XrTvWPTFHq7SazH/0Q9A9robevSzdyRobopWbS6C0CqDoGOYWvJxAxDApf6px1jcidW4=@nongnu.org
X-Gm-Message-State: AOJu0YwCCABpAYZCo0xD2fKk1/JO0JfHVXXsVuGmzSno2D2B/T2fwEnh
 BskGAxrC/EtVEffJ2uSnYIKzah530/ljcLnQ4b0Z4lNdPq7eD1x+mvXmCtbxFoRj+itJFtGfpPa
 pengTn9IZPi0hLP5idpQavJPDguU2tQgsbyHSkwdDjvjvoaun
X-Gm-Gg: ASbGncutJYbZqVoRz4tAsaZdL5UFk1NPTWt4jkRSLBST3Vr2PJSpV/mH2wrZ+amIBQO
 nZTRrl3M63DRPfnYYWHYfp1xRD5UyjvjA00iso/09lfhrD3F3vP+IKv4BNcj5y3E0Y32aycrEqX
 gDuBxF/H8YnZNJim36JkVmuKM=
X-Google-Smtp-Source: AGHT+IENDeYY9LBNvez25bPsLlT8ghYueLU0289NgzWNF4aZ7khnipyWn4o+ih6GSWfhAKK7XFPyLFyyVL0g7PneVOM=
X-Received: by 2002:a05:6902:2008:b0:e78:f073:b378 with SMTP id
 3f1490d57ef6-e78fdd90486mr4946072276.43.1746804515542; Fri, 09 May 2025
 08:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250509152201.19085-1-gustavo.romero@linaro.org>
In-Reply-To: <20250509152201.19085-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 May 2025 16:28:11 +0100
X-Gm-Features: ATxdqUGglpZndWYFS-wY94E5MDXRisbnNbKOoJOLAxrY6etxDsaL5hHrNrRI2oE
Message-ID: <CAFEAcA9p5GY2eQkLi41h_m-r2-g=T6eE8vGsza3933rejeB72A@mail.gmail.com>
Subject: Re: [PATCH] docs/devel/testing/functional: Fix typo
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 09 May 2025 15:28:44 -0000

On Fri, 9 May 2025 at 16:22, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Fix the duplication of the word 'run'.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  docs/devel/testing/functional.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
> index 8030cb4299..9e56dd1b11 100644
> --- a/docs/devel/testing/functional.rst
> +++ b/docs/devel/testing/functional.rst
> @@ -274,7 +274,7 @@ speed mode in the meson.build file, while the "quick" speed mode is
>  fine for functional tests that can be run without downloading files.
>  ``make check`` then only runs the quick functional tests along with
>  the other quick tests from the other test suites. If you choose to
> -run only run ``make check-functional``, the "thorough" tests will be
> +run only ``make check-functional``, the "thorough" tests will be
>  executed, too. And to run all functional tests along with the others,
>  you can use something like::

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

