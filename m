Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qpkGs-0003Py-HN
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2023 03:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qpkGq-0003Pi-K0
 for qemu-trivial@nongnu.org; Mon, 09 Oct 2023 03:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qpkGp-0000wg-9L
 for qemu-trivial@nongnu.org; Mon, 09 Oct 2023 03:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696834898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DXuOa5atoQi8TRwafvsZXe3dhPW+9P+Z2CMI0XCHNBb3DaS02W6uudhScnB/Zj+aoKAkyI
 dbK1JjC/kiCM6W8fIwq3fMWhSUgk+rRar0lReXvfKq4i01o/4jB6eQCaBqSp2GLE1v3y+l
 JwawMZVg1cmABQp8DjO2xNYX6sD0+lI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-0eHpXhAaPr6Nxj2K17LU1Q-1; Mon, 09 Oct 2023 03:01:24 -0400
X-MC-Unique: 0eHpXhAaPr6Nxj2K17LU1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4065478afd3so27385305e9.0
 for <qemu-trivial@nongnu.org>; Mon, 09 Oct 2023 00:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696834883; x=1697439683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=jBCzZdPpyKbFSoracrewfzUlI7Nomw7zq8X7dJ7UwEtzPgS/i7TOWDP0PQF35cAVKr
 2cRe/eK2bk0N/g+VOXFC85oKp0gS01fZvKy/UBZ1F5L5VGM2vbkqE78RcdzHqOSNX5YT
 xbAi20DTAS+joAl2caxTgAWNYO/hXtRKEznyJcslukJ98gUoUrKtwiFVP/d6g96VUhVm
 CQynJbFBSJhDkE/eFMxSOrrao0r+k4g/UdPIvXp+K2YjvwV8iOafIKvrtunHP063DY+6
 q8p2zX932Xuw6twZmLtC2Cp/vGjCG7BLdnmfrK72LvkRQfAc+u1ubag0+rm6CJnSSJuM
 UIfw==
X-Gm-Message-State: AOJu0YyfLlBIyP0UJ11zCx+Mt7nPZHJEJ1iDh3nDrbf17mgYslyhhqkl
 WZk+lIxMwWpBnv6bvRVGEKju3FlAbIyPbk+1nhBEyQL8Raqe0ktFADGuZLEACGvIVcJpA2Knrde
 +JF2RbjelPorNpPfazQ==
X-Received: by 2002:adf:f084:0:b0:314:a3f:9c08 with SMTP id
 n4-20020adff084000000b003140a3f9c08mr11869743wro.39.1696834883661; 
 Mon, 09 Oct 2023 00:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXBPDB+J1eCaJaqctAUYZlSJvlamzFFkwmxZnEThZ+vv6X4SqaYnQAgqAx7XF5CmKW0/ZBsQ==
X-Received: by 2002:adf:f084:0:b0:314:a3f:9c08 with SMTP id
 n4-20020adff084000000b003140a3f9c08mr11869725wro.39.1696834883335; 
 Mon, 09 Oct 2023 00:01:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfcd89000000b00317f70240afsm8573828wrj.27.2023.10.09.00.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 00:01:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] scripts/xml-preprocess: Make sure this script is invoked
 via the right Python
Date: Mon,  9 Oct 2023 09:01:21 +0200
Message-ID: <20231009070121.74177-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006045256.395696-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 09 Oct 2023 07:01:40 -0000

Queued, thanks.

Paolo


