Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rc4PX-0002tE-9f
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2024 09:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4PU-0002sZ-3q
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:21 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4PS-0008Ok-DR
 for qemu-trivial@nongnu.org; Mon, 19 Feb 2024 09:14:19 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so6002856a12.1
 for <qemu-trivial@nongnu.org>; Mon, 19 Feb 2024 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708352055; x=1708956855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4f28WQJxzPl90nyS2MFArA7P4j/F8y7DYz1HQkdfTB4=;
 b=MnqqyGKJA+Z8ThWR0m1IceQBfQDJ6gm9JT++jH9AtPgCvDXwvA1j+meBrvoNUeMvLv
 Kv8mwWbSwLJShXacN7pwaoF1c/a5PBerLwx5vxEHrmI4y19cBT5S7CS6Ps7LwZLHbwMd
 0sno3E5upVVnn/vO3uTlVYNJb1KEX3BK0yKt6H1CHuzAZjXddHh3+NewzcWdDR1hn/ot
 slL7ERth/fMYsMKrOOMLMz+a7KH5YxMKH7tDeYKWYQhjWN2/e7mWy5e+UYhPQufKPdgZ
 Nq1lsvPkg9KKt1gT7KnFj5Cvi3h7dFL5LcYfmfMPcanc8JUTougW8NjFoeoD2szVwNRa
 HQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352055; x=1708956855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4f28WQJxzPl90nyS2MFArA7P4j/F8y7DYz1HQkdfTB4=;
 b=EjChurEpKRAucvouaeq+7T6nHRkyRHpZQkpCbHxSTlCxBorr+nZE/1OnPuQk9pQJo3
 lWNQgkaMLV7av75SRuHuqbHr4LZD9+LvXdQkGEgI5B6NwK/UzuCqlez65oH9635EFwgk
 VCs4JAyvc/8eAv6d9dymQRIfEWQfVO9m9jUBFTEt45gxbnNj8GVSslk0pSSTFaCockbh
 9SL7BGij35ymgzNDw6P1ezOiE0+ur9j3Q+WMKnyQtBsi0Jc+cWClhFDXdfBVGxspbT6l
 cTBlbIl06fXOU/vfc2DvqBi587s1ax3O13oAQlRJUF0Tx4BwnV37hGsdpjiJgaLtw3ql
 1kCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW4j1E4j/WtvBlps+B4bjrVuABSvUghSjJWt05lt23Y1jtx+mRFjeRynNE4nIHcaieFAqX0aACT1RbhmDoNYrQqov/W4Hnxw==
X-Gm-Message-State: AOJu0YyMzqnsZUWlPtj/EQXuSKarDHcu3xztq/fN1nIexdUAJOYmQ8H7
 h9Y2MtvLPzY9Nom6D5+bNpcc2WxKqBYHAtUWOVqqqEbOoLXKLI7tPp/8wmKICN4=
X-Google-Smtp-Source: AGHT+IHMf/+gNQyLvxJ2a/3DhDCfIv9szvwp28V6H52Q6kxy/deFHQghHSt+T+a4d0TnEGn6FgjBrA==
X-Received: by 2002:aa7:d4d3:0:b0:564:1c4e:eb5c with SMTP id
 t19-20020aa7d4d3000000b005641c4eeb5cmr3889072edr.24.1708352055553; 
 Mon, 19 Feb 2024 06:14:15 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a50ea87000000b0055c85e6d75dsm2686671edo.87.2024.02.19.06.14.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Feb 2024 06:14:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/acpi: Include missing headers
Date: Mon, 19 Feb 2024 15:14:06 +0100
Message-ID: <20240219141412.71418-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Feb 2024 14:14:21 -0000

Patches extracted from an ICH9 model rework. Explicitly include
required headers instead of having them being randomply pulled.

Philippe Mathieu-Daudé (5):
  hw/acpi: Include missing 'qapi/qapi-types-acpi.h' generated header
  hw/acpi/cpu: Use CPUState typedef
  hw/acpi/ich9: Include missing headers
  hw/acpi/ich9_tco: Include missing 'migration/vmstate.h' header
  hw/i386/q35: Include missing 'hw/acpi/acpi.h' header

 include/hw/acpi/cpu.h            | 3 ++-
 include/hw/acpi/ich9.h           | 3 ++-
 include/hw/acpi/ich9_tco.h       | 1 +
 include/hw/acpi/memory_hotplug.h | 1 +
 hw/acpi/ich9.c                   | 2 +-
 hw/i386/pc_q35.c                 | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.41.0


