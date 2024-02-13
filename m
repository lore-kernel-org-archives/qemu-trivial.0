Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZrV1-0005dA-8v
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 07:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUC-0005Nm-9c
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:13 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrU7-00015x-CB
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b86bc4bbaso877155f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825716; x=1708430516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gHL9nosvLBVU3E0iohtGPQO+kYcTEquxkRGU1DqD6Xg=;
 b=RKjq14j3HzYDGZJlY3Q6HQu6bQ1jCJu3l4TfeD5jZ+Tc6sQNX/5LuEHEj1hBTDshh5
 YQXIzb+LZO6aqhStw0jOyyPyUNBVDjapIMJ5l0BRcLZj4EnCENrfzBwYWhMOPgk9N+AH
 rWD5z/R4NQ9MHGUiFxGDmz44F+Gw6ApJ8MZ/DuzBHHnhdeUE/fL8ONtRiWzaNJ3tIa5J
 JaxMQ+/9qdbJhbSLKlNgNZ3x0THz9h2uosGYb+vzP6DcCfRDze9J+MvSb9fZj3T9yQ7P
 TD/0Rxa5HKBFTSoonmxKRHHtebfNlQwAJ4v9JqNROv1Y7wJXnzP80/LRw/h2NnguQlMt
 4YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825716; x=1708430516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gHL9nosvLBVU3E0iohtGPQO+kYcTEquxkRGU1DqD6Xg=;
 b=sABXIZZTvAPlNfwiAWHAHrTZF6PlUfL5EOVDtPxK/KCv5KLz7MdWPMjvIYHlNgvZX1
 CqVKel6jdqX4V0o0aPZqUu6P1eI/yAYqzVELAdZ9POzS2jQtn1c/DOFci1J2FqPevdta
 XhvwQUiQo9XCZmVDqUUPVNxW4u7wu1sUZRfzRjV8zjy5PmQllzWeiUOwdV6fKKHm2ZKl
 JaMEgV+jZjs5RLmDFk+SKrhRm6LInC6CftBJ1IqBlY4LHEgXFzG1g6MLoO2Q7qveADOW
 8KgKojFOeREikkNxFWkyCPMMRsk9E/gRn89VQ7H66Scv/RQ/7k3wvHtOYcS1PDm14asK
 mzHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoli2dWMKToEISuOEwC4vFZVuHy095eK9IhvGPTKhdBOgGuN5mZ69CXYVsolK70o/Sm/kKZsdd7KYC0WH6Bh4yThbOh0gQNg==
X-Gm-Message-State: AOJu0YyMPdJSxXmh+4ZbKC2+AqLglSoJWWSrQh8UZcEE5K/KjsdoDhwB
 vZFOr6wRIKAixtKID/J1f7ODRhPYQc8X7P4q+bbTBhyv3YbauwmUl+aEdu4OJB4=
X-Google-Smtp-Source: AGHT+IGqUGKNbCfRcFtJsBpqvudD7CYvDnc3wvFtkLXz+JRHDpiugI2vU5HxmBzYYhtPS5CHSgKCWA==
X-Received: by 2002:adf:e883:0:b0:33b:649a:1aa7 with SMTP id
 d3-20020adfe883000000b0033b649a1aa7mr8130137wrm.49.1707825716072; 
 Tue, 13 Feb 2024 04:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNSHV65KMWpsY0D9m/MVkK03U/Wuw8q9jdJvAMMwNzpZ9iDgBQ3V2YnhLCHJj4bYgowGCxpU0eeEZMxRNZKIrmj+5jQHYVNKbEcx65XJB3AaSZwyx3bhjXbnfinTftb1HtaGgzLFLd6V0obPilvhfYzeHT0SPMS7IzDprwlVkbZlnaqC1mQX3yzNatRQ+5GNKToU3ARzgkCH6RropBkkUQubllGhh4m6Xqct5ebi3reCFQ9aiahWqr2Xdjzk3oAEFRZTsPjR7UBiqSnDmLt+iIiCjKcSt3myxG5kYRzd75lgQ79Xpuc3aEE+U08hfNyAWnhRehZ3c=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d59c5000000b0033b74a3dcf9sm8328903wry.27.2024.02.13.04.01.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 04:01:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] hw/i386: Cleanups around 'hw/i386/pc.h'
Date: Tue, 13 Feb 2024 13:01:45 +0100
Message-ID: <20240213120153.90930-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Tue, 13 Feb 2024 12:02:35 -0000

Trivial patches removing uses of "hw/i386/pc.h".

Philippe Mathieu-Daudé (7):
  target/i386/monitor: Remove unused 'hw/i386/pc.h' header
  hw/timer: Move HPET_INTCAP definition to "hpet.h"
  hw/isa/lpc_ich9: Remove unused 'hw/i386/pc.h'
  hw/i386/acpi: Declare pc_madt_cpu_entry() in 'acpi-common.h'
  hw/i386/port92: Add missing 'hw/isa/isa.h' header
  hw/acpi/cpu_hotplug: Include 'pci_device.h' instead of 'pci.h'
  hw/acpi/cpu_hotplug: Include 'x86.h' instead of 'pc.h'

 hw/i386/acpi-common.h   | 3 +++
 include/hw/i386/pc.h    | 6 ------
 include/hw/timer/hpet.h | 2 ++
 hw/acpi/cpu_hotplug.c   | 4 ++--
 hw/i386/acpi-common.c   | 1 -
 hw/i386/port92.c        | 1 +
 hw/isa/lpc_ich9.c       | 1 -
 hw/timer/hpet.c         | 1 -
 target/i386/monitor.c   | 1 -
 9 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.41.0


