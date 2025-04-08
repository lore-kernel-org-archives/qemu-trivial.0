Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u2C8V-0001kb-BY
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2025 12:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1u2C8U-0001kG-F1
 for qemu-trivial@nongnu.org; Tue, 08 Apr 2025 12:49:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1u2C8Q-0004v6-UM
 for qemu-trivial@nongnu.org; Tue, 08 Apr 2025 12:49:17 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso12558050a12.1
 for <qemu-trivial@nongnu.org>; Tue, 08 Apr 2025 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744130952; x=1744735752; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmxFs/8Z6wIchrJvUZGs5jv1CY2mwpaOOrLZBmJJhFE=;
 b=aXHBcu2F7lcjpaIZCAJfkmjyB3nuAh2wPTb52gY7vcCcaBEvDnDEr/RRCQ/RFLg9ZN
 EEmnrXt1wlDLtutVAGWlLmCrVWqAbcQr8ES8LR//hqkIZ+5n298LhMD0LVLj735Y+liO
 tiOZjiPg0ZKbsBZlOM0MfX9gBBcncd5ixpvYsmqZ9oQz1zrxfh0S7wz5spnlDYsPdDHK
 kKwPfCyvHsMUj6KnGOMCO42C2jmgIA5as6JIwX95uXa0g+Z6QYkKsJQcghvbQRtLdDnJ
 m0jPt9w2ai6fRLy3pia4hgsFP5D/tzeYYzWragC7BYvawXq/EwpHw+p3ppCUxd+Jc+vG
 j8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744130952; x=1744735752;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YmxFs/8Z6wIchrJvUZGs5jv1CY2mwpaOOrLZBmJJhFE=;
 b=F/pUdNzzkwq4uGM/aFM5k1c7SHLRhah79FSolWyGQyEQLC/sFcpM1omK8TyE5MEBx6
 6gHFBD3PHvZLk9AwJW2sDnAlrdHEL2zoUohbtNrXxwYWjO9F4vn9EYzMHJ/0tCyYN5n3
 08X5RAMSsGaBzyudFu0c13EynGctcTUUocFKX8LPJcFxedtaCPp0cJL0xEDvqyZSjxi0
 3fzptRZWb+MgPQ49ggdoAq0gjekak7BNCCYzd9ObE3OnNlPx0n+JDIS5yCc6ORRFG4t6
 rIBiAVBeBQTd0Ya1vA0av/QSc07WJ1SuM1KugodK/10r8qh/MlGsXV7by0h4iYBbEZJo
 cphQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCIuzXtZKxJ2dxQ853i/pIwxDxIXhxaAkhbFB4AlanNU4a1Ju0M/RLcwbzzV/xly2oJcSNWnPk3pIFk1g=@nongnu.org
X-Gm-Message-State: AOJu0YxG2FMv9TIqTWOnfrFnUaQfF4Y7N378+tlp982WNwqsDJ0abpGl
 FZ7zHNH9zPMfr3Sv2WNa6Pi/nMy/L6Ur8dKEjTiEO7008m44du83hEwUEtSS0NI=
X-Gm-Gg: ASbGnctllpqFrp5AwC0WzXTlQ6ICW3UKo90qIyk0gWzXTVPyt0/2DyqaOIZidz1yt4Z
 fBtsYsX+SgEx1KKI8og6e7NIV6T/3lMtV+bDHoZ9orIk6KnWjBWsYtxittHtbK+Zt5BFTNxKit+
 sDh2qhQ5H6ruDLdPFPsFJsV+oLCep+fiMaHroxWeIXRK1Bb4HLzemOoJJkD1QSRe/IsGhlkzSwL
 hap39eL3ZDOOAyNK5aA9kW1iPSy+9T1BwodjgYnbdFA6SrjM9sR/HeULVANX1vC6g0vJm5+zE70
 vbRfrN3bppRGTuFwXwEy4jywF0dDr3iNMJ9ry4mKsLk5AcI=
X-Google-Smtp-Source: AGHT+IFO6mvFTdo1/lFUW3hl4mz0w2UuNwCf+PBUN0ILwUPJIIMQ3bSNzkZZOHT2axBCnvpqRjX92Q==
X-Received: by 2002:a17:907:7f8b:b0:ac1:ecb0:ca98 with SMTP id
 a640c23a62f3a-ac81a8790cdmr330144266b.26.1744130952294; 
 Tue, 08 Apr 2025 09:49:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c0184865sm919818266b.124.2025.04.08.09.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 09:49:11 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D03DB5F8D1;
 Tue,  8 Apr 2025 17:49:10 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] scripts/checkpatch: Fix typo in SPDX-License-Identifier
 keyword
In-Reply-To: <20250408162702.2350565-1-zhao1.liu@intel.com> (Zhao Liu's
 message of "Wed, 9 Apr 2025 00:27:02 +0800")
References: <20250408162702.2350565-1-zhao1.liu@intel.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Apr 2025 17:49:10 +0100
Message-ID: <87bjt6ha49.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 08 Apr 2025 16:49:18 -0000

Zhao Liu <zhao1.liu@intel.com> writes:

> Fix the typo in the error message to help `grep` the example:
>
> ERROR: New file '***' requires 'SPDX-License-Identifer'
>
> Fixes: fa4d79c64dae ("scripts: mandate that new files have SPDX-License-I=
dentifier")
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

