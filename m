Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqDeP-000122-Dw
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2023 10:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qqDeI-00011J-Nb
 for qemu-trivial@nongnu.org; Tue, 10 Oct 2023 10:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qqDeG-00088M-6A
 for qemu-trivial@nongnu.org; Tue, 10 Oct 2023 10:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696947826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=AdlA6zmd+l4EvAThsSsw2uLvz/45uLlUwuGP1ADeWuU3gPnakbn3Aj3lxHwnj76TmtfxNF
 5oE+nEi/Z7Djt6RnCKQbnHdDvu3H7VUYTuZLSRDYx2rtJHewWbgANAGTCyWxt2iBUMw11x
 KwtiEuh9xP3u7xf/3DpYojWS5B1J/P4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-apM_cYMKNG27P59aUSfDZQ-1; Tue, 10 Oct 2023 10:23:35 -0400
X-MC-Unique: apM_cYMKNG27P59aUSfDZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-537efd62f36so4591693a12.2
 for <qemu-trivial@nongnu.org>; Tue, 10 Oct 2023 07:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696947809; x=1697552609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=QBPYYG8i8YGFS0IDVE7zdaLHV/v4KPt/6VGHFUFtmY7hedIaRROT2LM8eBl8mbrjoh
 x0fy9v+mUFckKudKmpHJB5edlxENymDXIbluQHaHTLVCwDZ51bMiMe19uMZBCoje2Ubz
 NL1Au1dT1gtdtAgyxb7btZzFZjwFYeU/rz0ZhfCIkvFEcv8PLtzwIOFjhlnvQVRjsPNl
 6aZd3mmFdX81fOsO7l5ztEEDR65AaYuIteliceotkHNv0aaIG2JOmDkFp8VXVG1rKJ98
 rKKllfRHWc0jX5BAoLwP9nWK+e/F/Y5EV7rpLqZESHcjLkzCBGJP1KO9eHg5HDokQarU
 8u8w==
X-Gm-Message-State: AOJu0YxyDAfjTpg5D3PebifSiUiy4+Y3zKHiquuuz7UNahKdyjc/sWM+
 5IKBJcCfsdYjK54C/u5gXPRVYKtw3eC4Xo+HD4wM2RkOwW6uUBOfPll3FmQLs5/49G0GMGlf5A6
 AjfU91pMJfA+HDWPw8Q==
X-Received: by 2002:a05:6402:1357:b0:533:4a9a:b0e6 with SMTP id
 y23-20020a056402135700b005334a9ab0e6mr16877058edw.20.1696947809102; 
 Tue, 10 Oct 2023 07:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1o+8tvERZWL9dJecF2S3JsOGyqi7e03f2hrGDcbO9YmlRcwQ3xim7ACk1HauoR64b88ZcEg==
X-Received: by 2002:a05:6402:1357:b0:533:4a9a:b0e6 with SMTP id
 y23-20020a056402135700b005334a9ab0e6mr16877048edw.20.1696947808804; 
 Tue, 10 Oct 2023 07:23:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 h17-20020aa7c611000000b00534c65fd0ebsm7720218edq.90.2023.10.10.07.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 07:23:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] Revert "configure: Add workaround for ccache and clang"
Date: Tue, 10 Oct 2023 16:23:21 +0200
Message-ID: <20231010142321.264043-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009165113.498-1-luoyonggang@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 10 Oct 2023 14:23:53 -0000

Queued, thanks.

Paolo


