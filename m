Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIAT-0007Ek-Rl
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2S-0005rh-M5
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:08 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2R-0005iE-5y
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so6737665e9.0
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734620525; x=1735225325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1hA4CDTNLNW6yvALiotELs/bBcdhAetXzVLsZ7NjS3Y=;
 b=xrWJGFOUrMhfLT4Z4WbirOhYkkRxrii/ZDqvHrlJN2wip8/8e7ISFqF/GpGGAVNbd1
 8XsrD8dh3BF57NGhPFI2zK2No5XbtVBeFu7zCpTTRna499Q8rMkHXhenfo5Vhfg3hFIh
 6nUpSf6NQGIE6r8Moybc3J1JrKHBGpu8jw6guZSQPoJ+2oEv0RuoqJq38dvbM5JvW0Hl
 tLD4OF9gJf4CqG8BOy74pU4GjgJpY6F3zkCRJzNZ/EH5zqiiBVxhNJ9RkYkxDtHEsVZb
 xVyD+oxy7PGPnnpAPXUXUezHIQ9mFkto2hdga0McKe4mbd4GmA/R6GTAsl59kBXzn7kw
 hdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734620525; x=1735225325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1hA4CDTNLNW6yvALiotELs/bBcdhAetXzVLsZ7NjS3Y=;
 b=wRYLa5Hj5XdoJU1K2QNAImWUJYZ+LkxopU03th4hMkdW1dYb656GB6i7lA6BCD1p3L
 fgOAN7SGv4hPqt1T1GuGonmOKC8Dn/CVJyKBo5T/p7xJyUed9URuVRR94TDSb4LpT7jJ
 F2jImWx78m8AWIipPocjR+frkqq5GmBVBatVC5TS1svhyGmyTuompCYywP39dSXoD40Z
 IGWz4sm8GADGC4pQVUofmB3SnRZ+uFrcQG/70QZIhpcS2/PQIok2IkEWQrE345e8QGZb
 dpJyhm3PjShb+2uBHDKGPkM6Gsy/XAVKQu5jlw+QCfJ0suTNzDizaGR3pgvsk6J2dSnd
 ybzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUthA2RfcG2ydK5u2niwh+WrJObh+SgFyys8bZx7rzmSToe9T/A/I0Z/KogYD8EH+i+7nKtTvH08cyX734=@nongnu.org
X-Gm-Message-State: AOJu0Ywh3wUOpt+mNanDeRP2VYK0pT+y0+MQJRx3nmzeJD2LPXvr2mPM
 BLIAggswUOFH+p+y1eY9GpDJWKJTQsHUPK9dRBIycGpuegabKPGFHwOORixF5pM=
X-Gm-Gg: ASbGncvidiLNB8/KorQa1I2Ss5kHwaN8StPzQlFF09i6AEEKxNLoAX3vQMeATDYqrtf
 bqetFZVm1JCSpYyRxgUWxpWfT+9uUsROYArZL0WTfMTwvxd8p5cRyQTGKw7B3OC/sc3JfYEKLXn
 fkvqb2sexqbY+l1CFKcCcSQF8FZDkELemVJciNsvsG7RlIUjFEPaOKX8E1MT9fG3j/7tU9028uc
 tkWedWxRffBG4OpVYa2AZWouN4rBlqZzTUFp+VUmytZuukalFa2bn9LgNcedLrgVD+Iw/K8Jmb+
 R8jR
X-Google-Smtp-Source: AGHT+IGEE0WNMm0p5sIDKltciWNEVYUoAZpLbQLePVw4WNRlti5Dko9+vPSe4P62zhymbqxcKHrppw==
X-Received: by 2002:a05:600c:154b:b0:434:eb86:aeca with SMTP id
 5b1f17b1804b1-4365535c515mr84658785e9.10.1734620525403; 
 Thu, 19 Dec 2024 07:02:05 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a62asm19788135e9.44.2024.12.19.07.02.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Dec 2024 07:02:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, devel@lists.libvirt.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] docs: Trivial cleanups
Date: Thu, 19 Dec 2024 16:02:00 +0100
Message-ID: <20241219150203.55212-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Thu, 19 Dec 2024 15:02:08 -0000



Philippe Mathieu-Daudé (3):
  docs: Correct '-runas' and '-fsdev/-virtfs proxy' indentation
  docs: Correct release of TCG trace-events removal
  docs: Replace 'since' -> 'removed in' in removed-features.rst

 docs/about/deprecated.rst       |  2 +-
 docs/about/removed-features.rst | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.47.1


