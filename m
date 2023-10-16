Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qsKor-00063d-4z
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2023 06:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qsKn8-0005ns-KB
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 06:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qsKn1-0002qI-R0
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 06:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697451922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YIYroJ0vkA1VTD75yd/wnTtbIRWmA6jK6eItJAMTuW7MtmWxsAgMh7jV/mDJ3n4JHPzrew
 A/HJnAx7qUN2bNdprQ66YIaVEAbO4C5Qpqfdo/D57ISqjEMuS7bPrWC56z6hIppMWslMgB
 i68nPvy0FGeHRW5Yb9OLwBfddp+BMwY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-AcXEOJbHOpSU71WJvXfbpQ-1; Mon, 16 Oct 2023 06:25:11 -0400
X-MC-Unique: AcXEOJbHOpSU71WJvXfbpQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9b98bbf130cso294050966b.2
 for <qemu-trivial@nongnu.org>; Mon, 16 Oct 2023 03:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697451910; x=1698056710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=UyY9/77mx2TpB1cZKl6Ka7N4ZjANWoPCjebaEh3SGSmn0Woac8YuCoXvpIe1W7BwkF
 90niXBJqF3InB9WCr4B0Borujhel06AuQfgEI9S/j7Hj0nUDedz29+QCrkG5aqfTkhct
 G/fq9/eL+KAqUxuIBZgW70ySYAgc/5ExDKdJTOqSEnM54mFIcPK+NL2pbTIRMShCvsF/
 cDmFbT9Cgh0FXW6iSgdWvXl/Jxtz5j7psVWZdvs+EShoOxC98B0eHLkWfD+BuCafFlrp
 ix0pOe/lCkO5gDRmItQTEn0iIWNL8DQqFXGVuKAfPy/gnHpOMkohRAPNsFoaWxERR8M8
 1JJw==
X-Gm-Message-State: AOJu0Yy5DRl8IPU92US0+6GpmCUpv2jIJICr3vWddh8JRjRNlNRcUsSZ
 BJuMAIh8zqB1AXbM2YvIDIHYNte/D3pJeCn9Y7r+0CTk0rmw+FcyVuAxVvGeCPh4PshU1F2QKue
 guTmj+hb9C/RP7DSwjA==
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id
 ht14-20020a170907608e00b009beef466b9cmr5415436ejc.70.1697451910596; 
 Mon, 16 Oct 2023 03:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd6vtKP/leYs+rsI36lwvYZsKJVtokdagydZ4PZRX+GghwKJR7TPxkmT3rG+JX++S7PHc6dA==
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id
 ht14-20020a170907608e00b009beef466b9cmr5415417ejc.70.1697451910212; 
 Mon, 16 Oct 2023 03:25:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 vb7-20020a170907d04700b009b2ba067b37sm3637617ejc.202.2023.10.16.03.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:25:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] scripts: Mark feature_to_c.py as non-executable to fix a
 build issue
Date: Mon, 16 Oct 2023 12:25:07 +0200
Message-ID: <20231016102507.178489-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016094917.19044-1-thuth@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 16 Oct 2023 10:27:19 -0000

Queued, thanks.

Paolo


