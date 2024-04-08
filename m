Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rtk0g-0008LZ-Da
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2024 04:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rtk0e-0008L3-FB
 for qemu-trivial@nongnu.org; Mon, 08 Apr 2024 04:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rtk0c-0006YC-9J
 for qemu-trivial@nongnu.org; Mon, 08 Apr 2024 04:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712563541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=IfcOSNi7FSDHGZe3v2WIeiJXYIgH/xHA+S8EP99nVfFDdKdEpaOAWwTbNb0e4dLaHcY+Ar
 zGW/cAV17+A17iieWuYsWbifN1FwSU1xK2Z2QUjrcINteLkpKYfYOS977JMnNWMXH34Sfk
 koQz4f9Zzjpp8vXOp2uroYZf8Dj05mQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-uGtTtxJZPFm9M3kUnd0XEQ-1; Mon, 08 Apr 2024 04:05:38 -0400
X-MC-Unique: uGtTtxJZPFm9M3kUnd0XEQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-56e4827e584so1302156a12.1
 for <qemu-trivial@nongnu.org>; Mon, 08 Apr 2024 01:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712563538; x=1713168338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Uqp9xX2FjRI7pQvBdOpjFyYKd3FOaUbLw2Ip4aq7aCHa1ONNk1QD6xr/DS1Uvl2K6f
 EP1jRT110DsXCzC3AJCmv5GQOmxImTV2tmjUbeiRUSLj+YCTYyXYaVuuboqoED//mqCf
 uOxAi46n4zYvIJHxZ+k+zcCgQWuiaGCZofmp/oITd0RPuzpOITclU4E2yTTIe/CGTim+
 qxBdE6t5S+pWbcI1maXo4veYc63kR1jM4ZKAk0sRzLpxeGMrkenYzbMAt8pA5JPpcngq
 BmVCatGTgI37+pLbdZOYnnvWXEch3m7eFZq94GJ76BEt3g0lTNmJa0oJTanJc9GUwPF1
 QpfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUylLyE+b2ArneKD8LI/AuO4llyIoH0HMSg4McSWDNdQd3KlLJmBoCespL7sal1AFwDpXpE9PCfUuhZiQlzJB2wfwvVcyl6dA==
X-Gm-Message-State: AOJu0YwouH5NjxFnpakL49tIJgjzej5iiRMMg7wFB+Wuhl/puUx9GmU/
 RzIXA6ggDUbCvfxkFWpoN/PClsqhcF6UNGJg6On8zQjZmKtJDvk4v/qyYowL6JXiEF/vLYYLmXm
 lhDqGf7IXcCb6peLn0FiGzRERDavSwLdvRDylSaIIjwI5dyUFtxmwY8k=
X-Received: by 2002:a05:6402:4347:b0:56e:2458:eea9 with SMTP id
 n7-20020a056402434700b0056e2458eea9mr6529316edc.20.1712563537925; 
 Mon, 08 Apr 2024 01:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi1lbBQVHIGv5hodqzHPGlXylZA/87iQQBuloMK4PwJEUOKgnOFKL/ORycy/FCysgIRCzCUA==
X-Received: by 2002:a05:6402:4347:b0:56e:2458:eea9 with SMTP id
 n7-20020a056402434700b0056e2458eea9mr6529300edc.20.1712563537637; 
 Mon, 08 Apr 2024 01:05:37 -0700 (PDT)
Received: from avogadro.local ([151.95.152.232])
 by smtp.gmail.com with ESMTPSA id
 k19-20020aa7c393000000b0056bfb7004basm3632166edq.90.2024.04.08.01.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:05:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: Re: [PATCH] Makefile: preserve --jobserver-auth argument when calling
 ninja
Date: Mon,  8 Apr 2024 10:05:19 +0200
Message-ID: <20240408080519.315039-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402081738.1051560-1-martin@geanix.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.355,
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
X-List-Received-Date: Mon, 08 Apr 2024 08:05:44 -0000

Queued, thanks.

Paolo


