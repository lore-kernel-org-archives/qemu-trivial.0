Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q65ZG-0005AJ-Ex
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2023 04:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q65ZE-00059o-Ph
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q65ZD-00073G-Gi
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 04:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685953673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=L9+kt6OHRNZXf0nmJyBaMPic0F3Eqz2HPeAH8zomNFsWe1bzVNiOH9fvFRN5mIBVfG6ao4
 6GGWaP6PhqagEo1jFIEz1vx9IDqVoDkra/CgDmrmEFf9zJmoNUdFWmca63/tL6u4RpE1bn
 E6Uf6DEF8X24gD2VOAIDKOUW5RVzyuM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336--ctOiT-0MnGtjgoBmsoTkg-1; Mon, 05 Jun 2023 04:27:52 -0400
X-MC-Unique: -ctOiT-0MnGtjgoBmsoTkg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-977e50b0120so33382066b.0
 for <qemu-trivial@nongnu.org>; Mon, 05 Jun 2023 01:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685953671; x=1688545671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=RvIM0b287dPdaRuZpLl/CTjj7Uh8tIh6ce3XOTipeZ59dsoN5IO86pI9g/TdO9NdqK
 SsrBcaaGXvcPO+b0HniB4ucd4lPxXNHBZulWyMjMLHLKzxs0QKs3gpTh+MBwMvUKF5/q
 JE8IFaG6MZa+dS2VENAQirYEklGhY0CT+PLEnmnq7jOC7qqZCD4eG+KFtEj0PYYNx2LP
 uL2S9lWdkAwL099XpilV/TySNQHReAh/7DSVxLLJ32H1lKScr6WFIPuX2hPxZYiokywu
 f33kpDLtvmyBAD7D4XMagBmIRXpcpF0xF5ZtpKOc8wENFlANMsaQ491wh3mxhsMr2aM0
 fqlg==
X-Gm-Message-State: AC+VfDyfZ81M8gNtXIkf8hPqfsH7FLWA4jczWqExp2dFFO969U8DUZ+T
 0iB4O+l7vu7QHDAnJ4YmS5Fv2F+M99Zh8gItRBnNMANkLsP1orrkueOICKmK7NPoN1CaKxwwzLT
 gH2a0ymqAFvV3789keA==
X-Received: by 2002:a17:907:1c15:b0:977:e7ae:4ce8 with SMTP id
 nc21-20020a1709071c1500b00977e7ae4ce8mr796034ejc.39.1685953671355; 
 Mon, 05 Jun 2023 01:27:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uAlhOy85eKiCSPacjp+IaqInqbbgYx9nQW8rSY0cblh5p5aI3+Du1WwPqI05NE5ZIQHSC7Q==
X-Received: by 2002:a17:907:1c15:b0:977:e7ae:4ce8 with SMTP id
 nc21-20020a1709071c1500b00977e7ae4ce8mr796028ejc.39.1685953671212; 
 Mon, 05 Jun 2023 01:27:51 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906154f00b0094bb4c75695sm3990840ejd.194.2023.06.05.01.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:27:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] meson.build: Use -Wno-undef only for SDL2 versions
 that need it
Date: Mon,  5 Jun 2023 10:27:48 +0200
Message-Id: <20230605082748.53989-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602163452.521305-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Jun 2023 08:27:57 -0000

Queued, thanks.

Paolo


