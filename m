Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPJ4q-0007pP-Ff
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2024 05:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ4o-0007p0-Lp
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:30 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ4m-0003Ac-Hi
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:30 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b447c51bfso567702a12.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2024 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720086505; x=1720691305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FmBxvp/x4PDNZBOKMLeycxjwQekSbVXQLtq0NWh8g6g=;
 b=GaUVS/Y5ylC+wgR4PQN50He/ygxCmHLoosF06mNboOiibL8hu+V/s3HG7L6zXxYEud
 m34oXEYQpWAh90AKlo7DbedgyYqzfjcKkY7cQo4xjq4gSIh4DiQ+zwIgjb1HwhdpyqKv
 BbGvXTrURJBNbcfYxZiwHPEkna3iURr6xHSUOtalTJjuZbpi0pcvv67gN7Duti6LUGbx
 uih1GZqXzmENbDkz0gAHu6wlmnGJyuVBOHPiAwtanZ9otOgTfm6TXv2m3wcucK+hL7eR
 cvbIml6sYSj60QgldA5AGwZV2RHSa3wFCh32JBHXh4wvWklVRaMrf49w/CNxbR/PsB9t
 SFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720086505; x=1720691305;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmBxvp/x4PDNZBOKMLeycxjwQekSbVXQLtq0NWh8g6g=;
 b=ZafY+7mH6T3AXEF4i4R6vVwjNWc+9msnyE5cr2AQYjqj6EJY6X4LmVXb8mMqHW34Ob
 6Fn+pKNJ5Bg302D3RM96393sUq3AjZsBc3Pw3dv15bv7wH3z9wFQrpbeyyaAUC1eWrSi
 LSNqPdzAVv59Mt534LCmMo+SlPve/1JUo4Q21iDgIZNfTpZUVYJ0TfbS+96kplmeQPuc
 w1j69FwwbhqXEU+dDh3eoT7J993mdvditU1aLvm3bpFT2qWt+ac9ArOUt68cV0wBVsc2
 sORIUp/STPyXr7jcJgyAAZApA8ZZj6tIIcwNdU3RM3qGZC/dxQ9BC5Rr8ppr4WLpsL18
 qWew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkIg5FwY8xUg3IsvdwJ0J72tWaZAl6x6CJeKNvqLGkB5BklbpCkl94nso8DKlAt7CdYufrefaAktysBW6HgrsQZQCMydZwbA==
X-Gm-Message-State: AOJu0YyfGv5SEglHNcQnLC7aiCbUhWShbfwPII+lVanjitZvGYGuzGUr
 5BwxHSOf9aWT70Exl+zIAyr1SLVlCgwPBneTAc5XwkyTKldm73uyO6AHp/Y8TiM=
X-Google-Smtp-Source: AGHT+IG8xsyIDIE1bBw2LSStgN9E8h2S3yiuZzMmI5ZWr1EIU2rHg6HHSeSD+ppYajFTjHWfbvNQXQ==
X-Received: by 2002:a05:6402:40c8:b0:58b:d7f2:eef3 with SMTP id
 4fb4d7f45d1cf-58e5965a9femr816946a12.12.1720086505076; 
 Thu, 04 Jul 2024 02:48:25 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c8371dsm8241771a12.9.2024.07.04.02.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 02:48:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E67215F839;
 Thu,  4 Jul 2024 10:48:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/4] util/oslib-posix: Fix superfluous trailing semicolon
In-Reply-To: <20240704084759.1824420-4-zhao1.liu@intel.com> (Zhao Liu's
 message of "Thu, 4 Jul 2024 16:47:58 +0800")
References: <20240704084759.1824420-1-zhao1.liu@intel.com>
 <20240704084759.1824420-4-zhao1.liu@intel.com>
Date: Thu, 04 Jul 2024 10:48:23 +0100
Message-ID: <874j95pjx4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Thu, 04 Jul 2024 09:48:30 -0000

Zhao Liu <zhao1.liu@intel.com> writes:

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

