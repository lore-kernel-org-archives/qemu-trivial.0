Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxps-00036L-L9
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2025 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxpq-00035z-EQ
 for qemu-trivial@nongnu.org; Tue, 27 May 2025 13:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxpo-0007ui-3F
 for qemu-trivial@nongnu.org; Tue, 27 May 2025 13:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EtStGfeNWEJQSeFkITwyx4E1JjU+3VxgODWaqP1gMIKvbJpSqY9BkmegB1L66G22EoB4JL
 skjFQk1PFy+gEtvgECU3x5+FZXeTHgPa29IRZM/Wkl2Buu8a54AakkJxWNlXb2QpBkNIaw
 e8+EEpy1FFbZ9fSF7QnLy1hCxbpWc6s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-bUTFdm5lMOCl9Nb_ABdvGw-1; Tue, 27 May 2025 13:11:24 -0400
X-MC-Unique: bUTFdm5lMOCl9Nb_ABdvGw-1
X-Mimecast-MFC-AGG-ID: bUTFdm5lMOCl9Nb_ABdvGw_1748365883
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-602e863492cso4416795a12.3
 for <qemu-trivial@nongnu.org>; Tue, 27 May 2025 10:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365883; x=1748970683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=w8zwUn872IEs0D6SrOxrXj5NHNjepBpGaZ3Kes7UxsilCVFmjWfy/qemvfnTvEu1SV
 NUg76GEGZzadNreZxTtCkDXCRQ+5kECHtn66ws7IM02Hdv8ZAKk7dfwNvVgsS5bgVEb1
 cNAA9Ffzg9OnNsqWsgnphe1UpGBR2jSenUUfMtPNPHiE1xoPLo8O9Ux4fkuG28fFsGUd
 h51VVavxB75ElUWgvvFH8yWI6/xKRpeJQZjmGFmzlu6sgk8PFyI0wNLrrTfTyoON2AY1
 vq9fRQo/Nchp857Q+SFz4+5S0IVE/XM1KtQ7UhqkMNonL2s+jyob1qUTS2LkZsA6YjUT
 tZMw==
X-Gm-Message-State: AOJu0YyW7uV6t65x5ICp6PD1Kd6bhDvemrDBWMz9bqQp0sUFjzFglabL
 9xzlbICwGrdYJXMxRev94oh9t8G/sfUq1SEqZbURTq7sKaEkdbdDGfqfOxSkebL0W5IbMw9H1PR
 cuBTujUOxDV1DbzSPq9dusX7uM19ijdZ9aCvajW4TnwbHAbqjfqo87vUVoPM=
X-Gm-Gg: ASbGnct+cYbmil7qDvkUnskwivmj+t4qYBHlBM3d4rN865R5SjfmgbHzXAAx/O3EMN6
 8fBejhKOOkxJXRqKipDIh/Jwx8qqItui5xtjWigq0AprXbtW8Atya/1/LCsI+4MhHj2j+FkwpYN
 hK4Vfds8Cr7BBsOH+Bic9Bayvv+CUbiN3/FXQyKOBy/ORfw1HpMHrpTFsU1hzxHZV8O7OwTyasN
 P+XjsOqk6CGIU9COjv7bSBnNxoBa0xvJu0PMjjU7lAG2DJCHoHrgw1qGBCNO/XXLqjOf8AZH00P
 wgpJx2bHgi8eTA==
X-Received: by 2002:a05:6402:354e:b0:602:14f8:9a2c with SMTP id
 4fb4d7f45d1cf-602da8dc68fmr11848660a12.30.1748365882865; 
 Tue, 27 May 2025 10:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2bN8EfaeSSnLgsU8wZOU7fJNtqLJ+TleDPtD3RopSmXupny3FLXsImJ1bktJ5gTCqZqqpHQ==
X-Received: by 2002:a05:6402:354e:b0:602:14f8:9a2c with SMTP id
 4fb4d7f45d1cf-602da8dc68fmr11848640a12.30.1748365882482; 
 Tue, 27 May 2025 10:11:22 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-602e336e990sm5411571a12.67.2025.05.27.10.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:11:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mjt@tls.msk.ru,
 laurent@vivier.eu, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net
Subject: Re: [PATCH] target/i386/tcg/helper-tcg: fix file references in
 comments
Date: Tue, 27 May 2025 19:11:20 +0200
Message-ID: <20250527171120.1581468-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526114447.1243840-1-f.ebner@proxmox.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YIap2ZzrRtrcwrKOG8QW83GghlH7Jzeh5QF5zN9O1eg_1748365883
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 May 2025 17:11:30 -0000

Queued, thanks.

Paolo


