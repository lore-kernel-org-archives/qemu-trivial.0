Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t2rMP-0003fK-4O
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2024 08:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1t2rMB-0003e8-6h
 for qemu-trivial@nongnu.org; Mon, 21 Oct 2024 08:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1t2rM9-0006ds-F6
 for qemu-trivial@nongnu.org; Mon, 21 Oct 2024 08:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729513071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YJs06C1sj3aAF4r7wFfhrMWx52mc6/qxyJjh1RMesKjrfrvNAZusGPaTWNbptO3iVHS7kW
 nfcU7QobBz80ecWqk+ChWfC2FfJCEcAgsrc0JZh3Ug5jQZAweoEU1YjsFkXNKMy7kvbLxy
 3hTMEqEvlMmdLMxYL0FTpRpLGbhz7jE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-2I0lnjaXOxKxzb4hOYke_w-1; Mon, 21 Oct 2024 08:17:49 -0400
X-MC-Unique: 2I0lnjaXOxKxzb4hOYke_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-431518e6d8fso30203355e9.0
 for <qemu-trivial@nongnu.org>; Mon, 21 Oct 2024 05:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513068; x=1730117868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=R8ZkoXxu3oicysQ+J64Gm8yTMBny9DBk3Iy2e2Oz04ieuRs5Gn/xDFVRv4v0C5qn8l
 t9r9JVI+TzRIUflkafUMpnA9lzPIbzo46VZi1+WO4E10ky4+xA9n4Ms+TQ2iHqnBuXa8
 NJq0zQbfx7mGH1Vt0HRLHCprfgeIzuDL2txgNwPA9qaa/PvjxOQEbG3gKaBKnOJT7joJ
 ToivqJ94m5+lu4nBv6cFLSFKMEUowTooK1KUh1Oz1wVf284csv0/6Z0vTfrRT2i/zECi
 f/2G3hg/rr/+7CTgdSLCRemjmme7TrFuOB9KfkHxPVzs/9qmVozhOGFLZW5Y0wnmltK3
 pUqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiUk8stgTbPJdDBn/07Gr41M40VKynZDjlTBjG8h0DT7p7gnsT7RIiPPfB/yN/RkQWckESwBV/DMwWfbw=@nongnu.org
X-Gm-Message-State: AOJu0Yz5ePOLugo+gVF5jNb1lhHSmK10ZtBQypUyFP1ERnnmqKeFRtv5
 KmCBaObD/vU6xfETv+Ter0o0nTkQ7gC2h8+7MDXzbQsSGWiLt4dg1khh2X0yNTzHOcnAFphihNC
 S7ML/4qfFakvfjhEcMaNbFCsew0Vl4LifKRqURx2dJVCHTX/6hvDE+Aw=
X-Received: by 2002:a05:600c:190b:b0:431:57e5:b245 with SMTP id
 5b1f17b1804b1-4316169a587mr90687615e9.23.1729513068534; 
 Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt8kOAbSECHosQYvlfaW7ajtEl9YFIqo/DsD9T1Fss1ehzf+KwZ6KweDs1AYWN57Rd2+Tx/A==
X-Received: by 2002:a05:600c:190b:b0:431:57e5:b245 with SMTP id
 5b1f17b1804b1-4316169a587mr90687405e9.23.1729513068155; 
 Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
Received: from avogadro.local ([151.95.144.54])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57ff39sm56863695e9.19.2024.10.21.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, manos.pitsidianakis@linaro.org, pbonzini@redhat.com,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] configure: Replace literally printed '\n' with newline
Date: Mon, 21 Oct 2024 14:17:45 +0200
Message-ID: <20241021121745.74014-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241018120557.43586-1-kwolf@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.421,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 21 Oct 2024 12:18:04 -0000

Queued, thanks.

Paolo


